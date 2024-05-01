import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';

class FormsButton extends StatelessWidget {
  const FormsButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.invertColors = false,
    required this.width,
  });

  final String buttonText;
  final bool invertColors;
  final Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
              color: invertColors
                  ? ConstColors.primaryColor
                  : ConstColors.secondColor,
              border: Border.all(
                  color: invertColors
                      ? ConstColors.secondColor
                      : ConstColors.primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.roboto(
                color: invertColors
                    ? ConstColors.secondColor
                    : ConstColors.primaryColor,
                wordSpacing: 0.5,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
