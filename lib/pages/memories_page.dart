import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/drawer.dart';

class Memory {
  final String title;
  final String imageUrl;
  bool isFavorite = false;

  Memory({required this.title, required this.imageUrl});
}

List<Memory> memories = [
  Memory(
      title: "We meet second time together",
      imageUrl: "assets/3-in-school.jpg"),
  Memory(
      title: "Great moment in metro station",
      imageUrl: "assets/4-in-station.jpg"),
  Memory(
      title: "You help me a lot to know China",
      imageUrl: "assets/help-sawan.jpeg"),
  // Add more memories here
];

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: Drawer(
        child: WholeDrawer(dSize: dSize),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 24, end: 30),
              duration: const Duration(seconds: 3),
              curve: Curves.bounceOut,
              builder: (context, value, child) {
                return Text(
                  'Memories',
                  style: TextStyle(
                    fontSize: value,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: memories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Show the image in full screen.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              _ImageView(memory: memories[index]),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          ExtendedImage.asset(
                            memories[index].imageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  memories[index].isFavorite =
                                      !memories[index].isFavorite;
                                });
                              },
                              child: Icon(
                                memories[index].isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            child: Text(
                              memories[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  final Memory memory;

  const _ImageView({Key? key, required this.memory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: ExtendedImage.asset(memory.imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
