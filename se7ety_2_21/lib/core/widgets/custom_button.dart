import 'package:flutter/material.dart';
import 'package:se7ety_2_21/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.background,
    this.foreground,
    this.height,
    this.width,
    this.radius,
    required this.onPressed,
  });

  final String text;
  final Color? background;
  final Color? foreground;
  final double? height;
  final double? width;
  final double? radius;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 45,
        width: width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: background ?? AppColors.color1,
                foregroundColor: foreground ?? AppColors.white),
            onPressed: onPressed,
            child: Text(text)));
  }
}
