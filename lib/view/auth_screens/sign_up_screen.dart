import 'package:eventpro_web/components/loader_page.dart';
import 'package:eventpro_web/main.dart';
import 'package:eventpro_web/utils/functions.dart';
import 'package:eventpro_web/utils/size_config.dart';
import 'package:eventpro_web/view/auth_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/app_button.dart';
import '../../components/app_textfield.dart';
import 'view_model/auth_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  // GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthViewModel signUpAsViewModel = context.watch<AuthViewModel>();
    bool isLargeScreen = MediaQuery.of(context).size.width >= 1000;
    SizeConfig.init(context);
    return LoaderPage(
      isLoading: signUpAsViewModel.baseViewModel.isBusy,
      child: Scaffold(
        backgroundColor: const Color(0xffF9EEF8),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Image.asset(
              "assets/eventpro_logo.png",
              scale: 8,
            ),
          ),
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: isLargeScreen ? getProportionateScreenWidth(110) : 0,
            vertical: isLargeScreen ? getProportionateScreenHeight(40) : 0,
          ),
          decoration: BoxDecoration(
            // border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: constant.appBackgroundColor,
            boxShadow: [
              isLargeScreen
                  ? const BoxShadow(
                      color: Color(0x1F000000),
                      offset: Offset(3, 0),
                      spreadRadius: 1,
                      blurRadius: 6,
                    )
                  : BoxShadow(color: constant.appBackgroundColor)
            ],
          ),
          child: Form(
            key: signUpAsViewModel.formKey,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        "assets/circle_group.png",
                        scale: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // const AppBackButton(),
                          const SizedBox(
                            height: 120,
                          ),
                          const Text(
                            "Register as",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "User",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 51,
                          ),
                          AppTextField(
                            fillColor: constant.appBackgroundColor,
                            textFieldController: signUpAsViewModel.fullName,
                            textInputType: TextInputType.name,
                            prefixIcon: const Icon(Icons.person),
                            hintText: "Umunubo Elo",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppTextField(
                            fillColor: constant.appBackgroundColor,
                            textFieldController: signUpAsViewModel.email,
                            textInputType: TextInputType.emailAddress,
                            prefixIcon: const Icon(Icons.mail),
                            hintText: "umunubo.lg@gmail.com",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          AppTextField(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 5, 20),
                            obscureText: signUpAsViewModel.obscureText,
                            fillColor: constant.appBackgroundColor,
                            textFieldController: signUpAsViewModel.password,
                            textInputType: TextInputType.name,
                            prefixIcon: const Icon(Icons.lock_open),
                            hintText: "password",
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              icon: Icon(
                                signUpAsViewModel.obscureText
                                    ? Icons.visibility_off
                                    : Icons
                                        .visibility, //change icon based on boolean value
                                color: constant.appColorDark,
                              ),
                              onPressed: () {
                                signUpAsViewModel.obscureTextFunction();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                activeColor: constant.appColor,
                                value: signUpAsViewModel.checkBoxValue,
                                onChanged: (value) {
                                  signUpAsViewModel.checkBoxOnChanged();
                                },
                              ),
                              const Text(
                                "Agree with ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Terms & Conditions",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: constant.appColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          AppButton(
                            buttonText: "REGISTER",
                            onPressed: () {
                              if (signUpAsViewModel.fullName.text.isNotEmpty) {
                                if (signUpAsViewModel.email.text.isNotEmpty) {
                                  if (signUpAsViewModel
                                      .password.text.isNotEmpty) {
                                    if (signUpAsViewModel.formKey.currentState
                                            ?.validate() ??
                                        false) {
                                      FocusScope.of(context).unfocus();
                                      signUpAsViewModel.register(
                                        context: context,
                                        name: signUpAsViewModel.fullName.text,
                                        email: signUpAsViewModel.email.text,
                                        password: signUpAsViewModel.password.text,
                                      );
                                    }
                                  } else {
                                    showMyToast("Please enter your password");
                                  }
                                } else {
                                  showMyToast(
                                      "Please enter your email address");
                                }
                              } else {
                                showMyToast("Please enter your fullname");
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
                                "Already Registered? ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const SignInScreen()),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: constant.appColor,
                                  ),
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
      ),
    );
  }
}
