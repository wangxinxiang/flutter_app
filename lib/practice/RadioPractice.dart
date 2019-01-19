import 'package:flutter/material.dart';


class RadioPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioPracticeState();
  }

}

class _RadioPracticeState extends State<RadioPractice> {
  bool _switchSelected = false;
  bool _checkSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('233'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(value: _switchSelected, onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          }),
          Checkbox(value: _checkSelected, onChanged: (value) {
            setState(() {
              _checkSelected = value;
            });
          })
        ],
      ),
    );
  }

}