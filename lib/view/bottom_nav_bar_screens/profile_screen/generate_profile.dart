import 'package:eventpro_web/components/app_button.dart';
import 'package:eventpro_web/components/icon_textfield.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/profile_screen/view_model.dart/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/back_button.dart';
import '../../../components/title_widget.dart';
import '../../../main.dart';

class GenerateProfile extends StatelessWidget {
  const GenerateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileViewModel profileViewModel = context.watch<ProfileViewModel>();
    return Scaffold(
      backgroundColor: constant.appBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AppBackButton(),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      topText: "GENERATE",
                      bottomText: "PROFILE",
                    ),
                    // const Spacer(),
                    // const Padding(
                    //   padding: EdgeInsets.only(bottom: 24),
                    //   child: Icon(
                    //     Icons.more_horiz,
                    //     size: 32,
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: profileViewModel.fullName,
                  hintText: "Faith Esin",
                  widgetIcon: Icon(
                    Icons.person,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: profileViewModel.bio,
                  hintText: "Bio",
                  widgetIcon: Icon(
                    Icons.bar_chart,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.apps_rounded,
                      color: constant.appGrey,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 11,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: constant.appGrey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Interest",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: constant.appBlack.withOpacity(0.6),
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: profileViewModel.phoneNumber,
                  hintText: "Phone Number",
                  widgetIcon: Icon(
                    Icons.call_outlined,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.emailAddress,
                  textFieldController: profileViewModel.email,
                  hintText: "Email Address",
                  widgetIcon: Icon(
                    Icons.mail_outline_rounded,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.streetAddress,
                  textFieldController: profileViewModel.address,
                  hintText: "Address",
                  widgetIcon: Icon(
                    Icons.location_on_outlined,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                AppButton(
                  buttonText: "GENERATE",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
