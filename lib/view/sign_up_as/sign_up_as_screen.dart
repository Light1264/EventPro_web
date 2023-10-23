import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../components/app_button.dart';
import '../auth_screens/sign_up_screen.dart';
import 'view_model/sign_up_as_view_model.dart';

class SignUpAsScreen extends StatefulWidget {
  const SignUpAsScreen({super.key});

  @override
  State<SignUpAsScreen> createState() => _SignUpAsScreenState();
}

class _SignUpAsScreenState extends State<SignUpAsScreen> {
  @override
  Widget build(BuildContext context) {
    SignUpAsViewModel signUpAsViewModel = context.watch<SignUpAsViewModel>();
    return Scaffold(
      backgroundColor: const Color(0xffF9EEF8),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset("assets/circle_eventpro.svg"),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  "Register as",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 78,
                ),
                GestureDetector(
                  onTap: () {
                    // signUpAsViewModel.selectSignUpValues("User");
                    setState(() {
                      signUpAsViewModel.signUpValues = "User";
                      print(signUpAsViewModel.signUpValues);
                    });
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: signUpAsViewModel.signUpValues == "User"
                          ? const Color(0xffE0CBF0)
                          : signUpAsViewModel.InActiveBackgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 13, 0, 17),
                      child: Row(
                        children: [
                          const Text(
                            'User',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                            value: 'User',
                            groupValue: signUpAsViewModel.signUpValues,
                            activeColor: const Color(0xffCF87E8),
                            onChanged: (value) {
                              // signUpAsViewModel
                              //     .selectSignUpValues(value.toString());
                              setState(() {
                                signUpAsViewModel.signUpValues =
                                    value.toString();
                                print(signUpAsViewModel.signUpValues);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    // signUpAsViewModel.selectSignUpValues("Service Provider");
                    setState(() {
                      signUpAsViewModel.signUpValues = "Service Provider";
                      print(signUpAsViewModel.signUpValues);
                    });
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          signUpAsViewModel.signUpValues == "Service Provider"
                              ? const Color(0xffE0CBF0)
                              : signUpAsViewModel.InActiveBackgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 13, 0, 17),
                      child: Row(
                        children: [
                          const Text(
                            'Service Provider',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          const Spacer(),
                          Radio(
                            value: 'Service Provider',
                            groupValue: signUpAsViewModel.signUpValues,
                            activeColor: const Color(0xffCF87E8),
                            onChanged: (value) {
                              setState(() {
                                signUpAsViewModel.signUpValues =
                                    value.toString();
                                print(signUpAsViewModel.signUpValues);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: AppButton(
              buttonText: "NEXT",
              onPressed: () {
                if (signUpAsViewModel.signUpValues == "User") {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const SignUpScreen()),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
