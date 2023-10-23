import 'package:eventpro_web/components/loader_page.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/generate_profile.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/view_model.dart/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../components/app_button.dart';
import '../../../components/white_container.dart';
import '../../../main.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  bool hasProfle = false;

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();
    return LoaderPage(
      isLoading: profileViewModel.baseViewModel.isBusy,
          child: Form(
            key: profileViewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: constant.appGrey.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              color: constant.appBackgroundColor,
                              // borderRadius: const BorderRadius.only(
                              //   bottomLeft: Radius.circular(10),
                              //   bottomRight: Radius.circular(10),
                              // ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        minRadius: 45,
                        backgroundColor: constant.appBackgroundColor,
                        child: CircleAvatar(
                          minRadius: 42,
                          backgroundColor: constant.appGrey,
                          child: const Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Nara Berry",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: constant.appBlack,
                    ),
                  ),
                  const SizedBox(height: 14),
                  hasProfle
                      ? Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WhiteContainer(text: "#Birthdays"),
                                 SizedBox(
                                  width: 8,
                                ),
                                WhiteContainer(text: "#Art"),
                                 SizedBox(
                                  width: 8,
                                ),
                                WhiteContainer(text: "#Weddings")
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bio",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: constant.appBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet consectetur. Laoreet varius est consequat ridiculus ac. Velit pellentesque mi et egestas purus faucibus non diam. Neque platea ornare arcu molestie vulputate senectus. Risus mi sed nisi.",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: constant.appBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Occupation",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: constant.appBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Event Planner & Artist",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: constant.appBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Contact Address",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: constant.appBlack,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call_outlined,
                                        color: constant.appGrey,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "08011223344",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: constant.appBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail_outline_outlined,
                                        color: constant.appGrey,
                                        size: 17,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "narryberry@gmail.com",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: constant.appBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: constant.appGrey,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "16 mid lake road, off light estate, canada.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: constant.appBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 80,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            SvgPicture.asset(
                              "assets/noProfile.svg",
                              height: 150,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 50,
                  ),
                  hasProfle
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: AppButton(
                            buttonText: "GENERATE PROFILE",
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => const GenerateProfile()),
                                ),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
          ),
    );
  }
}
