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
            height: 100,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
