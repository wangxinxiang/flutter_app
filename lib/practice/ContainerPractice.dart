import 'package:flutter/material.dart';

///它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。
class ContainerPractice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildContainer(),
      ),
    );
  }

  Widget _buildContainer() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 120),  //容器外补白
      constraints: BoxConstraints.tightFor(width: 200, height: 150),  //卡片大小
      decoration: BoxDecoration(  //背景装饰
        gradient: RadialGradient( //背景径向渐变
            colors: [Colors.black, Colors.grey],
          center: Alignment.topLeft,
          radius: .98
        ),
        boxShadow: [  //卡片阴影
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2, 2),
            blurRadius: 4
          )
        ],
      ),
      transform: Matrix4.rotationZ(.2), //卡片倾斜变换
      alignment: Alignment.center,  //卡片内文字居中
      child: Text('5.2', style: TextStyle(color: Colors.white, fontSize: 40),), //卡片文字
    );
  }

}