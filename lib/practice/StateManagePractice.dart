import 'package:flutter/material.dart';

class StateManagePractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }

}

class _ParentWidgetState extends State<StateManagePractice> {

  bool _activity = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _activity = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxWidget(
        active: _activity,
        onChange: _handleTapboxChanged,
      ),
    );
  }

}

class TapboxWidget extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChange;


  const TapboxWidget({Key key, this.active,@required this.onChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapboxState();
  }

}

class _TapboxState extends State<TapboxWidget> {

  bool _hightLight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _hightLight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _hightLight = false;
    });
  }

  void _handleTapCancle() {
    setState(() {
      _hightLight = false;
    });
  }

  void handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancle,
      onTap: handleTap,
      child: new Container(
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _hightLight ? new Border.all(color: Colors.teal[700], width: 10) : null,
        ),
        child: new Center(
          child: new Text(widget.active ? 'active_233' : 'inactive_233', style: new TextStyle(fontSize: 32, color: Colors.white),),
        ),
      ),
    );
  }

}