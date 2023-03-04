import 'package:dio/dio.dart';
import 'package:flutter_app_api_integration/services/locator.dart';
import 'package:flutter_app_api_integration/services/navigation_services.dart';
import 'package:flutter_app_api_integration/utils/app_extensions.dart';
import 'package:flutter_app_api_integration/utils/constant.dart';
import 'package:pretty_json/pretty_json.dart';

class AppInterceptors extends InterceptorsWrapper {
  var navigatorKey = locator<NavigationService>();

  Response? tempResponse;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.contentType = Headers.formUrlEncodedContentType;

    appLog("uri == ${options.uri}");

    appLog('============= HEADER ============');
    options.headers.forEach((key, value) {
      appLog('$key == $value');
    });

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.data.toString().contains('errorCode')) {
      handler.reject(
        DioError(
            requestOptions: response.requestOptions,
            error: 'Error',
            type: DioErrorType.badResponse),
      );
      appLog('============= ERROR RESPONSE ============\n'
          "ENDPOINT : ${response.requestOptions.path}\n"
          "REQUEST : ${response.requestOptions.data is FormData ? '' : prettyJson(response.requestOptions.data)}\n"
          "RESPONSE : ${response.data is ResponseBody ? prettyJson(response.data) : prettyJson(response.data)}\n"
          "===============================================");
    } else {
      appLog('============= SUCCESS ============\n'
          "ENDPOINT : ${response.requestOptions.path}\n"
          "REQUEST : ${response.requestOptions.data is FormData ? '' : prettyJson(response.requestOptions.data)}\n"
          "RESPONSE : ${response.data is ResponseBody ? prettyJson(response.data) : prettyJson(response.data)}\n"
          "===============================================");
    }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.message!.contains(Constant.R_TIMEOUT)) {
      throw DioErrorType.connectionTimeout;
    } else if (err.message!.contains(Constant.R_REFUSED)) {
      throw DioErrorType.cancel;
    } else if (err.message!.contains(Constant.R_FAILED)) {
      throw DioErrorType.connectionTimeout;
    } else if (err.message!.contains(Constant.R_SOCKET_EXC)) {
      throw DioErrorType.connectionError;
    } else if (err.message!.contains(Constant.R_EXCEPT)) {
      throw DioErrorType.badCertificate;
    }
    appLog('============= ERROR ============\n'
        "ENDPOINT : ${err.requestOptions.path}\n"
        "REQUEST : ${err.requestOptions.data is FormData ? '' : prettyJson(err.requestOptions.data)}\n"
        "ERROR : ${err.error}"
        "ERROR TYPE : ${err.type}\n"
        "RESPONSE error :\n ${err.message}\n"
        "===============================================");

    if (tempResponse != null &&
        !err.message!.contains(Constant.R_TIMEOUT) &&
        !err.message!.contains(Constant.R_SOCKET_EXC)) {
      try {
        var defaultcountryCode = "en";
        var countryCode = "id";

        String responseCode = tempResponse!.data["code"] as String;

        if (countryCode == defaultcountryCode) {
          if (Constant.englishResponseCode[responseCode] != null) {
            throw DioErrorType.badCertificate;
          }
        } else {
          if (Constant.indoResponseCode[responseCode] != null) {
            throw DioErrorType.badCertificate;
          }
        }
      } catch (e) {
        rethrow;
      }
    }
    handler.reject(DioError(
        requestOptions: err.requestOptions,
        error: err,
        type: DioErrorType.receiveTimeout));
  }
}
