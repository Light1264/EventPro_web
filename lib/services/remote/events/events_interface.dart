import 'package:eventpro_web/model/wish_card_response.dart';

import '../../../model/event_response.dart';

abstract class EventInterface {
  Future<EventResponse> scheduleEvent({
    required String eventname,
    required String date,
    required String time,
    required String eventDescription,
    required List eventTypes,
  });
  
    Future<WishCardResponse> scheduleWishCard({
    required Map<String, String> wishCard,
    required String recipientName,
    required String wishDate,
    required String wishTime,
    required String recipientEmail,
  });
}

abstract class EventRepository implements EventInterface {}

abstract class EventService implements EventInterface {}
