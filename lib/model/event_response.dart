// To parse this JSON data, do
//
//     final EventResponse = EventResponseFromJson(jsonString);

import 'dart:convert';

EventResponse eventResponseFromJson(String str) => EventResponse.fromJson(json.decode(str));

String eventResponseToJson(EventResponse data) => json.encode(data.toJson());

class EventResponse {
    String eventName;
    DateTime date;
    String time;
    String eventDescription;
    List<String> eventTypes;
    String userId;
    String id;
    int v;

    EventResponse({
        required this.eventName,
        required this.date,
        required this.time,
        required this.eventDescription,
        required this.eventTypes,
        required this.userId,
        required this.id,
        required this.v,
    });

    factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        eventName: json["eventName"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        eventDescription: json["eventDescription"],
        eventTypes: List<String>.from(json["eventTypes"].map((x) => x)),
        userId: json["userId"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "date": date.toIso8601String(),
        "time": time,
        "eventDescription": eventDescription,
        "eventTypes": List<dynamic>.from(eventTypes.map((x) => x)),
        "userId": userId,
        "_id": id,
        "__v": v,
    };
}
