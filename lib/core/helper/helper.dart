import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHelper {
  static EdgeInsets get appPadding =>
      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h);
  static EdgeInsets get dialogPadding =>
      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h);

  static ShapeBorder get dialogShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      );
}
