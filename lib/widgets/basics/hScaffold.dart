import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class ScaffoldDemo extends StatefulWidget {
  static const String routeName='widgets/basics/Scaffold';

  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends ExampleState<ScaffoldDemo> {
  ScaffoldSetting setting;

  @override
  void initState() {
    setting=ScaffoldSetting();
    super.initState();
  }
  @override
  String getDetail() {
    return '';
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'Scaffold';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text('appbar'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },child: Icon(Icons.add),),

    );
  }
}


class ScaffoldSetting{
  Value<PreferredSizeWidget> appBar;
  Value<Widget> body;

}