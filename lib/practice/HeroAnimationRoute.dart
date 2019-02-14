import 'package:flutter/material.dart';

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Hero(tag: 'title', child: Text('233')),),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
              tag: "2333",
              child: ClipOval(
                child: Image.asset("images/pic8.jpg", width: 200,),
              )
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return FadeTransition(opacity: animation, child: Scaffold(
                    appBar: AppBar(title: Hero(tag: 'title', child: Text('233')),),
                    body: HeroAnimationRouteB(),
                  ),);
                }
            )
            );
          },
        ),
      ),
    );
  }

}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Hero(tag: '2333', child: Image.asset("images/pic8.jpg")),);
  }

}