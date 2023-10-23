import 'package:eventpro_web/main.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.textInputType,
    required this.textFieldController,
    required this.hintText,
    required this.prefixIcon,
    this.boxShadow = true,
    required this.fillColor,
    this.textFieldHeight = 48,
    this.suffixIcon,
    this.obscureText = false,
    this.contentPadding = const EdgeInsets.fromLTRB(15, 15, 5, 0),
  });
  final TextInputType? textInputType;
  final TextEditingController textFieldController;
  final Widget prefixIcon;
  final String hintText;
  final bool boxShadow;
  final Color fillColor;
  final double textFieldHeight;
  final Widget? suffixIcon;
  final bool obscureText;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: textFieldHeight,
      decoration: BoxDecoration(
        border: boxShadow? null: Border.all(),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          boxShadow
              ? const BoxShadow(
                  color: Color(0x1F000000),
                  offset: Offset(0, 3),
                  spreadRadius: 1,
                  blurRadius: 6,
                )
              : BoxShadow(color: constant.appWhite)
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        keyboardType: textInputType,
        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          fillColor: fillColor,
          filled: true,
          contentPadding: contentPadding,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
          suffix: suffixIcon,
        ),
      ),
    );
  }
}
