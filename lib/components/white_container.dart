import 'package:flutter/material.dart';

import '../main.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 3),
      decoration: BoxDecoration(
          color: constant.appWhite, borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: constant.appBlack,
        ),
      ),
    );
  }
}
