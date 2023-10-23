import 'package:eventpro_web/model/logIn_response.dart';

import '../../../model/register_response.dart';

abstract class AuthInterface {
  Future<RegisterResponse> registration(
      {required String name, required String email, required String password});
  Future<SignInResponse> signIn(
      {required String email, required String password});
  Future<dynamic> forgotPassword({
    required String email,
  });
  Future<dynamic> logOut();
}

abstract class AuthRepository implements AuthInterface {}

abstract class AuthService implements AuthInterface {}
