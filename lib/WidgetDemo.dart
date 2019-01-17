import 'package:flutter/material.dart';

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        title: new Text("2333333"),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return _buildExample(context);
        },
        itemCount: 20,
      ),
    );
  }

  Widget _buildExample(BuildContext context) {
    return new Container(
      ///卡片
      child: new Card(
        child: new FlatButton(
            onPressed: () {
              print("点击了！");
            },
            child: new Padding(
              padding:
              new EdgeInsets.only(left: 0, top: 10, right: 10, bottom: 10),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "描述叔叔叔叔叔叔",
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6, bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                  new Padding(padding: EdgeInsets.all(10)),

                  ///三个平分的横向图标文字
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "233"),
                      _getBottomItem(Icons.link, "2333"),
                      _getBottomItem(Icons.subject, "123456"),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  _getBottomItem(IconData icon, String text) {
    ///充满Row的横向布局
    return new Expanded(
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                icon,
                size: 16.0,
                color: Colors.grey,
              ),

              ///间隔
              new Padding(padding: new EdgeInsets.only(left: 5.0)),
              new Text(
                text,
                style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ));
  }

}