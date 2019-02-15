import 'package:flutter/material.dart';
import 'dart:math';

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('围棋'),),
      body: Center(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(300, 300),
              painter: Chessboard(),
            ),
            CustomPaint(
              size: Size(300, 300),
              painter: MyPainter(),
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 19;
    double eHeight = size.height / 19;

    //黑子
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawCircle(Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2), min(eWidth / 2, eHeight / 2), paint);

    paint.color = Colors.white;

    canvas.drawCircle(Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2), min(eWidth / 2, eHeight / 2), paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///棋盘
class Chessboard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 19;
    double eHeight = size.height / 19;

    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175); //背景为纸黄色

    canvas.drawRect(Offset.zero & size, paint); //TODO 没懂

    for (int i = 0; i < 19; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i < 19; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
