import 'dart:async';
import 'dart:math';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart'
    as my_clipper;
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/pages/memories_page.dart';
import 'package:shen_shu_birthday/widgets/shake_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConfettiController? confettiCenterRight;
  ConfettiController? confettiCenterLeft;
  Timer? timer;
  int startTime = 0;

  @override
  void initState() {
    confettiCenterRight =
        ConfettiController(duration: const Duration(seconds: 1));
    confettiCenterLeft =
        ConfettiController(duration: const Duration(seconds: 1));

    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    confettiCenterLeft!.dispose();
    confettiCenterRight!.dispose();

    super.dispose();
  }

  Future<void> startTimer() async {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (startTime == 23) {
                confettiCenterRight!.play();
                confettiCenterLeft!.play();
                timer.cancel();
              } else {
                startTime += 1;
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      bottomNavigationBar: const SizedBox(
        height: 50,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xD2E0208A),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const MemoriesPage())));
        },
        backgroundColor: const Color.fromARGB(184, 6, 35, 202),
        tooltip: 'See More Wish...!',
        child: const Icon(
          Icons.play_circle_outline,
          size: 45,
          color: Color.fromARGB(184, 255, 255, 255),
        ),
        // child: ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: ListView(
          children: [
            ClipPath(
              clipper: my_clipper.WaveClipperTwo(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/3-in-garden.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "$startTime 岁",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: ConfettiWidget(
                    confettiController: confettiCenterRight!,
                    blastDirection: pi, // radial value - LEFT
                    particleDrag: 0.05, // apply drag to the confetti
                    emissionFrequency: 0.06, // how often it should emit
                    numberOfParticles: 35, // number of particles to emit
                    gravity: 0.08, // gravity - or fall speed
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink
                    ], // manually specify the colors to be used
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConfettiWidget(
                    confettiController: confettiCenterLeft!,
                    blastDirection: 0, // radial value - RIGHT
                    emissionFrequency: 0.6,
                    minimumSize: const Size(10,
                        10), // set the minimum potential size for the confetti (width, height)
                    maximumSize: const Size(50,
                        50), // set the maximum potential size for the confetti (width, height)
                    numberOfParticles: 1,
                    gravity: 0.1,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      if (startTime >= 7)
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 50, end: 70),
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeIn,
                          builder: (context, value, child) {
                            return Text(
                              "Happy",
                              style: TextStyle(
                                  fontSize: value,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff13195b)),
                            );
                          },
                        ),
                      const SizedBox(
                        height: 2,
                      ),
                      if (startTime >= 13)
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 50, end: 35),
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeIn,
                          builder: (context, value, child) {
                            return Text(
                              "BirthDay",
                              style: TextStyle(
                                  fontSize: value,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff13195b)),
                            );
                          },
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      if (startTime >= 23)
                        const ShakeWidget(
                            child: Text(
                          "     沈澍\nShen Shu",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 243, 19, 19),
                              fontFamily: 'OleoScript'),
                        )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
