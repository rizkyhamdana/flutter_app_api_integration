import 'package:dio/dio.dart';
import 'package:flutter_app_api_integration/services/api_helper.dart';
import 'package:flutter_app_api_integration/services/locator.dart';
import 'package:flutter_app_api_integration/utils/constant.dart';
import 'package:flutter_app_api_integration/utils/utility.dart';

class ApiService {
  var apiHelper = locator<ApiHelper>();
  ApiService();

  Future<Response<dynamic>> connect(
      String path, Map<String, dynamic> data, String method,
      {String mpin = '', bool isOtp = false}) async {
    try {
      Response<dynamic> response;

      var requestPath = path;

      switch (method) {
        case Constant.GET:
          response = await apiHelper.get(requestPath, data);
          break;
        case Constant.POST:
          response = await apiHelper.post(requestPath, data);
          break;
        default:
          response = await apiHelper.post(requestPath, data);
      }

      return response;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    } catch (e) {
      throw Exception(Utility.handleErrorString(e.toString()));
    }
  }
}
