import 'package:flutter/material.dart';

class MyDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: new Text(
                        'title 23333',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  new Text(
                      "内容 23333",
                    style: new TextStyle(color: Colors.grey[500]),
                  ),
                ],
              )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );


    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color,),
          new Container(
            margin: EdgeInsets.only(top: 8),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Text(
          '将文本放入容器中，以便沿每条边添加32像素的填充。softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。',
        softWrap: true,
      ),
    );


    return new MaterialApp(
      title: 'demo',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Image.asset(
                'images/image_top.jpg',
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }


}
