// ignore_for_file: camel_case_extensions

import 'package:flutter/material.dart';

extension emptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}
