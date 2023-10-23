import 'package:flutter/material.dart';

class SignUpAsViewModel extends ChangeNotifier {
  String signUpValues = "User";
  Color ActiveBackgroundColor = const Color(0xffE0CBF0);
  Color InActiveBackgroundColor = const Color(0xffE3DCE9);

  selectSignUpValues(String signUpValue) {
    
    ActiveBackgroundColor = InActiveBackgroundColor;
    print("+++++++++ $ActiveBackgroundColor");
    notifyListeners();
  }
}
