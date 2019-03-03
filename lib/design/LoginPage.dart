import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/supplemental/cut_corners_border.dart';
class LoginPage extends StatefulWidget {
  static const String routeName = 'design/LoginPage';

  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage> {
  final _userNameController=TextEditingController();
  final _passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Column(
            children: <Widget>[
              FlutterLogo(
                size: 36.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text('Flutter教程'),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          TextField(
            controller: _userNameController,
            decoration: InputDecoration(
              border: CutCornersBorder(),
              labelText: '用户名',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: CutCornersBorder(),
              labelText: '密码',
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text('注册'),
              ),
              RaisedButton(
                onPressed: () {
                  print(_userNameController.text);
                  print(_passwordController.text);
                },
                child: Text('登陆'),
              ),
            ],
          )
        ],
      )),
    );
  }

}
