import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
