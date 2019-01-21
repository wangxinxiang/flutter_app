import 'package:flutter/material.dart';

///Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景
class FlowPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlowPracticeState();
  }

}

class _FlowPracticeState extends State<FlowPractice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWrap(),
    );
  }

  ///我们一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。
  Widget _buildWrap() {
    return Wrap(
      spacing: 8, // 主轴(水平)方向间距
      runSpacing: 4,  // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center,  //沿主轴方向居中
      children: <Widget>[
        new Chip(label: new Text('233333333333333333333'), avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A'),),),
        new Chip(label: new Text('233333333'), avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('B'),),),
        new Chip(label: new Text('23333333333333'), avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('C'),),),
        new Chip(label: new Text('2333'), avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('D'),),),
      ],
    );
  }

  Widget _buildFlow() {
    return Flow(
      delegate: TextDelegate(EdgeInsets.all(10)),
      children: <Widget>[
        new Container(width: 150.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
  }

}

class TextDelegate extends FlowDelegate {

  EdgeInsets margin = EdgeInsets.zero;

  TextDelegate(this.margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for(int i = 0;i < context.childCount;i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.bottom + margin.top;
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }

}