import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  static List<String> languages = ['English', 'Uzbek', 'Russian'];
  static bool isLight = true;

  static Future<String> get selectedLanguage async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('lang') ?? 'English';
  }

  static Future<bool> get getIsLight async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String response =
        sharedPreferences.getString('adaptive_theme_preferences') ?? '';
    if (response.isEmpty) {
      return true;
    }
    Map<String, dynamic> decodedData = jsonDecode(response);
    return decodedData['theme_mode'] == 1 ? false : true;
  }
}
