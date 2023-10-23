import 'package:eventpro_web/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sign_up_as/sign_up_as_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
                //   "assets/wedding_eventpro.svg",
                //   height: 150,
                // ),
                Image.asset(
                  "assets/wedding_eventpro.png",
                  scale: 3,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "GET THE BEST PLANNED EVENTS WITH OUR QUALIFIED SERVICE PROVIDERS",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 14,
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
              buttonText: "GET STARTED",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const SignUpAsScreen()),
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
