import 'package:flutter/material.dart';

class NotificationRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _NotificationRouteState();
  }

}

class _NotificationRouteState extends State<NotificationRoute> {

  String _msg = "消息";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NotificationListener<MyNotification>(
            onNotification: (notification) {
              setState(() {
                _msg += notification.msg + "  ";
              });
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Builder(builder: (context) {
                    return RaisedButton(
                      onPressed: () => MyNotification("233").dispatch(context),
                      child: Text('发送消息'),
                    );
                  }),
                  Text(_msg),
                ],
              ),
            )
        ),
      ),
    );
  }

}

class MyNotification extends Notification {
  final String msg;
  MyNotification(this.msg);

}