import 'package:flutter/material.dart';
import 'dart:math' as math;

///Transform变换只影响绘制阶段，不影响layout。RotatedBox影响layout阶段
class TransformPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildRotateBox(),
      ),
    );
  }

  //Transform变换
  Widget _buildTransfrom() {
    return Container(
      color: Colors.black,
      child: Transform(
        transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.deepOrange,
          child: const Text('23333333333333'),
        ),
      ),
    );
  }

  //平移
  Widget _buildTranslate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.translate(
        offset: Offset(-20, -5),
        child: Text('233333333333333333'),
      ),
    );
  }

  Widget _buildRotate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(angle: math.pi/2, child: Text('233333'),),
    );
  }

  Widget _buildScale() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.scale(scale: 2, child: Text('233333'),),
    );
  }

  Widget _buildRotateBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(quarterTurns: 1, child: Text('233333'),),
        ),
        Text('233333333333', style: TextStyle(color: Colors.green, fontSize: 18),)
      ],
    );
  }

}
