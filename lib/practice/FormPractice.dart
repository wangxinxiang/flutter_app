import 'package:flutter/material.dart';

class FormPractice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormPracticeState();
  }
}

class _FormPracticeState extends State<FormPractice> {
  TextEditingController _nameController = new TextEditingController(); //获文本框的值
  TextEditingController _pdwController = new TextEditingController();

  FocusNode _nameFocusNode = new FocusNode();
  FocusNode _pdwFocusNode = new FocusNode();
  FocusScopeNode _focusScopeNode;

  GlobalKey _globalKey = new GlobalKey<FormState>();

  ///获取FormState，来对Form进行统一操作

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      ///监听输入框变化(包括焦点变化),同onChanged
      print(_nameController.text);
    });
    _nameFocusNode.addListener(() {
      ///监听焦点变化
      print('focus');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('2333'),
      ),
      body: new Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: _buildText(context),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return new Form(
        key: _globalKey, //设置globalKey，用于后面获取FormState
        autovalidate: true, //开启自动校验
        child: new Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person),
              ),
              focusNode: _nameFocusNode,
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pdwController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              focusNode: _pdwFocusNode,
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            _buildButton(context),
          ],
        ));
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
                padding: EdgeInsets.all(15),
                child: Text('登陆'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  // 通过_formKey.currentState 获取FormState后，
                  // 调用validate()方法校验用户名密码是否合法，校验
                  // 通过后再提交数据。
                  if ((_globalKey.currentState as FormState).validate()) {
                    ///校验数据
                    print('通过校验');
                  } else {
                    print('未通过校验');
                  }
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildButton2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Row(
        children: <Widget>[
          /// 通过Builder来获取RaisedButton所在widget树的真正context(Element)
          Expanded(child: Builder(builder: (context) {
            return RaisedButton(
                padding: EdgeInsets.all(15),
                child: Text('登陆'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  ///由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                  if ((_globalKey.currentState as FormState).validate()) {
                    ///校验数据
                    print('通过校验');
                  } else {
                    print('未通过校验');
                  }
                });
          })),
        ],
      ),
    );
  }
}
