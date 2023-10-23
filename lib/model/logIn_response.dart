// To parse this JSON data, do
//
//     final SignInResponse = SignInResponseFromJson(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromJson(String str) => SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
    String accessToken;
    User user;

    SignInResponse({
        required this.accessToken,
        required this.user,
    });

    factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        accessToken: json["accessToken"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user.toJson(),
    };
}

class User {
    String id;
    String name;
    String email;
    String password;
    dynamic otp;
    String token;
    int v;
    String refreshToken;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        this.otp,
        required this.token,
        required this.v,
        required this.refreshToken,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        token: json["token"],
        v: json["__v"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "otp": otp,
        "token": token,
        "__v": v,
        "refreshToken": refreshToken,
    };
}
