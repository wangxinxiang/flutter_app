import 'package:flutter/material.dart';

class GridViewPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyGridViewPractice();
  }

}


class _MyGridViewPractice extends State<GridViewPractice> {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Welcome to Flutter',
        color: Colors.grey,
        theme: new ThemeData(primaryColor: Colors.white),
        home: new Container(
          color: Colors.grey,
          margin: new EdgeInsets.only(top: 40),
          child: _buildGrid2(),
        )
    );
  }

}


List<Container> _buildGridTitleList(int count) {
  return new List.generate(count,
  (int index) => new Container(child: new Image.asset('images/pic${index + 1}.jpg'),));
}

Widget _buildGrid() {
  return new GridView.count(
    crossAxisCount: 2,
    padding: new EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    childAspectRatio: 1.5,  //宽高比为1时，子widget
    children: _buildGridTitleList(12),
  );
}

Widget _buildGrid2() {
  List<Container> list = _buildGridTitleList(12);

  return new GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  //每行三列
          childAspectRatio: 1   //显示区域宽高相等
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return list[index];
      });
}