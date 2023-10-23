import 'package:eventpro_web/base_view_model.dart';
import 'package:eventpro_web/model/app_state/view_model_state.dart';
import 'package:eventpro_web/services/exceptions/failure.dart';
import 'package:eventpro_web/services/remote/events/events_interface.dart';
import 'package:eventpro_web/utils/dialog.dart';
import 'package:eventpro_web/utils/functions.dart';
import 'package:eventpro_web/utils/locator.dart';
import 'package:flutter/material.dart';

class CardsViewModel extends ChangeNotifier {
  //  final AuthService authServices = locator();

  TextEditingController recipientName = TextEditingController();
  TextEditingController recipientEmailAddress = TextEditingController();
  TextEditingController cardMessage = TextEditingController();
  final EventService eventService = locator();
  final BaseViewModel baseViewModel = BaseViewModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int day = DateTime.now().day;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  DateTime currentDate = DateTime.now();
  String period = 'pm';

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

  List<Map<String, String>> wishCards = [
    {"wishCard": "assets/wish_card1.png"},
    {"wishCard": "assets/wish_card2.png"},
    {"wishCard": "assets/wish_card3.png"},
    {"wishCard": "assets/wish_card4.png"},
    {"wishCard": "assets/wish_card5.png"},
    {"wishCard": "assets/wish_card6.png"},
    {"wishCard": "assets/wish_card1.png"},
    {"wishCard": "assets/wish_card2.png"},
    {"wishCard": "assets/wish_card3.png"},
    {"wishCard": "assets/wish_card4.png"},
    {"wishCard": "assets/wish_card5.png"},
    {"wishCard": "assets/wish_card6.png"},
    {"wishCard": "assets/wish_card1.png"},
    {"wishCard": "assets/wish_card2.png"},
    {"wishCard": "assets/wish_card3.png"},
    {"wishCard": "assets/wish_card4.png"},
    {"wishCard": "assets/wish_card5.png"},
    {"wishCard": "assets/wish_card6.png"},
  ];

  scheduleWishCard({
    required BuildContext context,
    required Map<String, String> wishCard,
    required String recipientName,
    required String wishDate,
    required String wishTime,
    required String recipientEmail,
  }) async {
    baseViewModel.changeState(const ViewModelState.busy());
    try {
      await eventService.scheduleWishCard(
        wishCard: wishCard,
        recipientName: recipientName,
        wishDate: wishDate,
        wishTime: wishTime,
        recipientEmail: recipientEmail,
      );

      baseViewModel.changeState(const ViewModelState.idle());
      showMyDialog(context, "Wish Card schedule successful");
      notifyListeners();
    } on Failure {
      baseViewModel.changeState(const ViewModelState.idle());
      notifyListeners();
      showMyToast("An error occured");
    }
    baseViewModel.changeState(const ViewModelState.idle());
  }
}
