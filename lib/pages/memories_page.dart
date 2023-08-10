import 'package:confetti/confetti.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/custom_confitti.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';
import 'package:shen_shu_birthday/widgets/drawer.dart';

class Memory {
  final String title;
  final String titleCn;
  final String imageUrl;
  bool isFavorite = false;

  Memory({required this.title, required this.imageUrl, required this.titleCn});
}

List<Memory> memories = [
  Memory(
      title:
          "Time to introduce the various buildings and faculties of our school",
      imageUrl: "assets/3-in-school.jpg",
      titleCn: '是时候介绍一下我们学校的各个建筑和院系了'),
  Memory(
      title:
          "All of us along with your dear friend Saki at the metro rail station",
      imageUrl: "assets/4-in-station.jpg",
      titleCn: '我们所有人和你亲爱的朋友施澳成一起在地铁站。'),
  Memory(
      title: "You help me a lot to know China",
      imageUrl: "assets/help-sawan.jpeg",
      titleCn: '你给了我很大帮助来了解中国。'),
  Memory(
      title: "A beautiful afternoon to enjoy in the park with you",
      imageUrl: "assets/3-in-garden.jpg",
      titleCn: '与你一起在公园度过一个美好的下午。'),
  Memory(
      title: "One of the best moments to enjoy with you is in Hangzhou Mosque",
      imageUrl: "assets/4-in-mosque.jpg",
      titleCn: '与你度过的最美好的回忆之一是在杭州清真寺。'),
  Memory(
      title: "You're not only my friend but also a Chinese teacher",
      imageUrl: "assets/teaching-chinese.png",
      titleCn: '你不仅是我的朋友，也是我的语文老师。'),
  Memory(
      title: "Some funny and enjoyed momenth",
      imageUrl: "assets/with-rabi.jpg",
      titleCn: '一些有趣愉快的时刻。'),
  Memory(
      title: "May your honor be higher than the tallest building",
      imageUrl: "assets/single-with-tawar.jpg",
      titleCn: '愿你的荣耀比最高的建筑还要高。'),
];

class MemoriesPage extends StatefulWidget {
  const MemoriesPage({super.key});

  @override
  State<MemoriesPage> createState() => _MemoriesPageState();
}

class _MemoriesPageState extends State<MemoriesPage> {
  bool isChinese = false;

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
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: CustomTextWidget(
          text: isChinese ? "沈澍生日" : "Shen Shu's Birthday",
          textColor: Colors.white,
          fontSize: 18,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isChinese = !isChinese;
              });
            },
            child: CustomTextWidget(
              text: isChinese ? "EN" : "中文",
              textColor: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 12)
        ],
      ),
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
                  isChinese ? "回忆" : 'Memories',
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
                          builder: (context) => _ImageView(
                            memory: memories[index],
                            isChinese: isChinese,
                          ),
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
                              text: isChinese
                                  ? memories[index].titleCn
                                  : memories[index].title,
                              fontSize: 22,
                              textColor: Colors.white,
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
  final bool isChinese;

  const _ImageView({Key? key, required this.memory, required this.isChinese})
      : super(key: key);

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
              CustomTextWidget(text: isChinese ? memory.titleCn : memory.title),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
