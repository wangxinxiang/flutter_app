import 'package:flutter/material.dart';
import 'package:flutter_app/practice/StaggerAnimationDemo.dart';
import 'package:flutter_app/widget/CustonPaint.dart';
import 'package:flutter_app/demo/PictureView.dart';

import 'MyFirstHomePage.dart';

void main() {

  void collectLog(String line){
    //收集日志
  }
  void reportErrorAndLog(FlutterErrorDetails details){
    //上报错误和日志逻辑
  }

  FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
    // 构建错误信息
  }

  FlutterError.onError = (FlutterErrorDetails detail) {
    reportErrorAndLog(detail);
  };

  runApp(new MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return CustomScrollViewTestRoute();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new CustomPaintRoute(),
    );
  }
}

