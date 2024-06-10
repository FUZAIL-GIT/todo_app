// ignore_for_file: prefer_constructors_over_static_methods
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_app/core/extensions/sizedbox_extension.dart';
import 'package:todo_app/core/utils/toaster/toaster.dart';

class LoadingConfig {
  LoadingConfig._();

  static LoadingConfig? _instance;
  static LoadingConfig get instance {
    if (_instance == null) {
      _configLoading();
    }
    _instance ??= LoadingConfig._();

    return _instance!;
  }

  static void _configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      // ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..indicatorWidget = IntrinsicWidth(
        child: Column(
          children: [
            const SpinKitDualRing(
              color: Color(0xff00C443),
              size: 35,
              lineWidth: 5,
            ),
            10.height,
            const Text(
              'Please wait...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      )
      ..loadingStyle = EasyLoadingStyle.dark
// set the message to show when loading
      ..textColor = Colors.white
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..contentPadding = const EdgeInsets.all(30)
      ..backgroundColor = Colors.black
      ..maskColor = Colors.transparent
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  void showLoading() {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear, dismissOnTap: false);
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }

  Future<void> showLoadingUntil({
    required Future<void> Function() future,
    void Function(Object errorMessage, StackTrace stackTrace)? onError,
  }) async {
    showLoading();
    try {
      await future();
    } catch (e, s) {
      if (onError == null) {
        AppUtils.showToast(toastType: ToastType.error, message: e.toString());
      }
      onError?.call(e, s);
    }
    hideLoading();
  }
}
