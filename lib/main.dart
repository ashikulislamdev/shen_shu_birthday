import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/pages/home_page.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '沈澍 - Shen Shu',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPaig(),
      // home: const HomePage(),
    );
  }
}

class MainPaig extends StatelessWidget {
  const MainPaig({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Wait/等一下",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                const CustomTextWidget(
                  text: "Alert/使警觉!!!",
                  textColor: Colors.red,
                  fontSize: 30,
                ),
                const SizedBox(height: 24),
                const CustomTextWidget(
                  text:
                      "If you are an Android user, download the APK by clicking on the Android button below. Or visit the website by clicking Stay here. Recommended to visit from mobile view",
                  fontSize: 16,
                ),
                const SizedBox(height: 12),
                const CustomTextWidget(
                  text: "如果您是安卓用户，请单击下面的安卓按钮下载 APK。 或者点击“留在此处”访问该网站。(建议使用手机浏览)",
                  fontSize: 16,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await launchurl(
                            "https://fastupload.io/en/tDu83p6cyW49fDf/file");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 1)),
                        height: 36,
                        child: const Center(
                            child: CustomTextWidget(
                          text: "Android/安卓",
                          fontSize: 16,
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 226, 219, 219),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 1)),
                        height: 36,
                        child: const Center(
                            child: CustomTextWidget(
                          text: "Stay here/待在这",
                          fontSize: 16,
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

launchurl(String targetUrl) async {
  final url = targetUrl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}
