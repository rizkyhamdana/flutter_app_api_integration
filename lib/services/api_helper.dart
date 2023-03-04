import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_app_api_integration/services/app_interceptor.dart';
import 'package:flutter_app_api_integration/utils/app_config.dart';

class ApiHelper {
  Dio dio = Dio();

  ApiHelper() {
    //Base url
    dio = Dio();
    dio.options.baseUrl = AppConfig.developmentUrl;
    dio.options.headers = {
      "X-RapidAPI-Key": "977c0e1e4emsh759e27ce699bffep1d9fc6jsn0c17af974300",
      "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "useQueryString": true
    };
    dio.options.connectTimeout =
        Duration(milliseconds: AppConfig.connectTimeout);
    dio.options.receiveTimeout =
        Duration(milliseconds: AppConfig.connectTimeout);
    dio.options.responseType = ResponseType.json;

    dio.interceptors.add(AppInterceptors());

    // ByPass SSL Certificate
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // With SSL Certificate
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   SecurityContext sc = new SecurityContext();
    //   sc.setTrustedCertificatesBytes(raw.data);
    //   HttpClient httpClient = new HttpClient(context: sc);
    //   return httpClient;
    // };
  }

  Future<Response<T>> post<T>(String url, Map<String, dynamic> data) {
    return dio.post(
      url,
      data: data,
    );
  }

  Future<Response<T>> get<T>(String url, Map<String, dynamic> data) {
    return dio.get(
      url,
      queryParameters: data,
    );
  }
}
