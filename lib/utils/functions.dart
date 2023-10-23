import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

showMyToast(msg) {
  Fluttertoast.showToast(
    msg: msg, // message
    // textColor: const Color.fromRGBO(0, 0, 0, 1),
    // toastLength: Toast.LENGTH_LONG, // length
    gravity: ToastGravity.TOP,
    // backgroundColor: backgroundColor, // location
  );
  HapticFeedback.mediumImpact();
}