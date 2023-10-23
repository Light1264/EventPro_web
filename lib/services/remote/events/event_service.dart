
import 'package:eventpro_web/model/wish_card_response.dart';

import '../../../model/event_response.dart';
import '../../../utils/locator.dart';
import '../../local/local_cache.dart';
import 'events_interface.dart';

class EventServiceImpl implements EventService {
  final EventRepository _authRepository;
  // ignore: unused_field
  final LocalCache _localCache;

  EventServiceImpl({
    EventRepository? authRepository,
    LocalCache? localCache,
  })  : _authRepository = authRepository ?? locator(),
        _localCache = localCache ?? locator();



  @override
  Future<EventResponse> scheduleEvent ({
    required String eventname,
    required String date,
    required String time,
    required String eventDescription,
    required List eventTypes,}) async {
    final response = await _authRepository.scheduleEvent(
      eventname: eventname,
      date: date,
      time: time,
      eventDescription: eventDescription,
      eventTypes: eventTypes,
    );
    print("object1");
    print(response.toJson());
    print("object2");
    return response;
  }

   @override
   Future<WishCardResponse> scheduleWishCard({
    required Map<String, String> wishCard,
    required String recipientName,
    required String wishDate,
    required String wishTime,
    required String recipientEmail,
  }) async {
     final response = await _authRepository.scheduleWishCard(
      wishCard: wishCard,
      recipientName: recipientName,
      wishDate: wishDate,
      wishTime: wishTime,
      recipientEmail: recipientEmail,
    );

    print("object1");
    print(response.toJson());
    print("object2");
    return response;
  }
  

}
