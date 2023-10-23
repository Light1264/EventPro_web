import 'package:eventpro_web/model/wish_card_response.dart';

import '../../../model/event_response.dart';
import '../../../utils/api_routes.dart';
// import '../../../utils/k_logger.dart';
import '../../../utils/locator.dart';
import '../../local/local_cache.dart';
import '../../network_client.dart';
import 'events_interface.dart';

class EventRepositoryImpl implements EventRepository {
  // final _log = appLogger(AuthRepository);
  final NetworkClient _networkClient = NetworkClient();
  final LocalCache _localCache = locator();

  @override
  Future<EventResponse> scheduleEvent({
    required String eventname,
    required String date,
    required String time,
    required String eventDescription,
    required List eventTypes,
  }) async {
    final response = await _networkClient.post(ApiRoutes.scheduleEvent, body: {
      "eventName": eventname,
      "date": date,
      "time": time,
      "eventDescription": eventDescription,
      "eventTypes": eventTypes,
      "userId": _localCache.getFromLocalCache("id"),
    });

    print("@@@@@ ${_localCache.getFromLocalCache("id")}");
    return EventResponse.fromJson(response);
  }

  @override
  Future<WishCardResponse> scheduleWishCard({
    required Map<String, String> wishCard,
    required String recipientName,
    required String wishDate,
    required String wishTime,
    required String recipientEmail,
  }) async {
    print("response ===== $wishCard");
    final response = await _networkClient.sendFormData(
      FormDataType.post,
      uri: ApiRoutes.scheduleWishCard,
      images: wishCard,
      body: {
        "userId": _localCache.getFromLocalCache("id"),
        "recipientName": recipientName,
        "wishDate": wishDate,
        "wishTime": wishTime,
        "recipientEmail": recipientEmail,
      },
    );

    print("@@@@@ $response");
    return WishCardResponse.fromJson(response);
  }
}
