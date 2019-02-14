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
        child: new ListView(
          children: list,
        ),
      ),
    );
  }
}

List<Widget> _getList(int count) {
  return new List.generate(count, (int index) {
    return new ListTile(
      title: new Text(
        '${index}Build beautiful native apps in record time',
        style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: new Text('${index}85 W Portal Ave'),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue,
      ),
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

  ///回到顶部按钮
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  String _progress = "0%";

  ///保存进度百分比

  @override
  void initState() {
    _retrieveData();

    ///监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset > 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    ///为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动控制'),
      ),
      body: Column(
        children: <Widget>[
          ///添加固定表头
          ListTile(
            title: Text(
              '表头23333',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Divider(),
          Expanded(
            child: Scrollbar(
              child: NotificationListener<ScrollNotification>(
                ///滚动监听
                onNotification: (ScrollNotification notification) {
                  switch(notification.runtimeType) {
                    case ScrollStartNotification : print('开始滚动'); break;
                    case ScrollUpdateNotification: print("正在滚动"); break;
                    case ScrollEndNotification: print("滚动停止"); break;
                    case OverscrollNotification: print("滚动到边界"); break;
                  }

                  double progress = notification.metrics.pixels /
                      notification.metrics.maxScrollExtent;
                  setState(() {
                    _progress = "${(progress * 100).toInt()}";
                  });
                  print(
                      "BottomEdge: ${notification.metrics.extentAfter == 0}"); //是否到底部
                  //return true; //放开此行注释后，进度条将失效
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildListView(),
                    CircleAvatar(
                      radius: 30,
                      child: Text(_progress),
                      backgroundColor: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        controller: _controller,
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              //加载时显示loading
              _retrieveData();
              return Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "没有更多了!",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          //显示单词列表项
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: .0,
          );
        },
        itemCount: _words.length);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
