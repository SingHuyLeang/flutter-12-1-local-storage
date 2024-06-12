import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_storage/local_storage/database.dart';
import 'package:local_storage/model/user_model.dart';

class UserController {
  final db = SQLiteHelper();
  Future<void> signUp(UserModel user) async {
    if (await db.insertUser(user)) {
      log("Insert Success");
    }
  }

  Future<bool> signIn(UserModel user) async {
    return await db.select(user);
  }
}
