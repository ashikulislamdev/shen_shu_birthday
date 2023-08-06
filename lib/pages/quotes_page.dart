import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';

class Quote {
  final String title;
  final String imageUrl;
  final String quote;
  bool isFavorite = false;

  Quote({required this.title, required this.imageUrl, required this.quote});
}

List<Quote> quotes = [
  Quote(
      title:
          "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.",
      imageUrl: "assets/quotes_bg/q-birthday-cake-decorated.jpg",
      quote: "Helen Keller"),
  Quote(
      title: "The only way to do great work is to love what you do.",
      imageUrl: "assets/quotes_bg/q-flat-golden.jpg",
      quote: "Steve Jobs"),
  Quote(
      title: "The journey of a thousand miles begins with a single step.",
      imageUrl: "assets/quotes_bg/q-Happy-Birthday-Friends.jpg",
      quote: "Lao Tzu"),
  Quote(
      title: "The journey of a thousand miles begins with a single step.",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "Lao Tzu"),
// Add more quotes here
];

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
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
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 24, end: 30),
            duration: const Duration(seconds: 3),
            curve: Curves.bounceOut,
            builder: (context, value, child) {
              return Text(
                'Quotes',
                style: TextStyle(
                  fontSize: value,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _controllerCenterTop,
              blastDirection: pi / 2, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
              strokeWidth: 1,
              strokeColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Show the image in full screen.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _ImageView(quote: quotes[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: ExtendedImage.asset(
                            quotes[index].imageUrl,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Positioned(
                            top: 60,
                            left: 25,
                            right: 25,
                            child: Center(child: Text(quotes[index].title))),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              _controllerCenterTop.play();
                            },
                            child: const CircleAvatar(
                              child: ImageIcon(
                                AssetImage("assets/quotes_bg/celebration.png"),
                                size: 30,
                                color: Colors.transparent,
                                // quotes[index].isFavorite
                                //     ? Icons.favorite
                                //     : Icons.favorite_border,
                                // color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Text(
                            quotes[index].quote,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  final Quote quote;

  const _ImageView({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExtendedImage.asset(
              quote.imageUrl,
              width: double.infinity,
              //height: 200,
              fit: BoxFit.cover,
            ),
            Text(
              quote.quote,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
