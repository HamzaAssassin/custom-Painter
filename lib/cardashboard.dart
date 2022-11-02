import 'dart:math';

import 'package:flutter/material.dart';

class CarDashboardPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    const halfFactor = 2;
    final height = size.height;
    final width = size.width;
    final radius = min(width, height) / 3;
    final centerOffset = Offset(width / halfFactor, height / halfFactor);
    final tickCircleRadius = radius * 0.05;
    final tickInnerCircleRadius = tickCircleRadius * 0.4;
    final halfTickLength = radius * 0.08;
    final fullTickLength = radius * 0.14;
    final halfTickStrokeWidth = radius * 0.03;
    final fullTickStrokeWidth = radius * 0.04;
    final dashboardTickStrokeWidth = radius * 0.05;
    final dashboardCircleStrokeWidth = radius * 0.04;

    //  final tickOffset=Offset(dx, dy);

    final dashboardPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = dashboardCircleStrokeWidth;

    final dashboardTickBottomPaint = Paint()..color = Colors.white;
    final dashboardInnerCirclePaint = Paint()..color = Colors.blue;

    final greenBigPaint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = fullTickStrokeWidth;
    final orangeBigPaint = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = fullTickStrokeWidth;
    final redBigPaint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = fullTickStrokeWidth;

    final greenMiniPaint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..strokeWidth = halfTickStrokeWidth;
    final orangeMiniPaint = Paint()
      ..color = Colors.orange
      ..strokeCap = StrokeCap.round
      ..strokeWidth = halfTickStrokeWidth;
    final redMiniPaint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = halfTickStrokeWidth;

    final dashboardTickPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = dashboardTickStrokeWidth;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        angleToRad(170), angleToRad(200), false, dashboardPaint);

    canvas.translate(centerOffset.dx, centerOffset.dy);
    canvas.save();

    canvas.drawLine(
        Offset.zero, Offset(-radius * 0.7, radius * 0.1), dashboardTickPaint);

    canvas.rotate(3);

    canvas.restore();

    canvas.drawCircle(Offset.zero, tickCircleRadius, dashboardTickBottomPaint);
    canvas.drawCircle(
        Offset.zero, tickInnerCircleRadius, dashboardInnerCirclePaint);
    ///////end tick
    canvas.drawLine(Offset(radius, radius * 0.15),
        Offset(radius - fullTickLength, radius * 0.13), redBigPaint);
    TextSpan twoHundredT = TextSpan(
        text: '220',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter twoHTTextPainter = TextPainter(
        text: twoHundredT,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    twoHTTextPainter.layout();
    twoHTTextPainter.paint(
        canvas, Offset(radius + (radius * 0.1), radius * 0.1));
    ///////start tick
    canvas.drawLine(Offset(-radius, radius * 0.15),
        Offset(-radius + fullTickLength, radius * 0.13), greenBigPaint);
    TextSpan zero = TextSpan(
        text: '0',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter zeroTextPainter = TextPainter(
        text: zero,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    zeroTextPainter.layout();
    zeroTextPainter.paint(
        canvas, Offset(-radius - (radius * 0.18), radius * 0.1));
    ///////2nd mini tick
    canvas.drawLine(Offset(-radius, 0), Offset(-radius + halfTickLength, 0),
        greenMiniPaint);
    ///////3rd big tick
    canvas.drawLine(Offset(-radius, -radius * 0.15),
        Offset(-radius + fullTickLength, -radius * 0.14), greenBigPaint);
    TextSpan twenty = TextSpan(
        text: '20',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter twentyPainter = TextPainter(
        text: twenty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    twentyPainter.layout();
    twentyPainter.paint(
        canvas, Offset(-radius - (radius * 0.2), -radius * 0.2));
    ///////3rd last big tick
    canvas.drawLine(Offset(radius, -radius * 0.15),
        Offset(radius - fullTickLength, -radius * 0.14), redBigPaint);
    TextSpan twoHundred = TextSpan(
        text: '200',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter twoHTextPainter = TextPainter(
        text: twoHundred,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    twoHTextPainter.layout();
    twoHTextPainter.paint(
        canvas, Offset(radius + (radius * 0.08), -radius * 0.23));
    ///////2nd last mini tick
    canvas.drawLine(
        Offset(radius, 0), Offset(radius - halfTickLength, 0), redMiniPaint);

    ///////4rth mini tick
    canvas.drawLine(Offset(-radius * 0.95, -radius * 0.3),
        Offset(-radius * 0.88, -radius * 0.28), greenMiniPaint);
    ///////4rth last mini tick
    canvas.drawLine(Offset(radius * 0.95, -radius * 0.3),
        Offset(radius * 0.88, -radius * 0.28), redMiniPaint);

    ///////5th big tick
    canvas.drawLine(Offset(-radius * 0.91, -radius * 0.45),
        Offset(-radius * 0.79, -radius * 0.39), greenBigPaint);
    TextSpan sixty = TextSpan(
        text: '60',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter sixtyPainter = TextPainter(
        text: sixty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    sixtyPainter.layout();
    sixtyPainter.paint(
        canvas, Offset(-radius - (radius * 0.12), -radius * 0.55));
    ///////5th last big ticks
    canvas.drawLine(Offset(radius * 0.91, -radius * 0.45),
        Offset(radius * 0.79, -radius * 0.39), redBigPaint);

///////6th min tick
    canvas.drawLine(Offset(-radius * 0.81, -radius * 0.6),
        Offset(-radius * 0.75, -radius * 0.55), greenMiniPaint);
    ///////6th last min tick
    canvas.drawLine(Offset(radius * 0.81, -radius * 0.6),
        Offset(radius * 0.75, -radius * 0.55), redMiniPaint);

    ///////7th big tick
    canvas.drawLine(Offset(-radius * 0.7, -radius * 0.75),
        Offset(-radius * 0.62, -radius * 0.65), orangeBigPaint);
    TextSpan eighty = TextSpan(
        text: '80',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter eightyPainter = TextPainter(
        text: eighty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    eightyPainter.layout();
    eightyPainter.paint(
        canvas, Offset(-radius + (radius * 0.12), -radius * 0.87));
    ///////7th last big tick
    canvas.drawLine(Offset(radius * 0.7, -radius * 0.75),
        Offset(radius * 0.62, -radius * 0.65), orangeBigPaint);
    TextSpan oneEighty = TextSpan(
        text: '180',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter oneEightyPainter = TextPainter(
        text: oneEighty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    oneEightyPainter.layout();
    oneEightyPainter.paint(
        canvas, Offset(radius + (-radius * 0.05), -radius * 0.55));
    ///////8th min tick
    canvas.drawLine(Offset(-radius * 0.55, -radius * 0.85),
        Offset(-radius * 0.51, -radius * 0.78), orangeMiniPaint);
    ///////8th last min tick
    canvas.drawLine(Offset(radius * 0.55, -radius * 0.85),
        Offset(radius * 0.51, -radius * 0.78), orangeMiniPaint);
    TextSpan oneSixty = TextSpan(
        text: '160',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter oneSixtyPainter = TextPainter(
        text: oneSixty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    oneSixtyPainter.layout();
    oneSixtyPainter.paint(
        canvas, Offset(radius + (-radius * 0.3), -radius * 0.9));
///////9th big tick
    canvas.drawLine(Offset(-radius * 0.39, -radius * 0.94),
        Offset(-radius * 0.35, -radius * 0.81), orangeBigPaint);
    TextSpan hundred = TextSpan(
        text: '100',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter hundredPainter = TextPainter(
        text: hundred,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    hundredPainter.layout();
    hundredPainter.paint(
        canvas, Offset(-radius + (radius * 0.45), -radius - (radius * 0.12)));
    ///////9th last big tick
    canvas.drawLine(Offset(radius * 0.39, -radius * 0.94),
        Offset(radius * 0.35, -radius * 0.81), orangeBigPaint);

    TextSpan onefourty = TextSpan(
        text: '140',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter onefourtyPainter = TextPainter(
        text: onefourty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    onefourtyPainter.layout();
    onefourtyPainter.paint(
        canvas, Offset(radius + (-radius * 0.7), -radius - (radius * 0.11)));

    ///////10th min tick
    canvas.drawLine(Offset(-radius * 0.22, -radius * 0.98),
        Offset(-radius * 0.21, -radius + (radius * 0.1)), orangeMiniPaint);
    ///////10th last min tick
    canvas.drawLine(Offset(radius * 0.22, -radius * 0.98),
        Offset(radius * 0.21, -radius + (radius * 0.1)), orangeMiniPaint);
//////   last tick
    canvas.drawLine(Offset(0, -radius), Offset(0, -radius + fullTickLength),
        orangeBigPaint);
    TextSpan oneTwenty = TextSpan(
        text: '120',
        style: TextStyle(
            color: Colors.white,
            fontSize: radius * 0.1,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold));
    TextPainter oneTwentyPainter = TextPainter(
        text: oneTwenty,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    oneTwentyPainter.layout();
    oneTwentyPainter.paint(
        canvas, Offset(-radius + (radius * 0.9), -radius - (radius * 0.2)));

    ///speedo text
    TextSpan spanTitle = TextSpan(
        text: 'km/h',
        style: TextStyle(
            color: Colors.white38,
            fontSize: radius * .1,
            fontStyle: FontStyle.italic));
    TextPainter textPainterForTitle = TextPainter(
        text: spanTitle,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right);
    textPainterForTitle.layout();
    textPainterForTitle.paint(canvas, Offset(radius * 0.07, -radius * 0.5));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => true;

  double angleToRad(double angle) {
    return angle * pi / 180;
  }
}
