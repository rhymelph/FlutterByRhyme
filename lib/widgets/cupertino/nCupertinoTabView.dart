import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTabViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabView';
  final String detail = '';

  @override
  _CupertinoTabViewDemoState createState() => _CupertinoTabViewDemoState();
}

class _CupertinoTabViewDemoState extends ExampleState<CupertinoTabViewDemo> {
  CupertinoTabViewSetting setting;

  @override
  void initState() {
    setting = CupertinoTabViewSetting();
    super.initState();
  }

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
    return 'CupertinoTabView';
  }

  @override
  Widget getWidget() {
    return CupertinoTabView();
  }
}

class CupertinoTabViewSetting {
  final Value<WidgetBuilder> builder;
  final Value<Map<String, WidgetBuilder>> routes;
  final Value<Map<String, WidgetBuilder>> onGenerateRoute;
  final Value<Map<String, WidgetBuilder>> onUnknownRoute;
  final Value<List<NavigatorObserver>> navigatorObservers;

  CupertinoTabViewSetting({
    this.builder,
    this.routes,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
  });

  CupertinoTabViewSetting copyWith({
    Value<WidgetBuilder> builder,
    Value<Map<String, WidgetBuilder>> routes,
    Value<Map<String, WidgetBuilder>> onGenerateRoute,
    Value<Map<String, WidgetBuilder>> onUnknownRoute,
    Value<List<NavigatorObserver>> navigatorObservers,
  }) {
    return CupertinoTabViewSetting();
  }
}
