import 'package:flutter/material.dart';

class FlexLayoutPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                color: Colors.lightGreen,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 300,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                      child: Text('233'),
                    )),
                Spacer(),
                Container(  ///不包含flex属性，则维持原版高度
                  color: Colors.blue,
                  child:  Center(
                      child:Text('233')
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
