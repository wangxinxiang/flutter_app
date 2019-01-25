import 'package:flutter/material.dart';

class InheritedWidgetTextRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetTextRouteState();
  }

}

class _InheritedWidgetTextRouteState extends State<InheritedWidgetTextRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(bottom: 2),
              child: _TestWidget(),
            ),
            RaisedButton(
              child: Text('23333'),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                })
          ],
        ),
      ),
    );
  }

}

///数据共享
class ShareDataWidget extends InheritedWidget {

  int data;//需要在子树中共享的数据，保存点击次数

  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回false，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }

}

///子Widget
class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }

}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }

}