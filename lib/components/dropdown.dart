import 'package:eventpro_web/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/bottom_nav_bar_screens/event_screens/view_model/events_view_model.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({
    Key? key,
    required this.categories,
    required this.dropDownType,
  }) : super(key: key);
  final List<String> categories;
  final String dropDownType;

  @override
  State<DropDownButton> createState() => _DropDownButton();
}

class _DropDownButton extends State<DropDownButton> {
  String? values;

  @override
  Widget build(BuildContext context) {
    EventsViewModel eventsViewModel = context.watch<EventsViewModel>();
    return SizedBox(
      height: 39,
      child: DropdownButton<String>(
        isExpanded: true,
        value: values,
        underline: const SizedBox(),
        focusColor: Colors.transparent,
        hint: Text(
          "Event type",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: constant.appBlack.withOpacity(0.8),
          ),
        ),
        items: widget.categories.map(buildItem).toList(),
        icon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          size: 30,
        ),
        onChanged: (value) {
          setState(() {
            values = value;
            if (widget.dropDownType == "EventType") {
              eventsViewModel.eventChosen = values.toString();
            } else if (widget.dropDownType == "Time") {
              eventsViewModel.eventChosen = values.toString();
            } else if (widget.dropDownType == "TimeType") {
              eventsViewModel.eventChosen = values.toString();
            }
          });
        },
      ),
    );
  }

  DropdownMenuItem<String> buildItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: FittedBox(
        child: Text(
          item,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: constant.appBlack,
          ),
        ),
      ),
    );
  }
}
