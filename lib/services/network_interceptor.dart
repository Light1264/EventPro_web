import 'package:dio/dio.dart';
import 'exceptions/exception.dart';
import 'exceptions/failure.dart';


class AppInterceptors extends Interceptor {
  // final _log = appLogger(AppInterceptors);
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // checkStatusCode(response.requestOptions, response);
    // print(÷.realUri);
    print(options.path);
    print(options.uri);
    // print(options;
    return handler.next(options);
  }

  @override
  Future<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    checkStatusCode(response.requestOptions, response);
    // print(response.realUri);
    print(response.requestOptions.path);
    print(response.requestOptions.uri);
    return handler.next(response);
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    print(err.requestOptions.headers);
    print(err.requestOptions.data);
    print(err.requestOptions.uri);
    print(err.response?.data);
    print(err.response?.statusCode);

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        // reasign err variable
        err = DeadlineExceededException(err.requestOptions);
        break;
      case DioErrorType.badResponse:
        try {
          checkStatusCode(err.requestOptions, err.response);
        } on DioError catch (failure) {
          // reasign err variable
          err = failure;
        }

        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        // _log.e(err.message);
        err = NoInternetConnectionException(err.requestOptions);
        break;
      
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
    
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        break;
    
    }
    //continue
    return handler.next(err);
  }

  void checkStatusCode(RequestOptions requestOptions, Response? response) {
    try {
      switch (response?.statusCode) {
        case 200:
        case 204:
        case 201:
          break;
        case 400:
          throw BadRequestException(requestOptions, response);
        case 401:
          throw UnauthorizedException(requestOptions, response);
        case 404:
          throw NotFoundException(requestOptions);
        case 409:
          throw ConflictException(requestOptions, response);
        case 500:
          throw InternalServerErrorException(requestOptions);
        default:
          // _log.e(response?.data);
          // _log.e(response?.statusCode);
          throw ServerCommunicationException(response);
      }
    } on Failure {
      rethrow;
    }
  }
}
