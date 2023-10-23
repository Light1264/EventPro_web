import 'dart:io';

import 'package:eventpro_web/components/loader_page.dart';
import 'package:eventpro_web/utils/functions.dart';
import 'package:eventpro_web/utils/size_config.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/cards_screen/view-model/card_view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../components/app_button.dart';
import '../../../components/back_button.dart';
import '../../../components/calender_input_widget.dart';
import '../../../components/icon_textfield.dart';
import '../../../components/title_widget.dart';
import '../../../main.dart';

class ScheduleACard extends StatelessWidget {
  ScheduleACard({super.key, required this.svgString});
  Map<String, String>? svgString;

  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  DateTime currentDate = DateTime.now();
  List<dynamic> reminderList = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    CardsViewModel cardsViewModel = context.watch<CardsViewModel>();
    return LoaderPage(
      isLoading: cardsViewModel.baseViewModel.isBusy,
      child: Form(
        key: cardsViewModel.formKey,
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
                    const TitleWidget(
                      topText: "SCHEDULE A",
                      bottomText: "WISH CARD",
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (cardsViewModel.cardMessage.text.isNotEmpty) {
                          if (cardsViewModel.recipientName.text.isNotEmpty) {
                            shareMethod(
                                context,
                                cardsViewModel.recipientName.text,
                                cardsViewModel.cardMessage.text);
                          } else {
                            showMyToast(
                                "Please enter recipient's name address");
                          }
                        } else {
                          showMyToast("Please enter message");
                        }
                      },
                      child: Icon(
                        Icons.share_rounded,
                        color: constant.appColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: getProportionateScreenWidth(300),
                  height: getProportionateScreenWidth(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(
                        svgString!["wishCard"].toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(24.0),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: cardsViewModel.cardMessage,
                        maxLines: 10,
                        minLines: 10,
                        decoration: InputDecoration(
                          hintText: "Enter message",
                          fillColor: constant.appBackgroundColor,
                          filled: true,
                          contentPadding: const EdgeInsets.all(14),
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: cardsViewModel.recipientName,
                  hintText: "Recipient name",
                  widgetIcon: Icon(
                    Icons.person,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                const CalenderInputWidget(calenderType: "ScheduleCard"),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: cardsViewModel.recipientEmailAddress,
                  hintText: "Recipient email address",
                  widgetIcon: Icon(
                    Icons.bar_chart,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                AppButton(
                  buttonText: "DONE",
                  onPressed: () {
                    if (cardsViewModel.recipientName.text.isNotEmpty) {
                      if (cardsViewModel
                          .recipientEmailAddress.text.isNotEmpty) {
                        if (cardsViewModel.formKey.currentState?.validate() ??
                            false) {
                          FocusScope.of(context).unfocus();
                          print("========= $svgString");
                          cardsViewModel.scheduleWishCard(
                            context: context,
                            wishCard: svgString!,
                            recipientName: cardsViewModel.recipientName.text,
                            wishDate: "2023-12-28",
                            wishTime: "19:00",
                            recipientEmail:
                                cardsViewModel.recipientEmailAddress.text,
                          );
                        }
                      } else {
                        showMyToast("Please enter recipient's email address");
                      }
                    } else {
                      showMyToast("Please enter recipient's name");
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  shareMethod(
    context,
    String name,
    String message,
  ) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      message,
      subject: "Dear $name",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
