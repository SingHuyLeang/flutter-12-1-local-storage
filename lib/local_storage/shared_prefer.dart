import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefer {
  static const String emailKey = "email_key";
  static const String passwordKey = "password_key";

  Future<void> write(String email, String password) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool e = await pref.setString(emailKey, email);
    bool p = await pref.setString(passwordKey, password);
    log('e : $e');
    log('p : $p');
  }

}
