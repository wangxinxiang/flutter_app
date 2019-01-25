import 'package:flutter/material.dart';

class TextFieldPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldPracticeState();
  }

}

class _TextFieldPracticeState extends State<TextFieldPractice> {

  TextEditingController _nameController = new TextEditingController();  //获文本框的值
  TextEditingController _pdwController = new TextEditingController();

  FocusNode _nameFocusNode = new FocusNode();
  FocusNode _pdwFocusNode = new FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    super.initState();
    _nameController.addListener((){ ///监听输入框变化(包括焦点变化),同onChanged
      print(_nameController.text);
    });
    _nameFocusNode.addListener(() { ///监听焦点变化
      print('focus');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('2333'),),
      body: new Padding(
        padding: EdgeInsets.all(20),
        child: Theme(
            data: Theme.of(context).copyWith(
              brightness: Brightness.dark,
            ),
            child: _buildText(context)),
      ),
    );
  }

  Widget _buildText(BuildContext context) {

    return new Column(
      children: <Widget>[
        TextField(
          controller: _nameController,
          autofocus: true,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '用户名或邮箱',
            prefixIcon: Icon(Icons.person),
          ),
          onChanged: (v){ ///监听输入框变化
            print("onChange:$v");
          },
          focusNode: _nameFocusNode,
        ),
        TextField(
          controller: _pdwController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '您的登录密码',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          focusNode: _pdwFocusNode,
        ),
        _buildButton(context),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          RaisedButton(
            child: Text('移动焦点'),
            onPressed: () {
              if(_focusScopeNode == null) {
                _focusScopeNode = FocusScope.of(context);
              }
              _focusScopeNode.requestFocus(_pdwFocusNode);
          }),
          RaisedButton(
            child: Text('隐藏键盘'),
              onPressed: () {
                _pdwFocusNode.unfocus();
                _nameFocusNode.unfocus();
          }),
        ],
      );
    });
  }

}
