import 'package:flutter/material.dart';

class ExampleScaffold extends StatelessWidget {
  ExampleScaffold({this.key,this.title, this.actions,this.body});

  final String title;
  final List<Widget> actions;
  final Widget body;
  final GlobalKey<ScaffoldState> key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(title),
        actions: (actions ?? <Widget>[])
          ..addAll(<Widget>[
            IconButton(
                icon: Icon(Icons.description),
                tooltip: 'Show example code!\n展示示例代码',
                onPressed: () {
                  _showExampleCode(context);
                }),
          ]),
      ),
      body: Stack(
          children: <Widget>[
            body,
          ],
      )
    );
  }
  //显示示例代码
  void _showExampleCode(BuildContext context){

  }
}
