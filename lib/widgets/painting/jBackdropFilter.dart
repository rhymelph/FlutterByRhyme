import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BackdropFilterDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/BackdropFilter';
  final String detail = '''一个小部件，它将过滤器应用于现有的绘制内容，然后绘制子项。

这种效果相对昂贵，特别是如果滤镜是非局部的，例如模糊。''';

  @override
  _BackdropFilterDemoState createState() => _BackdropFilterDemoState();
}

class _BackdropFilterDemoState extends ExampleState<BackdropFilterDemo> {
  BackdropFilterSetting setting;

  @override
  void initState() {
    setting = BackdropFilterSetting(
      filter: Value(
        value: ui.ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
        label: 'ui.ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0)',
      ),
      child: Value(
        value: DecoratedBox(decoration: BoxDecoration(color: Colors.transparent)),
        label: "Image.asset('images/burgers.jpg')",
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''import 'dart:ui' as ui;
    
Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('images/burgers.jpg'),
        BackdropFilter(
          filter: ${setting.filter?.label??''},
          child: ${setting.child?.label??''},
        ),
      ],
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'BackdropFilter';
  }

  @override
  Widget getWidget() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('images/burgers.jpg'),
        BackdropFilter(
          filter: setting.filter?.value,
          child: setting.child?.value,
        ),
      ],
    );
  }
}

class BackdropFilterSetting {
  final Value<Widget> child;
  final Value<ui.ImageFilter> filter;

  BackdropFilterSetting({this.filter, this.child});

  BackdropFilterSetting copyWith({
    Value<Widget> child,
    Value<ui.ImageFilter> filter,
  }) {
    return BackdropFilterSetting(
      child: child ?? this.child,
      filter: filter ?? this.filter,
    );
  }
}
