import 'package:flutter_app_api_integration/services/api_helper.dart';
import 'package:flutter_app_api_integration/services/api_service.dart';
import 'package:flutter_app_api_integration/services/navigation_services.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => ApiHelper());
  // locator.registerLazySingleton(
  //   () => FirebaseAnalyticsObserver(analytics: locator<FirebaseAnalytics>()),
  // );
}
