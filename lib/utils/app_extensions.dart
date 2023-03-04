import 'package:flutter_app_api_integration/utils/app_config.dart';
import 'package:flutter_app_api_integration/utils/utility.dart';
import 'package:flutter_app_api_integration/utils/globalvar.dart' as globals;
import 'package:flutter_easyloading/flutter_easyloading.dart';

appLog(dynamic message) {
  return AppConfig.logging(message.toString());
}

void showLoading() {
  globals.isBackButtonActivated = false;
  EasyLoading.show(
    status: Utility.getKeyTranslator('Silahkan tunggu ...|Please wait ...'),
    maskType: EasyLoadingMaskType.black,
  );
}

void hideLoading() {
  globals.isBackButtonActivated = true;
  EasyLoading.dismiss();
}

void showComingSoon() {
  globals.isBackButtonActivated = true;
  EasyLoading.showInfo(
    Utility.getKeyTranslator(
        'Masih menunggu desain mockup :)|Still waiting design mockup :)'),
    duration: const Duration(seconds: 1),
  );
}
