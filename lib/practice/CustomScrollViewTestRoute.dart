import 'package:flutter/material.dart';

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('2333'),
              background: Image.asset('images/png2.png', fit: BoxFit.cover,),
            ),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: new SliverGrid(
                delegate: new SliverChildBuilderDelegate((BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.blue[100 * (index % 9)],
                    child: new Text('gird item $index'),
                  );
                },
                  childCount: 20,
                ),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4
                ),
            ),
          ),

          SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate((context, index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.purple[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              }),
              itemExtent: 50
          ),
        ],
      ),
    );
  }
}