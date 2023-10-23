import '../../../model/logIn_response.dart';
import '../../../model/register_response.dart';
import '../../../utils/locator.dart';
import '../../local/local_cache.dart';
import 'auth_interface.dart';

class AuthServiceImpl implements AuthService {
  final AuthRepository _authRepository;
  // ignore: unused_field
  final LocalCache _localCache;

  AuthServiceImpl({
    AuthRepository? authRepository,
    LocalCache? localCache,
  })  : _authRepository = authRepository ?? locator(),
        _localCache = localCache ?? locator();

  @override
  Future<RegisterResponse> registration(
      {required String name,
      required String email,
      required String password}) async {
    final response = await _authRepository.registration(
        name: name, email: email, password: password);
    print("object1");
    print(response.toJson());
    print("object2");
    return response;
  }

  @override
  Future<SignInResponse> signIn(
      {required String email, required String password}) async {
    final response =
        await _authRepository.signIn(email: email, password: password);
    await _localCache.saveToken(response.accessToken);
    await _localCache.saveToLocalCache(key: "id", value: response.user.id);
    print("object1");
    print(response.toJson());
    print("object2");
    return response;
  }

  @override
  Future<dynamic> forgotPassword({
    required String email,
  }) async {
    final response = await _authRepository.forgotPassword(
      email: email,
    );
    print("object1");
    print(response.toJson());
    print("object2");
    return response;
  }

  @override
  Future<dynamic> logOut() async {
    final response = await _authRepository.logOut();

    return response;
  }
}
