// ignore: depend_on_referenced_packages
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';
import '../local/shared_preferences.dart';
import '../local/shared_references_key.dart';
import 'dio_exceptions.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: Endpoints.connectionTimeout),
      receiveTimeout: const Duration(seconds: Endpoints.receiveTimeout),
    ),
  )..interceptors.addAll([
      Logging(),
    ]);

  static Future<Options> opts({required haveToken}) async {
    if (haveToken) {
      final savedUser = await SharedRServices().getString(
        SharedKeyDefaultValues.localUser,
      );
      final parseUser = jsonDecode(savedUser);
      final String accessToken = parseUser['token'] ?? '';
      return Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${haveToken ? accessToken : ""}",
        },
      );
    }

    return Options(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer",
      },
    );
  }

  static Future<Response> get(
    String url, {
    haveToken = true,
  }) async {
    try {
      final options = await opts(haveToken: haveToken);
      final response = await _dio.get(url, options: options);
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<Response> post(
    String url,
    Map<String, dynamic>? data, {
    haveToken = true,
  }) async {
    try {
      final options = await opts(haveToken: haveToken);
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<Response> patch(
    String url,
    Map<String, dynamic> data, {
    haveToken = true,
  }) async {
    try {
      final options = await opts(haveToken: haveToken);
      final Response response = await _dio.patch(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<Response> put(
    String url,
    Map<String, dynamic> data, {
    haveToken = true,
    Options? options,
  }) async {
    try {
      final options = await opts(haveToken: haveToken);
      final Response response = await _dio.put(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  static Future<dynamic> delete(
    String url,
    Map<String, dynamic> data, {
    // Map<String, dynamic>? queryParameters,
    Options? options,
    haveToken = true,
    // CancelToken? cancelToken,
    // ProgressCallback? onSendProgress,
    // ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final options = await opts(haveToken: haveToken);
      final Response response = await _dio.delete(
        url,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Start Debug.........");
    print('==> Request');
    // print(
    //   "[${options.method.toString().toUpperCase()}] ${options.baseUrl.toString()}${options.path.toString()}",
    // );
    // print(
    //   "[Header - Access Token] ${options.headers['authorization'].toString()}",
    // );
    if (options.data != null) {
      print("[Body] ${options.data.toString()}");
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('<== On Error');
    print(
      "[${err.type.toString().toUpperCase()} - ${err.message.toString()}]",
    );
    // print(
    //   "[${err.requestOptions.data.toString().toUpperCase()} - ${err.requestOptions.baseUrl.toString()}]",
    // );
    // print("End Debug.........\n");
    //_loginf(context);
    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('<== Response');
    print(
      "[${response.statusMessage.toString().toUpperCase()} - ${response.statusCode.toString()}]",
    );
    // print(
    //   "[Header - Access-control-allow-origin] ${response.headers['access-control-allow-origin'].toString()}",
    // );
    // if (response.data != null) {
    //   print("[Body] ${response.data.toString()}");
    // }
    // print("End Debug.........\n");
    return super.onResponse(response, handler);
  }
}
