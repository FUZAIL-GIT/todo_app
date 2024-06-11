import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:todo_app/app.dart';

class AppUtils {
  static ToastFuture showToast({
    required String message,
    ToastType toastType = ToastType.log,
    Duration duration = const Duration(seconds: 4),
  }) {
    return showToastWidget(
      Container(
        // width: util.deviceSize.width * 0.3,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
                // color: context.colorScheme.onBackground.withOpacity(0.2),
                ),
          ),
          color: _getColorByToastType(toastType),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                ToastManager().dismissAll(showAnim: true);
              },
              icon: Icon(
                _getIconDataByToastType(toastType),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      context: navigatorKey.currentContext,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      axis: Axis.vertical,
      duration: duration,
      alignment: Alignment.centerRight,
    );
  }

  static IconData _getIconDataByToastType(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return Icons.done_rounded;
      case ToastType.error:
        return Icons.error_rounded;
      case ToastType.warning:
        return Icons.warning_rounded;
      case ToastType.info:
        return Icons.info_rounded;
      case ToastType.log:
        return Icons.info_rounded;
    }
  }

  static Color _getColorByToastType(ToastType toastType) {
    switch (toastType) {
      case ToastType.success:
        return Colors.green;
      case ToastType.error:
        return Colors.red;
      case ToastType.warning:
        return Colors.orange;
      case ToastType.info:
        return Colors.blue;
      case ToastType.log:
        return Colors.grey;
    }
  }
}

enum ToastType {
  success,
  error,
  warning,
  info,
  log,
}
