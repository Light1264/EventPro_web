import 'package:eventpro_web/components/white_container.dart';
import 'package:flutter/material.dart';

import '../../../components/back_button.dart';
import '../../../components/title_widget.dart';
import '../../../main.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.eventDetails});
  final Map<String, String>? eventDetails;

  @override
  Widget build(BuildContext context) {
    print(eventDetails);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBackButton(),
            const SizedBox(
              height: 40,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(
                  topText: "EVENT",
                  bottomText: "DETAILS",
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Icon(
                    Icons.more_horiz,
                    size: 32,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                const Divider(
                  color: Color.fromARGB(255, 181, 181, 181),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 56,
                  ),
                  child: Divider(
                    color: constant.appBlack,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              eventDetails!["eventTitle"].toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: constant.appBlack,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            // Row(
            //   children: [
            //     Container(
            //       padding: const EdgeInsets.fromLTRB(10, 2, 10, 3),
            //       decoration: BoxDecoration(
            //         color: constant.appColorDark,
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(5),
            //           bottomLeft: Radius.circular(5),
            //         ),
            //       ),
            //       child: Text(
            //         "Love",
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           fontSize: 11,
            //           fontWeight: FontWeight.w700,
            //           color: constant.appWhite,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 3,
            //     ),
            //     Container(
            //       padding: const EdgeInsets.fromLTRB(10, 2, 10, 3),
            //       decoration: const BoxDecoration(
            //         color: Color(0xffF230F6),
            //         borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(5),
            //           bottomRight: Radius.circular(5),
            //         ),
            //       ),
            //       child: Text(
            //         "me",
            //         textAlign: TextAlign.left,
            //         style: TextStyle(
            //           fontSize: 11,
            //           fontWeight: FontWeight.w700,
            //           color: constant.appWhite,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: constant.appBlack,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 230,
                    width: 230,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Color.fromARGB(255, 173, 57, 197),
                    ),
                    child: Image.asset(
                      "assets/flower.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  // const Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 60, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              eventDetails!["date"].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w400,
                                color: constant.appWhite,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${eventDetails!["month"]}'23",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: constant.appWhite,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "16 days left",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: constant.appWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 50, 24),
                        child: WhiteContainer(
                          text: eventDetails!["time"].toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Text(
              eventDetails!["description"].toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: constant.appBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
