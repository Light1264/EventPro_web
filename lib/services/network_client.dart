import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'exceptions/failure.dart';
import '../utils/api_routes.dart';
import 'local/local_cache.dart';
import '../utils/locator.dart';
import 'network_interceptor.dart';
import 'package:mime/mime.dart';

enum FormDataType { post, patch, put }

class NetworkClient {
  NetworkClient._internal();

  static final _singleton = NetworkClient._internal();

  factory NetworkClient() => _singleton;

  // late final LocalCache _localCache = locator<LocalCache>();
  final LocalCache _localCache = locator();

  final Dio _dio = createDio();

// ======================================================
//================== Dio Initialization =================
//=======================================================

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      receiveTimeout: const Duration(seconds: 25), // 15 seconds
      connectTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 25),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  //  Dio createDio() {
  //   var dio = Dio(BaseOptions(
  //     baseUrl: ApiRoutes.baseUrl,
  //     receiveTimeout: const Duration(seconds: 25), // 15 seconds
  //     connectTimeout: const Duration(seconds: 25),
  //     sendTimeout: const Duration(seconds: 25),
  //   ));

  //   if (_localCache.getToken() != null) {
  //     print("YOUR_BEARER_TOKEN ++++++++++");
  //     dio.interceptors.addAll({
  //     AppInterceptors(dio),
  //     InterceptorsWrapper(
  //       onRequest: (options, handler) {
  //         // Replace 'YOUR_BEARER_TOKEN' with your actual bearer token
  //         options.headers['Authorization'] = _localCache.getToken();
  //         return handler.next(options);
  //       },
  //     )
  //   });
  //   } else {
  //     dio.interceptors.addAll({
  //     AppInterceptors(dio),
  //   });
  //   }

  //   return dio;
  // }

  Map<String, String> get _getAuthHeader {
    final token = _localCache.getToken();
    if (token != null && token.isNotEmpty) {
      return {
        // "X-Parse-Session-Token": token,
        // "X-Parse-Application-Id": ApiRoutes.appId,
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
    }
    return {
      // "X-Parse-Application-Id": ApiRoutes.appId,
      "Content-Type": "application/json"
    };
  }

// ======================================================
//======================== Get ==========================
//=======================================================
  ///get request
  Future<T> get<T>(
    /// the api route path without the base url
    ///
    String uri, {
    Map<String, dynamic> queryParameters = const {},
    // Options options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      log(queryParameters.toString());
      Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            ..._getAuthHeader,
          },
        ),
      );

      return response.data as T;
    } on Failure {
      rethrow;
    }
  }

// ======================================================
//======================== POST ==========================
//=======================================================
  ///Post request
  Future<dynamic> post(
    /// the api route without the base url
    String uri, {
    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// https://she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},
    Object? body,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      print("got here 3");
      Response response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            ..._getAuthHeader,
          },
        ),
      );
      print("-------------- ${_getAuthHeader.toString()}");
      log("### ${response.statusCode.toString()}");
      log("+++++++++++++ ${response.data.toString()}");
      log("=========== ${response.statusCode.toString()}");
      print("responsse ${response.data}");
      return response.data;
    } on Failure {
      rethrow;
    }
  }

// ======================================================
//====================== Form data ======================
//=======================================================
  ///Form Data

  Future<dynamic> sendFormData(
    FormDataType requestType, {
    /// route path without baseurl
    required String uri,

    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},

    /// data to be sent
    /// [must not add file]
    required Map<String, dynamic> body,

    /// Files to be sent
    /// [Files only]
    /// for all the images you want to send
    /// the key would act as the parameter sent
    /// to the server
    Map<String, String> images = const {},
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Map<String, MultipartFile> multipartImages = {};

      await Future.forEach<MapEntry<String, String>>(
        images.entries,
        (item) async {
          final mimeTypeData =
              lookupMimeType(item.value, headerBytes: [0xFF, 0xD8])?.split("/");
          multipartImages[item.key] = await MultipartFile.fromFile(
            item.value,
            contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
          );
        },
      );

      FormData formData = FormData.fromMap({
        ...body,
        ...multipartImages,
      });
      Response response;
      if (FormDataType.patch == requestType) {
        response = await _dio.patch(
          uri,
          queryParameters: queryParameters,
          data: formData,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: Options(
            headers: {
              ..._getAuthHeader,
            },
          ),
        );
      } else if (FormDataType.put == requestType) {
        response = await _dio.put(
          uri,
          queryParameters: queryParameters,
          data: formData,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: Options(
            headers: {
              ..._getAuthHeader,
            },
          ),
        );
      } else {
        response = await _dio.post(
          uri,
          queryParameters: queryParameters,
          data: formData,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          options: Options(
            headers: {
              ..._getAuthHeader,
            },
          ),
        );
      }

      return response.data;
    } on Failure {
      rethrow;
    }
  }
}
