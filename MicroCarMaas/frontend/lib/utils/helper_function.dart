import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

Future<bool> saveToken(String token) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setString("accessToken", token);
}

Future<bool> saveExpirationDuration(int duration) async {
  final pref = await SharedPreferences.getInstance();
  return pref.setInt("expirationDuration", duration);
}

String? validatePhoneNumber({required String phoneNumber}) {
  print("girdi1");
  RegExp phoneRegExp = RegExp(r"^(5\d{9})$");
  print("girdi1");

  String phoneNumberString = phoneNumber.toString();

  if (phoneNumberString.isEmpty) {
    return 'Telefon numarası boş olamaz';
  } else if (!phoneRegExp.hasMatch(phoneNumberString)) {
    return 'Lütfen doğru formatta telefon numarası girin';
  }

  return null;
}

