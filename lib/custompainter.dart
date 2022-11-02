import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const halfFactor = 2;
    const eyesRadiusFactor = 0.23;
    const eyesOffsetFactor = 0.4;
    const leftEyebrowheightFactor = 0.45;
    const eyeBallradiusFactor = 0.4;
    const eyeInnerBallradiusFactor = 0.3;
    const eyeWidthFactor = 0.2;
    const eyeHeightFactor = 0.06;
    const mouthOffsetFactor = 0.25;
    
    const mouthRadiusFactor = 0.3;

    final width = size.width;
    final height = size.height;
    final eyeWidth = width * eyeWidthFactor;
    final eyeHeight = height * eyeHeightFactor;

    final radius = min(width, height) / halfFactor;
    final eyeRadius = radius * eyesRadiusFactor;
    final eyeBallRadius = eyeRadius * eyeBallradiusFactor;
    final eyeInnerBallRadius = eyeBallRadius * eyeInnerBallradiusFactor;
    final mouthRadius = radius * mouthRadiusFactor;

    final centerOffset = Offset(width / halfFactor, height / halfFactor);
    final leftEyeOffset = Offset(centerOffset.dx - (radius * eyesOffsetFactor),
        centerOffset.dy - (radius * eyesOffsetFactor));
    final leftEyebrowOffset = Offset(
        centerOffset.dx - (radius * eyesOffsetFactor),
        centerOffset.dy - (radius * leftEyebrowheightFactor));
    final rightEyeOffset = Offset(centerOffset.dx + (radius * eyesOffsetFactor),
        centerOffset.dy - (radius * eyesOffsetFactor));
    final rightEyebrowOffset = Offset(
        centerOffset.dx + (radius * eyesOffsetFactor),
        centerOffset.dy - (radius * leftEyebrowheightFactor));
    final mouthOffset =
        Offset(centerOffset.dx, centerOffset.dy + (radius * mouthOffsetFactor));

    final facePaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    final eyesPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final eyesBallPaint = Paint()
      ..color = Colors.brown.shade600
      ..style = PaintingStyle.fill;
    final eyesInnerBallPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final eyeBrowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    final mouthPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final teethPaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;
       final tonguePaint = Paint()
      ..color = Colors.pink.shade400
      ..style = PaintingStyle.fill;

    canvas.drawCircle(centerOffset, radius, facePaint);
    canvas.drawOval(
        Rect.fromCenter(
            center: leftEyeOffset, width: eyeWidth, height: eyeHeight),
        eyesPaint);
    //      canvas.drawOval(Rect.fromCircle(center: leftEyeOffset, radius: radius), eyesPaint);
    canvas.drawCircle(leftEyeOffset, eyeBallRadius, eyesBallPaint);
    canvas.drawCircle(leftEyeOffset, eyeInnerBallRadius, eyesInnerBallPaint);
    canvas.drawArc(
        Rect.fromCircle(center: leftEyebrowOffset, radius: eyeRadius),
        degreeToRadian(200),
        degreeToRadian(140),
        false,
        eyeBrowPaint);

    canvas.drawOval(
        Rect.fromCenter(
            center: rightEyeOffset, width: eyeWidth, height: eyeHeight),
        eyesPaint);
    canvas.drawCircle(rightEyeOffset, eyeBallRadius, eyesBallPaint);
    canvas.drawCircle(rightEyeOffset, eyeInnerBallRadius, eyesInnerBallPaint);
    canvas.drawArc(
        Rect.fromCircle(center: rightEyebrowOffset, radius: eyeRadius),
        degreeToRadian(200),
        degreeToRadian(140),
        false,
        eyeBrowPaint);
    canvas.drawArc(Rect.fromCircle(center: mouthOffset, radius: mouthRadius),
        degreeToRadian(0), degreeToRadian(180), false, mouthPaint);
    canvas.drawArc(Rect.fromCircle(center: mouthOffset, radius: mouthRadius),
        degreeToRadian(20), degreeToRadian(140), false, teethPaint);
        canvas.drawArc(Rect.fromCircle(center: mouthOffset, radius: mouthRadius),
        degreeToRadian(50), degreeToRadian(80), false, tonguePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double degreeToRadian(double degree) {
    var value = pi * degree / 180;
    return value;
  }
}


 // final radius = min(width, height) / 2;
    // final centerOffset = Offset(width / 2, height / 2);
    // final customPaint = Paint()
    //   ..color = Colors.blue.shade200
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 10
    //   ..strokeJoin = StrokeJoin.round
    //   ..shader =  LinearGradient(
    //           colors: [Colors.blueGrey, Colors.blue.shade300, Colors.blue.shade500],
    //           stops:const [0.33, 0.66, 1])
    //       .createShader(Rect.fromLTWH(0, 0, width, height));
    // canvas.drawCircle(centerOffset, radius, customPaint);
    // // canvas.drawCircle(centerOffset, radius/2, customPaint);
    // canvas.drawCircle(centerOffset, radius / 4, customPaint);
    // canvas.drawCircle(centerOffset, radius / 8, customPaint);
    // canvas.drawRect(
    //     Rect.fromCircle(center: centerOffset, radius: radius / 2), customPaint);
    // canvas.drawLine(centerOffset, Offset.zero, customPaint);