import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class PaddingDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Padding';
  final String detail = '''> Padding的构造方法
```dart
  const Padding({
    Key key,
    @required this.padding,
    Widget child,
  }) : assert(padding != null),
       super(key: key, child: child);
```
|类型| 参数 | 解析|
|-|-|-|
| Key|key|传递给父类|
|EdgeInsetsGeometry|padding| 必传的参数，内边距|
|Widget | child | 传递给父类，需要添加内边距的子widget|

> EdgeInsetsGeometry使用内置的方法添加内边距

```dart
//1
  const EdgeInsets.symmetric({ double vertical = 0.0,
                             double horizontal = 0.0 });
//2
  const EdgeInsets.only({
    this.left = 0.0,
    this.top = 0.0,
    this.right = 0.0,
    this.bottom = 0.0
  });
//3
  const EdgeInsets.all(double value);
//4
  const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);
//5
  EdgeInsets.fromWindowPadding(ui.WindowPadding padding, double devicePixelRatio)
//6
  EdgeInsets.lerp(EdgeInsets a, EdgeInsets b, double t)
//7
  EdgeInsets.zero
//8
  const EdgeInsetsDirectional.fromSTEB(start, top, end, bottom);
//9
  const EdgeInsetsDirectional.only({
    this.start = 0.0,
    this.top = 0.0,
    this.end = 0.0,
    this.bottom = 0.0
  });
```''';

  @override
  _PaddingDemoState createState() =>
      _PaddingDemoState();
}

class _PaddingDemoState
    extends MarkdownState<PaddingDemo> {

  @override
  String getMarkdownSource() {
    return widget.detail;
  }

  @override
  String getTitle() {
    return 'Padding';
  }
}

