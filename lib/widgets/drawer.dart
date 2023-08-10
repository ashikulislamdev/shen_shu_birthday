import 'package:flutter/material.dart';
import 'package:shen_shu_birthday/pages/developer_page.dart';
import 'package:shen_shu_birthday/pages/home_page.dart';
import 'package:shen_shu_birthday/pages/memories_page.dart';
import 'package:shen_shu_birthday/pages/quotes_page.dart';
import 'package:shen_shu_birthday/widgets/custom_text_widget.dart';

import 'drawer_item.dart';

class WholeDrawer extends StatelessWidget {
  const WholeDrawer({
    super.key,
    required this.dSize,
  });

  final Size dSize;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(height: dSize.height / 25),
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/icons/shen_shu.jpg"),
        ),
        const SizedBox(height: 10),
        const Center(child: CustomTextWidget(text: "沈澍 (Shen Shu)")),
        const SizedBox(height: 10),
        const Center(child: CustomTextWidget(text: "沈澍生日快乐")),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
        const SizedBox(height: 10),
        DrawerMenuItem(
          icon: Icons.home_outlined,
          name: 'Home',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage())),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.black,
          thickness: 1,
        ),
        const SizedBox(height: 10),
        DrawerMenuItem(
          icon: Icons.history_edu_outlined,
          name: 'Memories',
          ontap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const MemoriesPage())),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color(0xFF328AAF),
          thickness: 1,
        ),
        DrawerMenuItem(
          icon: Icons.format_quote_outlined,
          name: 'Quotes',
          ontap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const QuotesPage())),
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Color(0xFF328AAF),
          thickness: 1,
        ),
        DrawerMenuItem(
          icon: Icons.developer_board,
          name: 'Developer',
          ontap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DeveloperPage())),
        ),
      ],
    );
  }
}
