import 'package:eventpro_web/services/remote/auth/auth_interface.dart';
import 'package:eventpro_web/utils/functions.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../../base_view_model.dart';
import '../../../model/app_state/view_model_state.dart';
import '../../../services/exceptions/failure.dart';
import '../../../utils/locator.dart';
import '../../bottom_nav_bar_screens/event_screens/upcoming_events.dart';
import '../../side_bar_view.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthService authServices = locator();
  final BaseViewModel baseViewModel = BaseViewModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscureText = true;

  obscureTextFunction() {
    obscureText = !obscureText;
    notifyListeners();
  }

  signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    baseViewModel.changeState(const ViewModelState.busy());
    try {
      await authServices.signIn(
        email: email,
        password: password,
      );
      showMyToast("Sign In Successful");
      baseViewModel.changeState(const ViewModelState.idle());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: ((context) => const MyHomePage(
                  pageOption: "UpcomingEvents",
                )),
          ),
          (route) => false);
      notifyListeners();
    } on Failure {
      baseViewModel.changeState(const ViewModelState.idle());
      notifyListeners();
      showMyToast("An error occured");
    }
    baseViewModel.changeState(const ViewModelState.idle());
  }
}
