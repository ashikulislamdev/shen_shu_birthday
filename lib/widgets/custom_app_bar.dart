import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        "沈澍生日",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Center(
                      child: Text(
                    "Mr Shen Shu",
                  )),
                  content: Image.asset(
                    "assets/greduate-pic.jpg",
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                );
              },
            );
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/greduate-pic.jpg"),
            radius: 25,
            backgroundColor: Colors.transparent,
          ),
        ),
        const SizedBox(width: 12)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
