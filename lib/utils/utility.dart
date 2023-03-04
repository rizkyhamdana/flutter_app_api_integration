import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_api_integration/utils/constant.dart';
import 'package:intl/intl.dart';

class Utility {
  static String getLanguage() {
    var lang = Constant.ID;
    return lang.toString();
  }

  static String getValueTranslator(String inValue, enValue) {
    return getLanguage() == Constant.EN ? enValue : inValue;
  }

  static String getInitial(text, limit) {
    try {
      String runeString({String? value}) {
        return String.fromCharCodes(value!.runes.toList());
      }

      var newText = text == null ? '?' : runeString(value: text);
      newText = newText.toUpperCase();

      if (text.length == 0) {
        newText = " ";
      }

      var arrayLetters = newText.trim().split(' ');
      if (arrayLetters.length > 1) {
        String value = '';
        int sumLimit =
            (limit <= arrayLetters.length) ? limit : arrayLetters.length;
        for (int i = 0; i < sumLimit; i++) {
          try {
            value += arrayLetters[i][0].trim();
          } catch (e) {
            debugPrint('Error: $e');
          }
        }
        return value;
      }
      return newText[0].toUpperCase();
    } catch (e) {
      return '';
    }
  }

  static String toNumberPoint(double amount) {
    String result = '';
    final currencyFormatter = NumberFormat('#,###', 'ID');
    result = currencyFormatter.format(amount);

    return 'Rp $result';
  }

  static String formatDate(DateTime date) {
    return DateFormat("dd-MM-yyyy").format(date);
  }

  static String formatDateSlash(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String getKeyTranslator(String key) {
    if (key.contains('|')) {
      var data = key.split('|');
      var keyIn = data[0];
      var keyEn = data[1] == '' ? keyIn : data[1];
      return getLanguage() == Constant.EN ? keyEn : keyIn;
    }
    return key;
  }

  static String checkResult(Map<String, dynamic> response) {
    var result = '';
    if (!response.containsKey('trxFlag')) {
      String code = response['code'] as String;
      String message = response['message'] as String;
      if (code == Constant.R_TIMEOUT) {
        result = '$code-$message';
      } else if (code != Constant.R_SUCCESS) {
        if (code == Constant.R_CONTINUE_OOB_STEP ||
                code == Constant.R_DTTOT ||
                code == Constant.R_DTTOT
            // ||   code == Constant.R_NIK_SUDAH_TERDAFTAR
            ) {
          result = '';
        } else {
          result = '$message ($code)';
        }
      }
    } else {
      String flag = response['trxFlag'] as String;
      String message = response['message'] as String;
      if (flag == Constant.FLAG_3) {
        result = message;
      }
    }

    return result;
  }

  static String handleErrorString(String error) {
    if (error.contains(Constant.R_TIMEOUT)) {
      return getValueTranslator("Session kadaluarsa", "Session expired");
    } else if (error.contains(Constant.R_IMAGENOTSUPPORT)) {
      return getValueTranslator(
          "Format gambar tidak didukung", "Image format not supported");
    } else if (error.contains(Constant.R_CONNECTING_TIME_OUT)) {
      return getValueTranslator(
          "Gagal terhubung, Periksa koneksi internet anda",
          "Connection failed,Please check your internet connection");
    } else if (error.contains(Constant.R_SERVICE_UNAVAILABLE)) {
      return getValueTranslator(
          "Layanan tidak tersedia", "Service Unavailable");
    } else if (error.contains(Constant.R_OTHER_TYPE)) {
      return getValueTranslator(
          "Terjadi kesalahan pada server", "An error occurred on the server");
    } else if (error.contains(Constant.R_SOCKET_EXC)) {
      return getValueTranslator(
          "Gagal terhubung, Periksa koneksi internet anda",
          "Connection failed,Please check your internet connection");
    } else if (error.contains(Constant.R_RESPONSE)) {
      var message = error.substring(10, error.length);
      message = message.substring(message.indexOf(':') + 1, message.length);
      var definedMessage = [];

      Constant.englishResponseCode.forEach((k, v) {
        definedMessage.add(v);
      });

      Constant.indoResponseCode.forEach((k, v) {
        definedMessage.add(v);
      });

      if (message.toLowerCase().contains('exception')) {
        return message.substring(10, message.length);
      }

      return getKeyTranslator(message);
    } else if (error.contains(Constant.R_EXCEPT)) {
      return error.substring(10, error.length);
    } else {
      return getValueTranslator("Terjadi kesalahan pada mobile banking",
          "An error occurred in mobile banking");
    }
  }

  static String handleError(DioError error) {
    String errorDescription = "";

    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = getValueTranslator(
            "Koneksi gagal, periksa kembali internet anda",
            "Connection failed, please check your network");
        break;
      case DioErrorType.connectionTimeout:
        errorDescription = "Koneksi timeout dengan server";
        break;
      case DioErrorType.unknown:
        errorDescription = getValueTranslator(
            "Terjadi kesalahan pada servers", "Terjadi kesalahan pada servers");
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = getValueTranslator(
            "Koneksi timeout saat menerima data dari server",
            "Connection timeout when receive data from server");
        break;
      case DioErrorType.badResponse:
        errorDescription = getValueTranslator(
            "Koneksi timeout saat menerima data dari server",
            "Connection timeout when receive data from server");
        break;
      case DioErrorType.sendTimeout:
        errorDescription = getValueTranslator(
            "Koneksi timeout saat mengirim ke server",
            "Connection timeout when send data to server");
        break;
      default:
        errorDescription = "Unexpected error occured";
        break;
    }

    return errorDescription;
  }
}
