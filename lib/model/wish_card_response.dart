// To parse this JSON data, do
//
//     final WishCardResponse = WishCardResponseFromJson(jsonString);

import 'dart:convert';

WishCardResponse wishCardResponseFromJson(String str) => WishCardResponse.fromJson(json.decode(str));

String wishCardResponseToJson(WishCardResponse data) => json.encode(data.toJson());

class WishCardResponse {
    String wishCard;
    String recipientName;
    DateTime wishDate;
    String wishTime;
    String recipientEmail;
    String userId;
    String id;
    int v;

    WishCardResponse({
        required this.wishCard,
        required this.recipientName,
        required this.wishDate,
        required this.wishTime,
        required this.recipientEmail,
        required this.userId,
        required this.id,
        required this.v,
    });

    factory WishCardResponse.fromJson(Map<String, dynamic> json) => WishCardResponse(
        wishCard: json["wishCard"],
        recipientName: json["recipientName"],
        wishDate: DateTime.parse(json["wishDate"]),
        wishTime: json["wishTime"],
        recipientEmail: json["recipientEmail"],
        userId: json["userId"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "wishCard": wishCard,
        "recipientName": recipientName,
        "wishDate": wishDate.toIso8601String(),
        "wishTime": wishTime,
        "recipientEmail": recipientEmail,
        "userId": userId,
        "_id": id,
        "__v": v,
    };
}
