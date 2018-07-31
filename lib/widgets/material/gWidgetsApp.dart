import 'package:flutter/material.dart';

class WidgetsAppDemo extends StatelessWidget {
  static const String routeName='widgets/material/WidgetsApp';
  static final String detail='''> 是未经过改装的MaterialApp
> 可以说MaterialApp基于WidgetsApp

## 与MaterialApp相比
> 相同字段有:
''';
  @override
  Widget build(BuildContext context) {
    return WidgetsApp();
  }
}
