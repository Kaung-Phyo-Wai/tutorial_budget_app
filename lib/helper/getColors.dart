import 'package:flutter/material.dart';

Color getColor(leftPercent) {
  if (leftPercent < 0.25) {
    return Colors.red;
  } else if (leftPercent < 0.5) {
    return Colors.orange;
  } else {
    return Colors.green;
  }
}
