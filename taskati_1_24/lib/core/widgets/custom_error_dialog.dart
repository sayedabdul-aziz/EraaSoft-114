import 'package:flutter/material.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';

showErrorDialog(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.redColor, content: Text(text)));
}
