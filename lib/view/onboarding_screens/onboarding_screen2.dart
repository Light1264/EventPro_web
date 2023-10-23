import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/app_button.dart';
import 'onboarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
                // SvgPicture.asset(
                //   "assets/ballon_eventpro.svg",
                //   // height: 150,
                // ),
                Image.asset(
                  "assets/balloon_eventpro.png",
                  scale: 3,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "SEND SCHEDULED MESSAGES TO LOVED ONES",
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
                    builder: ((context) => const OnboardingScreen3()),
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
