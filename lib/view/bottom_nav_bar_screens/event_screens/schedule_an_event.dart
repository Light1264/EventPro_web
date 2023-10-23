import 'package:eventpro_web/components/app_button.dart';
import 'package:eventpro_web/components/calender_input_widget.dart';
import 'package:eventpro_web/components/dropdown.dart';
import 'package:eventpro_web/components/icon_textfield.dart';
import 'package:eventpro_web/components/loader_page.dart';
import 'package:eventpro_web/components/notif_input_widget.dart';
import 'package:eventpro_web/view/bottom_nav_bar_screens/event_screens/view_model/events_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/back_button.dart';
import '../../../components/title_widget.dart';
import '../../../main.dart';
import '../../../utils/functions.dart';

class ScheduleEvent extends StatefulWidget {
  const ScheduleEvent({super.key});

  @override
  State<ScheduleEvent> createState() => _ScheduleEventState();
}

class _ScheduleEventState extends State<ScheduleEvent> {

  @override
  Widget build(BuildContext context) {
    EventsViewModel eventsViewModel = context.watch<EventsViewModel>();
    return LoaderPage(
      isLoading: eventsViewModel.baseViewModel.isBusy,
      child: Form(
        key: eventsViewModel.formKey,
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
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      topText: "SCHEDULE AN",
                      bottomText: "EVENT",
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
                  textFieldController: eventsViewModel.eventName,
                  hintText: "Event name",
                  widgetIcon: Icon(
                    Icons.bar_chart,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                const CalenderInputWidget(calenderType: "ScheduleEvent"),
                const SizedBox(
                  height: 20,
                ),
                IconTextField(
                  textInputType: TextInputType.name,
                  textFieldController: eventsViewModel.eventDescription,
                  hintText: "Event description",
                  widgetIcon: Icon(
                    Icons.bar_chart,
                    color: constant.appGrey,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                NotificationInputWidget(timeCategories: eventsViewModel.timeCategory,),
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
                          child: DropDownButton(
                            categories: eventsViewModel.eventType,
                            dropDownType: "EventType",
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                AppButton(
                  buttonText: "SCHEDULE",
                  onPressed: () {
                    if (eventsViewModel.eventName.text.isNotEmpty) {
                      if (eventsViewModel.eventDescription.text.isNotEmpty) {
                        if (eventsViewModel.formKey.currentState?.validate() ??
                            false) {
                          FocusScope.of(context).unfocus();
                          eventsViewModel.scheduleEvent(
                            context: context,
                            eventname: eventsViewModel.eventName.text.trim(),
                            date: "2023-08-15",
                            time: "14:00",
                            eventDescription:
                                eventsViewModel.eventDescription.text.trim(),
                            eventTypes: ["Meeting", "Client"],
                          );
                        }
                      } else {
                        showMyToast("Please enter your password");
                      }
                    } else {
                      showMyToast("Please enter your email address");
                    }
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
