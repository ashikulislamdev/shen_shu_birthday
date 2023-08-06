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

  Future<void> startTimer() async {
    const oneSec = Duration(seconds: 2);
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
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/3-in-garden.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "$startTime",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            if (startTime == 23)
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConfettiWidget(
                      confettiController: confettiCenterRight!,
                      blastDirection: pi, // radial value - LEFT
                      particleDrag: 0.05, // apply drag to the confetti
                      emissionFrequency: 0.05, // how often it should emit
                      numberOfParticles: 20, // number of particles to emit
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
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          "Happy",
                          style: TextStyle(
                              color: Color(0xff13195b),
                              fontWeight: FontWeight.w900,
                              fontSize: 80),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "BirthDay",
                          style: TextStyle(
                              color: Color(0xff13195b),
                              fontWeight: FontWeight.w900,
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ShakeWidget(
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
