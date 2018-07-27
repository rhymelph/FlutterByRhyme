import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TabBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TabBar';
  final String detail = '';

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends ExampleState<TabBarDemo> {
  TabBarSetting setting;

  @override
  void initState() {
    setting = TabBarSetting(tabs: null);

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
    return 'TabBar';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: TabBar(
        tabs: setting.tabs?.value,
        controller: setting.controller?.value,
        isScrollable: setting.isScrollable?.value,
        indicatorColor: setting.indicatorColor?.value,
        indicatorWeight: setting.indicatorWeight?.value,
        indicatorPadding: setting.indicatorPadding?.value,
        indicator: setting.indicator?.value,
        indicatorSize: setting.indicatorSize?.value,
        labelColor: setting.labelColor?.value,
        unselectedLabelColor: setting.unselectedLabelColor?.value,
        labelStyle: setting.labelStyle?.value,
        unselectedLabelStyle: setting.unselectedLabelStyle?.value,
      ),
      body: Text('Body'),
    );
  }
}

class TabBarSetting {
  final Value<List<Widget>> tabs;
  final Value<TabController> controller;
  final Value<bool> isScrollable;
  final Value<Color> indicatorColor;
  final Value<double> indicatorWeight;
  final Value<EdgeInsetsGeometry> indicatorPadding;
  final Value<Decoration> indicator;
  final Value<TabBarIndicatorSize> indicatorSize;
  final Value<Color> labelColor;
  final Value<Color> unselectedLabelColor;
  final Value<TextStyle> labelStyle;
  final Value<TextStyle> unselectedLabelStyle;

  const TabBarSetting({
    @required this.tabs,
    this.controller,
    this.isScrollable,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorPadding,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
  });
}
