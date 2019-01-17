import 'package:flutter/material.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState2();
  }

}

class _MyHomePageState extends State<MyHomePage2> {

  @override
  Widget build(BuildContext context) {

    var titleText = new Container(
      alignment: Alignment.center,
      child: new Text('title',
        style: new TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
        ),
      ),
    );

    var subTitle = new Container(
      alignment: Alignment.center,
      child: new Text('A container that is typically used with Scaffold.bottomNavigationBar, '
          'and can have a notch along the top that makes room for an overlapping FloatingActionButton',
        style: new TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );

    var ratings = new Container(
      padding: new EdgeInsets.all(20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
              new Icon(Icons.star, color: Colors.black,),
            ],
          ),
          new Text('2333 元',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          )
        ],
      ),
    );

    var iconList = DefaultTextStyle(
        style: new TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 18,
          height: 2,
        ),
        child: new Container(
          padding: new EdgeInsets.all(20),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Icon(Icons.kitchen, color: Colors.green[500]),
                  new Text('PREP:'),
                  new Text('25 min'),
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.timer, color: Colors.green[500]),
                  new Text('COOK:'),
                  new Text('1 hr'),
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.restaurant, color: Colors.green[500]),
                  new Text('FEEDS:'),
                  new Text('4-6'),
                ],
              ),
            ],
          ),
        ),);

    var leftColumn = new Container(
      padding: new EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    return leftColumn;
  }
}

class _MyHomePageState2 extends State<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('pic1.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('pic2.jpg'),
                ),
              ),
            ],
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('pic3.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/image_top.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return new MaterialApp(
        title: 'Welcome to Flutter',
        color: Colors.grey,
        theme: new ThemeData(primaryColor: Colors.white),
        home: new Container(
          color: Colors.grey,
          margin: new EdgeInsets.only(top: 40),
          child: container,
        )
    );
  }
}
