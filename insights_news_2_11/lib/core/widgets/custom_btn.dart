import 'package:flutter/material.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.background = const Color(0xff30312D),
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: background,
            foregroundColor: AppColors.white),
        onPressed: onPressed,
        child: Text(text));
  }
}
