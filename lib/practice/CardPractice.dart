import 'package:flutter/material.dart';

class CardPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCardPract();
  }

}

class _MyCardPract extends State<CardPractice> {
  @override
  Widget build(BuildContext context) {
    var card = new SizedBox(
      height: 210,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('后天应该回了', style: new TextStyle(fontWeight: FontWeight.w500),),
              subtitle: new Text('@王辛翔 湖南菜吃吗，四季花城',),
              leading: new Icon(Icons.restaurant_menu, color: Colors.blue[500],),
            ),
            new Divider(),
            new ListTile(
              title: new Text('1829763156', style: new TextStyle(fontWeight: FontWeight.w500),),
              leading: new Icon(Icons.contact_phone, color: Colors.blue[500],),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
    return new Center(child: card,);
  }

}