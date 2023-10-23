import 'package:flutter/material.dart';

import '../../../../main.dart';

// ignore: must_be_immutable
class UpcomingEventDate extends StatelessWidget {
  UpcomingEventDate({super.key, required this.index, required this.eventDetails});
  int index;
  Map<String, String> eventDetails;

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(21, 5, 12, 5),
                  decoration: BoxDecoration(
                    color: constant.appColorDark,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    eventDetails["date"].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: constant.appWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    eventDetails["month"].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: constant.appBlack,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    eventDetails["day"].toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: constant.appBlack,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  eventDetails["date"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: constant.appBlack,
                  ),
                ),
                Text(
                  eventDetails["month"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: constant.appBlack,
                  ),
                ),
                Text(
                  eventDetails["day"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: constant.appBlack,
                  ),
                ),
              ],
            ),
          );
  }
}
