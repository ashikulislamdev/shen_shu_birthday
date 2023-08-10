import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/custom_confitti.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';

class Quote {
  final String title;
  final String titleCn;
  final String imageUrl;
  final String quote;
  bool isFavorite = false;

  Quote(
      {required this.title,
      required this.titleCn,
      required this.imageUrl,
      required this.quote});
}

List<Quote> quotes = [
  Quote(
      title:
          "I am wishing you a day that's as unique and extraordinary as you are!",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "~ Asikul Islam Sawan",
      titleCn: '我祝愿你度过一个像你一样独特和非凡的一天！'),
  Quote(
      title: "I hope your birthday is as sweet as your smile. And the year.",
      imageUrl: "assets/quotes_bg/q-Happy-Birthday-Friends.jpg",
      quote: "~ Rabiul Hassan",
      titleCn: '希望你生日那天像你的笑容一样甜蜜，包括接来下的一年时间里。'),
  Quote(
      title: "The journey of a thousand miles begins with a single step.",
      imageUrl: "assets/quotes_bg/q-flat-golden.jpg",
      quote: "~ Lao Tzu",
      titleCn: '千里之行，始于足下。'),
  Quote(
      title: "\"Good job! Keep on fighting! Deqin magical tree\"",
      imageUrl: "assets/quotes_bg/q-birthday-cake-decorated.jpg",
      quote: "~ 蔡晨焕(Raphael)",
      titleCn: '“可以的，又坚持了一年，继续加油，德清神树”'),
  Quote(
      title:
          "If you're waiting on your birthday gift, close your eyes and make a wish. Surprise, it's me! Happy birthday!!!",
      imageUrl: "assets/quotes_bg/q-happy-birthday.jpg",
      quote: "~ Asikul Islam Sawan",
      titleCn: '如果您正在等待生日礼物，请闭上眼睛许个愿。 惊喜！是我！ 生日快乐！！！'),
  Quote(
      title:
          "On your special day, I wish you all the happiness and success in the world. Happy Birthday!",
      imageUrl: "assets/quotes_bg/q-Happy-Birthday-Friends.jpg",
      quote: "~ Rabiul Hassan",
      titleCn: '在这个特殊的日子里，我祝愿你拥有世界上一切幸福和成功。 生日快乐！'),
  Quote(
      title:
          "Sending you love, hugs, and warm wishes on your birthday. Have a wonderful celebration!",
      imageUrl: "assets/quotes_bg/q-flat-golden.jpg",
      quote: "~ Asikul Islam Sawan",
      titleCn: '在你生日这天送上爱、拥抱和温暖的祝福。 祝你有个难忘又美好的庆祝！'),
  Quote(
      title:
          "Happy birthday! May you have the happiest time of the year and your wishes come true!",
      imageUrl: "assets/quotes_bg/q-birthday-cake-decorated.jpg",
      quote: "~ A Chinese",
      titleCn: '生日快樂！願你擁有一年中最快樂的時光，心想事成！'),
  Quote(
      title: "Hope you'll arrange a great treat for all of us!",
      imageUrl: "assets/quotes_bg/q-birthday-cake-decorated.jpg",
      quote: "~ 蔡晨焕(Raphael)",
      titleCn: '希望你能给我们安排一顿丰盛的大餐'),
// Add more quotes here
];

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
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
              fontSize: 20,
              textColor: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(width: 12)
        ],
      ),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 24, end: 30),
            duration: const Duration(seconds: 3),
            curve: Curves.bounceOut,
            builder: (context, value, child) {
              return Text(
                isChinese ? "引用" : 'Quotes',
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
                        builder: (context) => _ImageView(
                          quote: quotes[index],
                          isChinese: isChinese,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.2,
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
                                    fontSize: 20,
                                    text: isChinese
                                        ? quotes[index].titleCn
                                        : quotes[index].title))),
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
  final bool isChinese;

  const _ImageView({Key? key, required this.quote, required this.isChinese})
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
                quote.imageUrl,
                width: double.infinity,
                //height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              CustomTextWidget(
                text: isChinese ? quote.titleCn : quote.title,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                quote.quote,
                style: const TextStyle(
                  color: Colors.red,
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
