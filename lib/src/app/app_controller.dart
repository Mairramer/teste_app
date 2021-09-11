import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste/src/modules/home/home_page.dart';
import 'package:teste/src/modules/login/login_page.dart';

class AppController {
  var _user = FirebaseAuth.instance.currentUser!.uid;

  String get userId => _user;

  void setUser(BuildContext context, user) async {
    if (user != null) {
      saveUserId(user);
      _user = user;
      Get.to(HomePage());
    } else {
      Get.to(LoginPage());
    }
  }

  Future<void> saveUserId(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', userId);
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("id")) {
      final json = instance.get("id") as String;
      setUser(context, jsonDecode(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
