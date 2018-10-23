import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ExcludeSemanticsDemo extends StatefulWidget {
  static const String routeName = 'widgets/access/ExcludeSemantics';
  final String detail = '''## 介绍
一个删除所有后代的语义的小部件。

当排除为真时，该小部件（及其子树）被排除在语义树之外。

这可以用来隐藏否则会被报告但只会混淆的后代小部件。例如，素材库的芯片小部件隐藏了化身，因为它与芯片标签是冗余的。

## 使用
```dart
ExcludeSemantics(
          excluding: true,
          child: Semantics(
            value: 'Hello',
            child: Text('Hello'),
          ),
        );
```''';

  @override
  _ExcludeSemanticsDemoState createState() => _ExcludeSemanticsDemoState();
}

class _ExcludeSemanticsDemoState extends MarkdownState<ExcludeSemanticsDemo> {

  @override
  String getMarkdownSource() {
    return widget.detail;
  }

  @override
  String getTitle() {
    return 'ExcludeSemantics';

  }
}
