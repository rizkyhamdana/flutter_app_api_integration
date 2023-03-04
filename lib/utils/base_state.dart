import 'package:flutter/material.dart';
import 'package:flutter_app_api_integration/utils/base_view.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with RouteAware
    implements BaseView {
  void navigationTo(String route, Object? arguments) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }

  void navigationReplaceTo(String route, Object? arguments) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  void navigationToAndDeleteFromBeginning(String route, Object? arguments) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      arguments: arguments,
      (Route route) => false,
    );
  }

  double widthLayer() {
    return MediaQuery.of(context).size.width;
  }

  double heightLayer() {
    return MediaQuery.of(context).size.height;
  }

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  showModalBottomSheets(Widget bodyModal) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return bodyModal;
        });
  }
}

abstract class BaseStateTransaction<T extends StatefulWidget>
    extends BaseState {}
