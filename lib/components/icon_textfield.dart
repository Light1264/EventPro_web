import 'package:flutter/material.dart';

import '../main.dart';

class IconTextField extends StatelessWidget {
  const IconTextField({
    super.key,
    required this.textInputType,
    required this.textFieldController,
    required this.hintText,
    required this.widgetIcon,
  });
  final TextInputType? textInputType;
  final TextEditingController textFieldController;
  final String hintText;
  final Icon widgetIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: widgetIcon
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: TextField(
              keyboardType: textInputType,
              controller: textFieldController,
              decoration: InputDecoration(
                
                hintText: hintText,
                // fillColor: constant.appBackgroundColor,
                // filled: true,
                contentPadding: const EdgeInsets.fromLTRB(0, 15, 5, 0),
                // focusedBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(color: constant.appColorDark),
                // ),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
