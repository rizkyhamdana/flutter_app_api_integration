import 'dart:developer';

import 'package:flutter_app_api_integration/utils/constant.dart';

class AppConfig {
  static String developmentUrl = 'https://jsonplaceholder.typicode.com/todos/';

  static int connectTimeout = 180000;
  static int receiveTimeout = 180000;
  static void logging(String message) {
    log(message, name: Constant.appName);
  }
}
