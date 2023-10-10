// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:flutter_check_in_app/state/services/http/dio_services.dart';
import 'package:flutter_check_in_app/state/services/http/http_endpoints.dart';

class AuthService {
  static String endpoint = Endpoints.authEndpoint;

  static Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    // ignore: unnecessary_string_interpolations
    final url = '$endpoint';
    final data = {
      "username": username,
      "password": password,
    };
    final res = await DioClient.post(url, data, haveToken: false);
    return jsonDecode(res.toString());
  }
}
