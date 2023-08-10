import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/widgets/custom_app_bar.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 5,
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 1))
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Center(
                                child: Text(
                              "Asikul Islam Sawan",
                            )),
                            content: Image.asset(
                              "assets/developer.jpg",
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/developer.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Username and email
                  const Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 6),
                    child: Column(
                      children: [
                        CustomTextWidget(text: "Asikul Islam Sawan"),
                        CustomTextWidget(
                            text: "Mobile Application Developer", fontSize: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 3),
                decoration:
                    BoxDecoration(color: const Color(0xffffffff), boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 5,
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 1))
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomImageIcon(
                      imageUrl: "assets/icons/GitHub-logo.png",
                      launchingUrl: "https://github.com/ashikulislamdev",
                      iconColor: Colors.black,
                      iconSize: 60,
                    ),
                    const SizedBox(width: 8),
                    const CustomImageIcon(
                        imageUrl: "assets/icons/youtube_318-183441.png",
                        iconColor: Colors.red,
                        iconSize: 45,
                        launchingUrl: "https://youtu.be/UMspayzN2Ek"),
                    const SizedBox(width: 12),
                    const CustomImageIcon(
                        imageUrl: "assets/icons/web.png",
                        iconSize: 35,
                        iconColor: Colors.black,
                        launchingUrl: "https://shenshu.hostsatkania.com/"),
                    const SizedBox(width: 12),
                    InkWell(
                        onTap: () {
                          launchEmail();
                        },
                        child: SizedBox(
                          width: 50,
                          child: Image.asset("assets/icons/next_gmail.png"),
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Profile information
            Container(
              // width: double.infinity,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 5,
                      color: Colors.grey.shade200,
                      offset: const Offset(0, 1))
                ],
              ),
              child: const Column(
                children: [
                  ListTile(
                    title: CustomTextWidget(text: "School", fontSize: 17),
                    trailing: CustomTextWidget(
                      text: "Hangzhou Dianzi University",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                  ListTile(
                    title: CustomTextWidget(
                      text: "Major",
                      fontSize: 17,
                    ),
                    trailing: CustomTextWidget(
                      text: "Computer Science Technology",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                  ListTile(
                    title: CustomTextWidget(
                      text: "Region",
                      fontSize: 17,
                    ),
                    trailing: CustomTextWidget(
                      text: "Bangladeshi",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                  ListTile(
                    title: CustomTextWidget(
                      text: "Hobbies",
                      fontSize: 17,
                    ),
                    trailing: CustomTextWidget(
                      text: "Coding, Riding, Reciting",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                  ListTile(
                    title: CustomTextWidget(
                      text: "WeChat ID",
                      fontSize: 17,
                    ),
                    trailing: CustomTextWidget(
                      text: "ashikulislamdev",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                  ListTile(
                    title: CustomTextWidget(
                      text: "About me",
                      fontSize: 17,
                    ),
                    isThreeLine: true,
                    subtitle: CustomTextWidget(
                      text:
                          "🌱 I'm currently learning everything\n 🛠  Flutter Developer  & ... \n 🔍Pretty Job Looking for ̶k̶n̶o̶w̶l̶e̶d̶g̶e̶  wisdom to grab\n 🎯 Learn, Contribute and Grow",
                      fontSize: 17,
                      textColor: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class CustomImageIcon extends StatelessWidget {
  final String imageUrl;
  final Color? iconColor;
  final String launchingUrl;
  final double? iconSize;
  const CustomImageIcon({
    super.key,
    required this.imageUrl,
    this.iconColor,
    required this.launchingUrl,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launchurl(launchingUrl);
      },
      child: ImageIcon(
        AssetImage(imageUrl),
        size: iconSize ?? 50,
        color: iconColor ?? const Color(0xFF1297F6),
      ),
    );
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

launchEmail() async {
  await launch(
    'mailto:ashikulislamsawan@gmail.com?subject=Support me&body=',
  );
}
