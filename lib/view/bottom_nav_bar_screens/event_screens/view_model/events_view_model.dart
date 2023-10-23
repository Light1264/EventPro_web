import 'package:eventpro_web/services/remote/events/events_interface.dart';
import 'package:flutter/material.dart';

import '../../../../base_view_model.dart';
import '../../../../model/app_state/view_model_state.dart';
import '../../../../services/exceptions/failure.dart';
import '../../../../utils/dialog.dart';
import '../../../../utils/functions.dart';
import '../../../../utils/locator.dart';

class EventsViewModel extends ChangeNotifier {
  //  final AuthService authServices = locator();
  final EventService eventService = locator();
  final BaseViewModel baseViewModel = BaseViewModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController eventName = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  TextEditingController search = TextEditingController();
  bool checkBoxValue = false;
  String signUpValues = "User";
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  DateTime currentDate = DateTime.now();
  String period = 'pm';

  List<String> timeCategory = [
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
  ];

  show_time(
    BuildContext context,
  ) async {
    TimeOfDay? timeOfPayment = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        );
      },
    );
    if (timeOfPayment != null) {
      hour = timeOfPayment.hour;
      minute = timeOfPayment.minute;
      period = (hour < 12) ? 'am' : 'pm';
      notifyListeners();
      print('Selected time: $hour:$minute $period');
    }
  }

  show_calendar(
    BuildContext context,
  ) async {
    DateTime? dateOfPayment = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2040),
      helpText: '2022',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                  primary: Color.fromRGBO(224, 86, 21, 0.2),
                  onPrimary: Color.fromRGBO(0, 0, 0, 0.64),
                  onSurface: Color.fromRGBO(0, 0, 0, 0.8)),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: const Color.fromRGBO(
                      127, 126, 130, 1), // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (dateOfPayment != null) {
      day = dateOfPayment.day;
      year = dateOfPayment.year;
      month = dateOfPayment.month;
      notifyListeners();
    }
  }

  List<String> eventType = [
    "Work",
    "Birthday",
    "Meeting",
    "Party",
  ];
  String eventChosen = '';
  List<Map<String, String>> eventDetails = [
    {
      "date": "16",
      "month": "OCT",
      "day": "Mon",
      "time": "7:00 - 8:00 am",
      "eventTitle": "Meeting with HNG",
      "description":
          "Meeting at HNG holds from 8 am to 9 am, don't be late and come with your task done"
    },
    {
      "date": "16",
      "month": "OCT",
      "day": "Mon",
      "time": "11:00 - 1:00 pm",
      "eventTitle": "Designgate UI/UX bootcamp",
      "Description": "Remember to do your designgate UI/UX bootcamp task",
    },
    {
      "date": "28",
      "month": "DEC",
      "day": "Thur",
      "time": "00:00 - 1:00 am",
      "eventTitle": "My birthday",
      "Description":
          "Happy birthday to the most beautiful, most talented, gifted and blessed girl. The day of your manifestation is here"
    },
  ];

  scheduleEvent({
    required BuildContext context,
    required String eventname,
    required String date,
    required String time,
    required String eventDescription,
    required List eventTypes,
  }) async {
    baseViewModel.changeState(const ViewModelState.busy());
    try {
      await eventService.scheduleEvent(
        eventname: eventname,
        date: date,
        time: time,
        eventDescription: eventDescription,
        eventTypes: eventTypes,
      );
      showMyToast("Sign In Successful");
      baseViewModel.changeState(const ViewModelState.idle());
      showMyDialog(context, "Event schedule successful");
      notifyListeners();
    } on Failure {
      baseViewModel.changeState(const ViewModelState.idle());
      notifyListeners();
      showMyToast("An error occured");
    }
    baseViewModel.changeState(const ViewModelState.idle());
  }
}
