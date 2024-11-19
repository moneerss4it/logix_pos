import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:app/data/api/api_client.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository


  // Retrieving localized data
 Map<String, Map<String, String>> _languages = Map();
  // for(LanguageModel languageModel in AppConstants.languages) {
  //   String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
  //   Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
  //   Map<String, String> _json = Map();
  //   _mappedJson.forEach((key, value) {
  //     _json[key] = value.toString();
  //   });
  //   _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  // }
   return _languages;
}
