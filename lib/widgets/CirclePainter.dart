import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/helper/getColors.dart';

class CirclePainter extends CustomPainter {
  double leftPercent;
  CirclePainter({this.leftPercent});
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint bgPaint = Paint()
      ..color = Colors.grey[300]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    Paint completePaint = Paint()
      ..color = getColor(leftPercent)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width > size.height ? size.height / 2 : size.width / 2;
    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi * leftPercent, false, completePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
