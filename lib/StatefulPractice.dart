import 'package:flutter/material.dart';

class StatefulDemo extends StatefulWidget {
  final String text;

  const StatefulDemo({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DemoStateWidgetState(text);
  }
}

class _DemoStateWidgetState extends State<StatefulDemo> {
  String text;

  _DemoStateWidgetState(this.text);

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "改变了值";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildExample(context);
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

  ///Column和Expanded
  Widget _buildColumn() {
    return Column(
      ///竖直居中
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      ///横向居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Expanded(
          child: new Text(
            "2333",
            textAlign: TextAlign.center,
          ),
          flex: 2,
        ),
        new Expanded(
          child: new Text("哗啦啦啦"),
        ),
      ],
    );
  }

  ///Container
  Widget _buildContainer() {
    return Container(
      child: Text(text ?? "这就是有状态DMEO"),
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white30,
          border: new Border.all(color: Color(0xFF6666ff), width: 0.3)),
    );
  }
}
