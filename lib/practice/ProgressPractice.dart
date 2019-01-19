import 'package:flutter/material.dart';

class ProgressPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProgressPracitceState();
  }
}

class _ProgressPracitceState extends State<ProgressPractice> {
  @override
  Widget build(BuildContext context) {
    return _buildCircularProgress();
  }

  Widget _buildLinearProgress() {
    return Column(
      children: <Widget>[
        //循环模式
        SizedBox(
          height: 2,

          ///默认高度是6像素
          child: LinearProgressIndicator(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            value: .2, //精确模式，进度20%
          ),
        ),
      ],
    );
  }

  Widget _buildCircularProgress() {
    return Column(
      children: <Widget>[
        SizedBox(
          ///默认的宽度和高度皆为36像素
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            ///固定的颜色
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),

            // TODO 动画相关
//            valueColor: ColorTween(begin : Colors.blue[200], end : Colors.deepPurpleAccent).animate(parent),  ///动画相关
          ),
        ),
        Theme(  ///通过主题来自定义颜色
            data: ThemeData(primarySwatch: Colors.pink),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                value: .5,
                strokeWidth: 2,
              ),
            ))
      ],
    );
  }
}
