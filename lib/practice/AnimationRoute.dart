import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimationRouteState();
  }

}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 3),
        vsync: this
    );
//    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)..addListener((){
//      setState(() {
//
//      });
//    });
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller); ///使用了AnimatedWidget，就不需要调用setState了
//      ..addListener((){
//      setState(() {
//
//      });
//    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
//    return Center(
//      child: GestureDetector(
//        onTap: () {
//          controller.reset();
//          controller.forward();
//        },
//        child: Image.asset("images/pic11.jpg", width: animation.value, height: animation.value,),
//      ),
//    );
    return AnimatedImage(animation: animation,);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

///要进行动画的对象封装起来使用
class AnimatedImage extends AnimatedWidget {

  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return GrowTransition(
      child: Image.asset("images/pic11.jpg"),
      animation: animation,
    );
  }

}

///缩放动画封装
class GrowTransition extends StatelessWidget {

  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
        child: child,
      ),
    );
  }

}