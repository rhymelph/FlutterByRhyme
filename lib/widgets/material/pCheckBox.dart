import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class CheckBoxDemo extends StatefulWidget {
  static const String routeName='widgets/material/CheckBox';
  final String detail='';
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends ExampleState<CheckBoxDemo> {
  @override
  String getDetail() {
    return widget.detail;
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
    return 'CheckBox';
  }

  @override
  Widget getWidget() {
    // TODO: implement getWidget
    return Center(
      child: Checkbox(value: null, onChanged: null),
    );
  }
}
