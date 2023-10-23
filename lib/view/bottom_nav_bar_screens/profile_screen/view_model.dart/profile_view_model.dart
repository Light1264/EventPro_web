import 'package:eventpro_web/view/auth_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../../../base_view_model.dart';
import '../../../../model/app_state/view_model_state.dart';
import '../../../../services/exceptions/failure.dart';
import '../../../../services/local/local_cache.dart';
import '../../../../services/remote/auth/auth_interface.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/locator.dart';

class ProfileViewModel extends ChangeNotifier {
  final AuthService authServices = locator();
  final BaseViewModel baseViewModel = BaseViewModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LocalCache _localCache = locator();

  TextEditingController fullName = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  logOut({
    required BuildContext context,
  }) async {
    baseViewModel.changeState(const ViewModelState.busy());
    try {
      await authServices.logOut();
      _localCache.deleteToken;
      showMyToast("logOut In Successful");

      baseViewModel.changeState(const ViewModelState.idle());
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: ((context) => const SignInScreen()),
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
