// import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime now;

  ClockPainter(this.now);

  @override
  void paint(Canvas canvas, Size size) {
    const noOfclockTicks = 60;
    const clockTickPaintAngle = 2 * pi / noOfclockTicks;
    const clockTextAngle = 2 * pi / 12;
    final width = size.width;
    final height = size.height;
    final myTextSize = min(width * 0.05, height * 0.05);

    final radius = min(width, height) / 2;
    final centerOffset = Offset(width / 2, height / 2);
    final secondhandsCircleRadius = radius * 0.05;
    final minuteshandCircleRadius = radius * 0.1;

    final hoursTickLength = radius * 0.1;
    final minutesTickLength = radius * 0.07;
    final hourssTickStrokeWidth = radius * 0.04;
    final hoursHandStrokeWidth = radius * 0.06;
    final minutesHandStrokeWidth = radius * 0.03;
    final minutesTickStrokeWidth = radius * 0.005;

    final clockPaint = Paint()..color = Colors.blue;
    final hoursTickPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = hourssTickStrokeWidth
      ..strokeCap = StrokeCap.round;
    final minutesTickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = minutesTickStrokeWidth;
    final secondsHandPaint = Paint()..color = Colors.red;
    final secondsHandCirclePaint = Paint()..color = Colors.red;
    final minutesHandCirclePaint = Paint()..color = Colors.black;
    final minutesHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = minutesHandStrokeWidth
      ..strokeCap = StrokeCap.round;
    final hoursHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = hoursHandStrokeWidth
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(-width * 0.012, 0);
    path.lineTo(width * 0.012, 0);
    path.lineTo(0, -radius + minutesTickLength);
    path.close();
    canvas.drawCircle(centerOffset, radius, clockPaint);
    canvas.translate(centerOffset.dx, centerOffset.dy);
    canvas.drawCircle(
        Offset.zero, minuteshandCircleRadius, minutesHandCirclePaint);

    canvas.save();
    for (int i = 0; i < noOfclockTicks; i++) {
      if (i % 5 == 0) {
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + hoursTickLength), hoursTickPaint);
      } else {
        canvas.drawLine(Offset(0, -radius),
            Offset(0, -radius + minutesTickLength), minutesTickPaint);
      }
      if (now.second == i) {
        canvas.drawCircle(
            Offset.zero, secondhandsCircleRadius, secondsHandCirclePaint);
        canvas.drawPath(path, secondsHandPaint);
      }
      if (now.minute == i) {
        canvas.drawLine(const Offset(0, 0),
            Offset(0, -radius + minutesTickLength), minutesHandPaint);
      }
      if (now.hour % 12 * 5 == i) {
        canvas.drawLine(
            const Offset(0, 0), Offset(0, -radius * 0.6), hoursHandPaint);
      }

      canvas.rotate(clockTickPaintAngle);
    }
    canvas.restore();

    canvas.save();
    for (int i = 12; i >= 1; i--) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: (i).toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: myTextSize,
              fontWeight: FontWeight.bold),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-radius * 0.03, -radius * 0.87));
      canvas.rotate(-clockTextAngle);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ClockPainter oldDelegate) => true;

  double degreeToRadian(double degree) {
    var value = pi * degree / 180;
    return value;
  }
}
