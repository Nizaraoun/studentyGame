import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/usermodel.dart';

Future<bool> saveUserProfile(UserProfile profile) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String profileString = jsonEncode(profile.toJson());
  return prefs.setString('userProfile', profileString);
}

Future<UserProfile?> getUserProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? profileString = prefs.getString('userProfile');
  if (profileString != null) {
    Map<String, dynamic> json = jsonDecode(profileString);
    return UserProfile.fromJson(json);
  }
  return null;
}

// delete data from database
Future<bool> deleteUserProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove('userProfile');
}

// update data from database
Future<bool> updatePreferences(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}
