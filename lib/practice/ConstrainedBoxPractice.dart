import 'package:flutter/material.dart';

class ConstrainedBoxPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: _buildConstr(),
      ),
    );
  }

  Widget _buildConstr() {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return ConstrainedBox(  ///与BoxDecoration配合使用
      constraints: BoxConstraints(minWidth: 70, maxHeight: 200),
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            ///等同于BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
            /// SizedBox(
            //  width: 80.0,
            //  height: 80.0,
            //  child: redBox
            //)
            constraints: BoxConstraints.tightFor(width: 80, height: 80),
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 60, minHeight: 80),
              child: redBox,
            ),
          ),
          Padding(padding: const EdgeInsets.all(20)),
          ///“去除”了父ConstrainedBox的限制，则最终会按照子ConstrainedBox的限制来绘制redBox
          UnconstrainedBox(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 60, minWidth: 80),
              child: redBox,
            ),
          )
        ],
      ),
    );
  }
}
