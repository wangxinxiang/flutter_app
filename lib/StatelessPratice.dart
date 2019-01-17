import 'package:flutter/material.dart';
import 'WidgetDemo.dart';

class DemoWidget extends StatelessWidget {

  final String text;

  const DemoWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: WidgetDemo());
//    return Container(
//      color: Colors.lightBlue,
//      child: Text(text ?? "无状态的Demo"),
//      alignment: Alignment.center,
//    );
  }

}