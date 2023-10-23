import '../../../model/logIn_response.dart';
import '../../../model/register_response.dart';
import '../../../utils/api_routes.dart';
// import '../../../utils/k_logger.dart';
import '../../../utils/locator.dart';
import '../../local/local_cache.dart';
import '../../network_client.dart';
import 'auth_interface.dart';

class AuthRepositoryImpl implements AuthRepository {
  // final _log = appLogger(AuthRepository);
  final NetworkClient _networkClient = NetworkClient();
  final LocalCache _localCache = locator();

  @override
  Future<RegisterResponse> registration(
      {required String name,
      required String email,
      required String password}) async {
    print("got here 2");
    final response = await _networkClient.post(ApiRoutes.register,
        body: {"name": name, "email": email, "pwd": password});

    // _localCache.saveToken(response["sessionToken"]);

    print("@@@@@ $response");
    return RegisterResponse.fromJson(response);
  }

  @override
  Future<SignInResponse> signIn(
      {required String email, required String password}) async {
    final response = await _networkClient
        .post(ApiRoutes.signIn, body: {"email": email, "pwd": password});
    _localCache.saveToken(response["accessToken"]);
    _localCache.saveToLocalCache(key: "id", value: response["user"]["_id"]);
    print("access Token -------- ${_localCache.getToken()}");
    return SignInResponse.fromJson(response);
  }

  @override
  Future<dynamic> forgotPassword({required String email}) async {
    final response = await _networkClient.post(ApiRoutes.register, body: {
      "email": email,
    });
    return response;
  }

  @override
  Future<dynamic> logOut() async {
    final response = await _networkClient.post(
      ApiRoutes.logOut,
    );
    return response;
  }
}
