import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SimpleDialogDemo extends StatefulWidget {
static const String routeName='widgets/material/SimpleDialog';
final String detail='';
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends ExampleState<SimpleDialogDemo> {
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
    return 'SimpleDialog';
  }

  @override
  Widget getWidget() {
    return SimpleDialog();
  }
}

