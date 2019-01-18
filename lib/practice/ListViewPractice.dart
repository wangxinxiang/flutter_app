import 'package:flutter/material.dart';

class ListViewPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListViewPractice();
  }

}

class _MyListViewPractice extends State<ListViewPractice> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = _getList(10);
    return new Scaffold(
      body: new Center(
        child: new ListView(children: list,),
      ),
    );
  }
}

List<Widget> _getList(int count) {
  return new List.generate(count, (int index) {
    return new ListTile(
      title: new Text('${index}Build beautiful native apps in record time', style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
      subtitle: new Text('${index}85 W Portal Ave'),
      leading: new Icon(Icons.theaters, color: Colors.blue,),
    );
  });
}