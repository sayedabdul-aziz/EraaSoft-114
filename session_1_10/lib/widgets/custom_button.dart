import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
  });
  final String text;
  final Function()? onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              foregroundColor: Colors.white,
              backgroundColor: bgColor),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
