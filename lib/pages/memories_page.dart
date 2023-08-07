import 'package:confetti/confetti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/custom_confitti.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';
import 'package:shen_shu_birthday/widgets/drawer.dart';

class Memory {
  final String title;
  final String imageUrl;
  bool isFavorite = false;

  Memory({required this.title, required this.imageUrl});
}

List<Memory> memories = [
  Memory(
      title:
          "Time to introduce the various buildings and faculties of our school",
      imageUrl: "assets/3-in-school.jpg"),
  Memory(
      title:
          "All of us along with your dear friend Saki at the metro rail station",
      imageUrl: "assets/4-in-station.jpg"),
  Memory(
      title: "You help me a lot to know China",
      imageUrl: "assets/help-sawan.jpeg"),
  Memory(
      title: "A beautiful afternoon to enjoy in the park with you",
      imageUrl: "assets/3-in-garden.jpg"),
  Memory(
      title: "One of the best moments to enjoy with you is in Hangzhou Mosque",
      imageUrl: "assets/4-in-mosque.jpg"),
  Memory(
      title: "You're not only my friend but also a Chinese teacher",
      imageUrl: "assets/teaching-chinese.png"),
  Memory(
      title: "Some funny and enjoyed momenth",
      imageUrl: "assets/with-rabi.jpg"),
  Memory(
      title: "May your honor be higher than the tallest building",
      imageUrl: "assets/single-with-tawar.jpg"),
];

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  late ConfettiController _controllerCenterTop;
  @override
  void initState() {
    super.initState();
    _controllerCenterTop =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controllerCenterTop.dispose();
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
            CustomConfittiWIdget(controllerCenterTop: _controllerCenterTop),
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
                                _controllerCenterTop.play();
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
                            right: 12,
                            child: CustomTextWidget(
                              text: memories[index].title,
                              fontSize: 22,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.asset(
                memory.imageUrl,
                width: double.infinity,
                //height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(text: memory.title),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
