// To parse this JSON data, do
//
//     final RegisterResponse = RegisterResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
    String success;
    User user;

    RegisterResponse({
        required this.success,
        required this.user,
    });

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        success: json["success"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
    };
}

class User {
    String name;
    String email;
    String password;
    dynamic otp;
    String token;
    String id;
    int v;

    User({
        required this.name,
        required this.email,
        required this.password,
        this.otp,
        required this.token,
        required this.id,
        required this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        otp: json["otp"],
        token: json["token"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "otp": otp,
        "token": token,
        "_id": id,
        "__v": v,
    };
}

// // To parse this JSON data, do
// //
// //     final RegisterResponse = RegisterResponseFromJson(jsonString);

// import 'dart:convert';

// RegisterResponse RegisterResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

// String RegisterResponseToJson(RegisterResponse data) => json.encode(data.toJson());

// class RegisterResponse {
//     String success;
//     String token;

//     RegisterResponse({
//         required this.success,
//         required this.token,
//     });

//     factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
//         success: json["success"],
//         token: json["token"],
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "token": token,
//     };
// }

