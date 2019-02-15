import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  final double turns;
  final int speed;
  final Widget child;

  TurnBox({Key key, this.turns = 0, this.speed = 200, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TurnBoxRouteState();
  }
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('233'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 150,
              ),
            ),
            RaisedButton(
                child: Text('顺时针旋转1/5圈'),
                onPressed: () {
                  setState(() {
                    _turns += .2;
                  });
                }),
            RaisedButton(
                child: Text('逆时针旋转1/5圈'),
                onPressed: () {
                  setState(() {
                    _turns -= .2;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
