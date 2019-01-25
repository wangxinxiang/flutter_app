import 'package:flutter/material.dart';

class PictureView extends StatefulWidget {

  final String _image;

  PictureView(this._image);

  @override
  State<StatefulWidget> createState() {
    return _PictureViewState(_image);
  }

}

class _PictureViewState extends State<PictureView> {

  String _image;
  double _width = 200;

  _PictureViewState(this._image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片查看'),),
      body: Center(
        child: GestureDetector(
          child: Image.asset(_image, width: _width,),
          onScaleUpdate: (ScaleUpdateDetails detail) {
            setState(() {
              _width = 200 * detail.scale.clamp(.5, 2);
            });
          },
        ),
      ),
    );
  }



}