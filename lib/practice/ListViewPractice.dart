import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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


class InfiniteListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteLIstViewState();
  }

}

class _InfiniteLIstViewState extends State<InfiniteListView> {

  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('标题栏'),),
      body: Column(
        children: <Widget>[

          ///添加固定表头
          ListTile(
            title: Text('表头23333', style: TextStyle(color: Colors.red),),),
          Divider(),
          Expanded(
            child: _buildListView(),)
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) { //加载时显示loading
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text("没有更多了!", style: TextStyle(color: Colors.grey),),
              );
            }
          }
          //显示单词列表项
          return ListTile(title: Text(_words[index]),);
        },
        separatorBuilder: (context, index) {
          return Divider(height: .0,);
        },
        itemCount: _words.length);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表

      });
    });
  }
}