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
        Positioned(
          left: 18,
          child: Text('1111', style: TextStyle(color: Colors.white, fontSize: 20),),
        )
      ],
    );
    return new Container(
      alignment: Alignment.center,
      child: stack,
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          left: 18,
          child: Text('1111'),
        ),
        Container(
          color: Colors.red,
          child: Text('2222', style: TextStyle(color: Colors.white),),
        ),
        Positioned(
          top: 18,
          child: Text('3333'),
        ),
      ],
    );
  }

}