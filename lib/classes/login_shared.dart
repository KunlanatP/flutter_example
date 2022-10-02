import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_example/classes/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('login_details') != null ? true : false;
  }

  static Future<List<UserModel>?> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('login_details') != null) {
      final data =
          jsonDecode(prefs.getString('login_details')!) as List<dynamic>;

      final details = [
        UserModel(
          firstname: 'firstname',
          lastname: 'lastname',
          email: 'email',
          username: 'username',
          password: 'password',
        ),
      ];
      return details;
    } else {
      return null;
    }
  }

  static Future<void> setLoginDetails(List<UserModel>? response) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'login_details',
        response != null
            ? jsonEncode(response.map((e) => e.toJson()).toList())
            : '');
  }

  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
