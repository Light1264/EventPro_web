import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../view/bottom_nav_bar_screens/cards_screen/view-model/card_view-model.dart';
import '../view/bottom_nav_bar_screens/event_screens/view_model/events_view_model.dart';

class CalenderInputWidget extends StatefulWidget {
  const CalenderInputWidget({
    super.key,
    required this.calenderType
  });
  final String calenderType;

  @override
  State<CalenderInputWidget> createState() => _CalenderInputWidgetState();
}

class _CalenderInputWidgetState extends State<CalenderInputWidget> {
  @override
  Widget build(BuildContext context) {
    EventsViewModel eventsViewModel = context.watch<EventsViewModel>();
    CardsViewModel cardsViewModel = context.watch<CardsViewModel>();
    return Row(
      children: [
        Icon(
          Icons.calendar_month_outlined,
          color: constant.appGrey,
          size: 25,
        ),
        const SizedBox(
          width: 11,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if(widget.calenderType == "ScheduleCard"){
                    cardsViewModel.show_calendar(context,);
                  } else {
                    eventsViewModel.show_calendar(context,);
                  }
                  
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                  width: 146,
                  decoration: BoxDecoration(
                    border: Border.all(color: constant.appGrey),
                    // color: constant.appWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.calenderType == "ScheduleCard"? "${cardsViewModel.day}/${cardsViewModel.month}/${cardsViewModel.year}": "${eventsViewModel.day}/${eventsViewModel.month}/${eventsViewModel.year}",
                        // "wednesday, July 28",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: constant.appBlack,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(widget.calenderType == "ScheduleCard"){
                    cardsViewModel.show_time(context);
                  } else {
                    eventsViewModel.show_time(context);
                  }
                  
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 2, 5, 3),
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: constant.appGrey),
                    // color: constant.appWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.calenderType == "ScheduleCard"? "${cardsViewModel.hour}: ${cardsViewModel.minute} ${cardsViewModel.period}": "${eventsViewModel.hour}: ${eventsViewModel.minute} ${eventsViewModel.period}",
                        // "8:00 - 8:30 am",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: constant.appBlack,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

 
}
