import 'package:flutter/material.dart';

class ScrollViewPractice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>
              children: str.split("").map((c) => Text(c, textScaleFactor: 2.0,)).toList(),  //每一个字母都用一个Text显示,字体为原来的两倍
            ),
          ),
        ),
    );
  }

}

class ListViewPractice extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    Widget divider1 = new Divider(color: Colors.blue,);
    Widget divider2 =new Divider(color: Colors.deepPurpleAccent,);

    return Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'),);
          },
          separatorBuilder: (BuildContext context, int index) {
            return index%2 == 0 ? divider1 : divider2;
          },
          itemCount: 100
      ),
    );
  }

}
