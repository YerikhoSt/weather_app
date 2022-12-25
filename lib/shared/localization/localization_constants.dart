import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/shared/localization/custom_localization.dart';

//this function is to convert key string of active language values;

String? getTranslated(BuildContext context, String key) =>
    CustomLocalizations.of(context)!.translate(key);

//variable that defined language code for preferences
const String languageCode = 'languageCode';

//this function to set language code preferences to active one
Future<void> setLocale(String language) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(languageCode, language);
  return;
}

//this function to get language code Locale class from active one
Future<Locale?> getLocale() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString(languageCode) == null) {
    //by default get locale from device;
    return null;
  } else {
    return Locale(prefs.getString(languageCode)!.split('_')[0],
        prefs.getString(languageCode)!.split('_')[1]);
  }
}
