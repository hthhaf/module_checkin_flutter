import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/models/auth_login_model.dart';
import 'package:flutter_check_in_app/state/services/apis/auth_api.dart';
import 'package:flutter_check_in_app/state/services/local/shared_preferences.dart';
import 'package:flutter_check_in_app/state/services/local/shared_references_key.dart';

class AuthProvider with ChangeNotifier {
  AuthLoginModel _auth = AuthLoginModel(
    id: -1,
    username: 'undefine',
    token: 'empty token',
  );

  AuthLoginModel get auth => _auth;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    final res = await AuthService.login(username: username, password: password);
    _auth = AuthLoginModel.fromJson(res);
    await SharedRServices().setString(SharedKeys.accountUser, jsonEncode(res));
  }
}
