import 'package:flutter/material.dart';

class ListenerPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListenerPracticeState();
  }
}

class _ListenerPracticeState extends State<ListenerPractice> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildListener(),
      ),
    );
  }

  Widget _buildListener() {
    return Listener(
      behavior: HitTestBehavior.opaque,
      child: Container(
        constraints: BoxConstraints.tight(Size(300, 150)),
        alignment: Alignment.center,
        color: Colors.blueAccent,
        width: 300,
        height: 150,
        child: Text(
          _event?.toString() ?? "",
        ),
      ),
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          _event = event;
        });
      },
      onPointerMove: (PointerMoveEvent event) {
        setState(() {
          _event = event;
        });
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          _event = event;
        });
      },
    );
  }
}

class Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragState();
  }
}

class _DragState extends State<Drag> {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('233'),),
              onPanDown: (DragDownDetails detail) {
                print('手指按下(相对屏幕位置):${detail.globalPosition}');
              },
              onPanUpdate: (DragUpdateDetails detail) {
                setState(() {
                  _top += detail.delta.dy;
                  _left += detail.delta.dx;
                });
              },
              onPanEnd: (DragEndDetails detail) {
                print('结束滑动时的速度:${detail.velocity}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
