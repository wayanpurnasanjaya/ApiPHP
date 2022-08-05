import 'package:flutter/material.dart';
import 'package:apiphp/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  int? value;
  String? username,fullName,id;

  Future<void>saveSessin(
      int? nValue,
      String? nUsername,
      String? nId,
      String? nFullname
      )async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("value", nValue ?? 0);
    preferences.setString("username", nUsername ?? "");
    preferences.setString("id", nId ?? '');
    preferences.setString("fullname", nFullname ?? '');
  }
  Future getSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    value = preferences.getInt("value");
    username = preferences.getString("username");
    fullName = preferences.getString("fullname");
    id = preferences.getString("id");
    return value;
  }
  Future<void> clearSession(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
// ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false);
  }
}