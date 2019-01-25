import 'package:flutter/material.dart';

class WillPopScopePractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WillPopScopePractice();
  }

}

class _WillPopScopePractice extends State<WillPopScopePractice> {

  DateTime _lassPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text('1秒内连续按两次返回键退出'),
        ),
        onWillPop: () async {
          if (_lassPressTime == null || DateTime.now().difference(_lassPressTime) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lassPressTime = DateTime.now();
            return false;
          }
          return true;
        },
    );
  }

}