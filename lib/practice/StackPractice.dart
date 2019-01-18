import 'package:flutter/material.dart';

class StackPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStackPractice();
  }

}

class _MyStackPractice extends State<StackPractice> {

  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/pic6.jpg'),
          radius: 100,
        ),
        new Container(
          decoration: new BoxDecoration(color: Colors.black45),
          child: new Text('233', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ],
    );
    return new Container(
      alignment: Alignment.center,
      child: stack,
    );
  }

}