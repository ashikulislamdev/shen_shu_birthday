import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/custom_confitti.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';

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
          "I am wishing you a day that's as unique and extraordinary as you are!",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "Asikul Islam Sawan"),
  Quote(
      title: "I hope your birthday is as sweet as your smile. And the year.",
      imageUrl: "assets/quotes_bg/q-Happy-Birthday-Friends.jpg",
      quote: "Rabiul Hassan"),
  Quote(
      title: "The journey of a thousand miles begins with a single step.",
      imageUrl: "assets/quotes_bg/q-flat-golden.jpg",
      quote: "Lao Tzu"),
  Quote(
      title:
          "If you're waiting on your birthday gift, close your eyes and make a wish. Surprise, it's me! Happy birthday!!!",
      imageUrl: "assets/quotes_bg/q-birthday-cake-decorated.jpg",
      quote: "Asikul Islam Sawan"),
  Quote(
      title:
          "On your special day, I wish you all the happiness and success in the world. Happy Birthday!",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "Rabiul Hassan"),
  Quote(
      title:
          "Sending you love, hugs, and warm wishes on your birthday. Have a wonderful celebration!",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "Asikul Islam Sawan"),
  Quote(
      title: "生日快樂！願你擁有一年中最快樂的時光，心想事成！",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "Asikul Islam Sawan"),
// Add more quotes here
];

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

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
          CustomConfittiWIdget(controllerCenterTop: _controllerCenterTop),
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
                            top: 50,
                            left: 25,
                            right: 25,
                            child: Center(
                                child: CustomTextWidget(
                                    text: quotes[index].title))),
                        Positioned(
                          top: 6,
                          right: 6,
                          child: GestureDetector(
                            onTap: () {
                              _controllerCenterTop.play();
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: Center(
                                  child: Image.asset(
                                "assets/quotes_bg/celebrate.png",
                                width: 40,
                              )),
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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExtendedImage.asset(
                quote.imageUrl,
                width: double.infinity,
                //height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(
                text: quote.title,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "~ ${quote.quote}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
