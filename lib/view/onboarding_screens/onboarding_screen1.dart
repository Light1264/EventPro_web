import 'package:eventpro_web/view/onboarding_screens/onboarding_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/app_button.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9EEF8),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset("assets/circle_eventpro.svg"),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/time_eventpro.svg",
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "MANAGE YOUR EVENTS WITH EASE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet consectetur. Dui suspendisse iaculis gravida hac at. Neque.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const OnboardingScreen2()),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
