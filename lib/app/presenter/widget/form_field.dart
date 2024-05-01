import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste_mobile_semeq/app/config/const_color.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    this.maskFormatter,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.enable = true,
    this.isPassword = false,
    this.validator,
  });

  final String hintText;
  final Icon icon;
  final TextInputFormatter? maskFormatter;
  final TextEditingController controller;
  final bool enable;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        validator: validator,
        obscureText: isPassword,
        enabled: enable,
        controller: controller,
        inputFormatters: [maskFormatter ?? MaskTextInputFormatter()],
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(
            color: ConstColors.primaryColor,
            wordSpacing: 0.5,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Color(0xFFDFE4EC)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
