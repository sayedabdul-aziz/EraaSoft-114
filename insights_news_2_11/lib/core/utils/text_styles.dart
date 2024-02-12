import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleStyle(
    {double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = const Color(0xffBEDE61)}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getBodyStyle(
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.white}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}

TextStyle getSmallStyle(
    {double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.grey}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
