import 'package:flutter/material.dart';

extension GapExtension on int {
  SizedBox height() {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox width() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
