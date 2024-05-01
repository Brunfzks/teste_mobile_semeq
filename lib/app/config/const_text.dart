import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';

class ConstText {
  static TextStyle welcomeText = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ConstColors.primaryColor,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  ));

  static TextStyle h1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ConstColors.secondColor,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle textList = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ConstColors.secondBlack,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  ));

  static TextStyle h1Black = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ConstColors.secondBlack,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ));

  static TextStyle h2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    color: ConstColors.secondColor,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  ));
}
