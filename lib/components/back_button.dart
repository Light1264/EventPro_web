import 'package:flutter/material.dart';

import '../main.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_rounded,
        color: constant.appBlack,
        size: 30,
      ),
    );
  }
}
