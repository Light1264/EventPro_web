import 'package:eventpro_web/main.dart';
import 'package:flutter/material.dart';

showMyLogOutDialog(BuildContext context, Function() yesOnTap) {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        actionsPadding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        actionsAlignment: MainAxisAlignment.spaceAround,
        content: Text(
          "Are you sure you want to\nlog Out?",
          style: TextStyle(
            fontSize: 18,
          fontWeight: FontWeight.w800,
          color: constant.appBlack,
          ),
          
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              
            },
            child: const Text(
          "NO",
          style: TextStyle(
            fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.red,
          ),
          
        ),
          ),
          InkWell(
            onTap: yesOnTap,
            child: Text(
          "YES",
          style: TextStyle(
            fontSize: 16,
          fontWeight: FontWeight.w400,
          color: constant.appColor,
          ),
          
        ),
          ),
        ],
      );
    },
  );
}
