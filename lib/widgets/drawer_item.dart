import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    super.key,
    this.ontap,
    required this.name,
    required this.icon,
  });
  final Function()? ontap;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xF03040CF),
              size: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
