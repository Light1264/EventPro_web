import 'dart:developer';

import 'package:dio/dio.dart';

import 'failure.dart';


class PaymentException extends Failure {
  PaymentException(this._title, this._message);
  final String _title;
  final String _message;

  @override
  String get message => _message;

  @override
  String get title => _title;
}

class LocalPersistenceException extends Failure {
  LocalPersistenceException(this._title, this._message);
  final String _title;
  final String _message;

  @override
  String get message => _message;

  @override
  String get title => _title;
}

class UserDefinedException extends Failure {
  UserDefinedException(this._title, this._message);
  final String _title;
  final String _message;

  @override
  String get message => _message;

  @override
  String get title => _title;
}

/// 400
class BadRequestException extends DioError with Failure {
  BadRequestException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      getError(serverResponse) ?? "Something went wrong, please try again";

  @override
  String get title => "An error occured";
}

/// 500
class InternalServerErrorException extends DioError with Failure {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => 'Unknown error occurred, please try again later.';

  @override
  String get title => 'Server error';
}

/// 409
class ConflictException extends DioError with Failure {
  ConflictException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      getError(serverResponse) ?? "You cannot perform this action";
  @override
  String get title => 'Network error';
}

/// 401
class UnauthorizedException extends DioError with Failure {
  UnauthorizedException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      getError(serverResponse) ?? "You cannot perform this action";
  @override
  String get title => 'Access denied';
}

/// 404
class NotFoundException extends DioError with Failure {
  NotFoundException(this.request, [this.serverResponse])
      : super(requestOptions: request, response: serverResponse);
  final RequestOptions request;
  final Response? serverResponse;
  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message =>
      getError(serverResponse) ?? "Not Found, please try again.";

  // @override
  // String get message => "Not Found, please try again.";

  @override
  String get title => "Not Found";
}

/// No Internet
class NoInternetConnectionException extends DioError with Failure {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "No internet connection, please try again.";

  @override
  String get title => "Network error";
}

/// Timeout
class DeadlineExceededException extends DioError with Failure {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message => "The connection has timed out, please try again.";

  @override
  String get title => "Network error";
}

/// errors sent back by the server in json
class ServerCommunicationException extends DioError with Failure {
  ServerCommunicationException(this.r)
      : super(requestOptions: r!.requestOptions);

  /// sustained so that the data sent by the server can be gotten to construct message
  final Response? r;

  @override
  String toString() {
    return 'title: $title message: $message';
  }

  @override
  String get message {
    log(r?.data?.toString() ?? "");
    return getMessagefromServer(
      r?.data as Map<String, dynamic>? ?? {"error": "Server Error"},
    );
  }
  // eddietonsagie@gmail.com

  @override
  String get title => "Network error";
}

String? getError(Response<dynamic>? serverResponse) {
  //return serverResponse?.data?['message'] as String? ??
  return serverResponse?.data?['error'] as String? ??
      serverResponse?.data?['errors'] as String? ??serverResponse?.data?['message'] as String?;
}
