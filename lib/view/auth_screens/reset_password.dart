import 'package:eventpro_web/components/loader_page.dart';
import 'package:eventpro_web/view/auth_screens/sign_in_screen.dart';
// import 'package:eventpro_web/view/onboarding_screens/onboarding_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../components/app_button.dart';
import '../../components/app_textfield.dart';
import '../../components/back_button.dart';
import '../../main.dart';
// import '../sign_up_as/view_model/sign_up_as_view_model.dart';
import '../../utils/functions.dart';
import 'view_model/auth_view_model.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthViewModel resetPasswordViewModel = context.watch<AuthViewModel>();
    return LoaderPage(
      isLoading: resetPasswordViewModel.baseViewModel.isBusy,
      child: Scaffold(
        backgroundColor: const Color(0xffF9EEF8),
        body: Form(
          key: resetPasswordViewModel.formKey,
          child: ListView(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset("assets/circle_eventpro_web.svg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const AppBackButton(),
                        const SizedBox(
                          height: 120,
                        ),
                        const Text(
                          "Reset",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 78,
                        ),
                        AppTextField(
                          fillColor: constant.appBackgroundColor,
                          textFieldController: resetPasswordViewModel.email,
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.mail),
                          hintText: "umunubo.lg@gmail.com",
                        ),
                        const SizedBox(
                          height: 160,
                        ),
                        AppButton(
                          buttonText: "RESET",
                          onPressed: () {
                            if (resetPasswordViewModel.email.text.isNotEmpty) {
                              if (resetPasswordViewModel.formKey.currentState
                                      ?.validate() ??
                                  false) {
                                FocusScope.of(context).unfocus();
                                resetPasswordViewModel.forgotPassword(
                                  context: context,
                                  email: resetPasswordViewModel.password.text.trim(),
                                );
                              }
                            } else {
                              showMyToast("Please enter your email address");
                            }
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Remember your password? ",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: ((context) => const SignInScreen()),
                                  ),
                                );
                              },
                              child: Text(
                                "sign In",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: constant.appColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
