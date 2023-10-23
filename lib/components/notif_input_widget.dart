import 'package:eventpro_web/components/dropdown.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NotificationInputWidget extends StatelessWidget {
  const NotificationInputWidget({
    super.key,
    required this.timeCategories,
  });
  final List<String> timeCategories;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications,
          size: 25,
          color: constant.appGrey,
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: constant.appGrey),
                  // color: constant.appWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Reminder",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: constant.appBlack,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: constant.appGrey),
                    // color: constant.appWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropDownButton(
                    categories: timeCategories,
                    dropDownType: "Time",
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "30",
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         fontSize: 11,
                  //         fontWeight: FontWeight.w400,
                  //         color: constant.appBlack,
                  //       ),
                  //     ),
                  //     const Icon(Icons.keyboard_arrow_down_rounded)
                  //   ],
                  // ),
                  ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                width: 85,
                decoration: BoxDecoration(
                  border: Border.all(color: constant.appGrey),
                  // color: constant.appWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "minutes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: constant.appBlack,
                      ),
                    ),
                    // const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
