import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splash = '/splash';
  static const String dashboard = '/dashboard';
  static const String myApplication = '/myApplication';
  static List<GetPage> routes = [
   // GetPage(name: myApplication, page: () => MyApplicationScreen()),
  ];

  static String getMyApplicationRoute() => '$myApplication';
}


