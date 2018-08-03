import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TabBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TabBar';
  final String detail = '''A material design widget that displays a horizontal row of tabs.
Typically created as the AppBar.bottom part of an AppBar and in conjunction with a TabBarView.
If a TabController is not provided, then a DefaultTabController ancestor must be provided instead. The tab controller's TabController.length must equal the length of the tabs list.
Requires one of its ancestors to be a Material widget.
See also:
TabBarView, which displays page views that correspond to each tab.''';

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends ExampleState<TabBarDemo> {
  TabBarSetting setting;

  bool isExpanded = false;
  bool isUnSelectExpanded = false;

  @override
  void initState() {
    setting = TabBarSetting(
      tabs: tabValues[0],
      isScrollable: const Value(
        name: 'true',
        value: true,
        label: 'true',
      ),
      indicator: decorationValues[0],
      indicatorWeight: doubleMiniValues[1],
    );

    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''DefaultTabController(
      length: ${setting.tabs.value.length.toString()},
      child: Scaffold(
        appBar: TabBar(
          tabs: ${setting.tabs?.label??''},
          controller: ${setting.controller?.label??''},
          isScrollable: ${setting.isScrollable?.label??''},
          indicatorColor: ${setting.indicatorColor?.label??''},
          indicatorWeight: ${setting.indicatorWeight?.label??''},
          indicatorPadding: ${setting.indicatorPadding?.label??''},
          indicator: ${setting.indicator?.label??''},
          indicatorSize: ${setting.indicatorSize?.label??''},
          labelColor: ${setting.labelColor?.label??''},
          unselectedLabelColor: ${setting.unselectedLabelColor?.label??''},
          labelStyle: ${setting.labelStyle?.label??''},
          unselectedLabelStyle: ${setting.unselectedLabelStyle?.label??''},
        ),
        body: Center(child: Text('Body')),
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kLabelStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                labelStyle: value,
              );
            });
          },
        ),
      ),
      ExpansionPanelTitleWidget(
        isExpanded: isUnSelectExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isUnSelectExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kUnselectedLabelStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                unselectedLabelStyle: value,
              );
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kTabs),
      RadioGroupWidget(setting.tabs, tabValues, (value) {
        setState(() {
          setting = setting.copyWith(tabs: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicatorPadding),
      RadioGroupWidget(setting.indicatorPadding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(indicatorPadding: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicatorSize),
      RadioGroupWidget(setting.indicatorSize, tabBarIndicatorSizeValues, (value) {
        setState(() {
          setting = setting.copyWith(indicatorSize: value);
        });
      }),
      ValueTitleWidget(StringParams.kLabelColor),
      ColorGroupWidget(setting.labelColor,  (value) {
        setState(() {
          setting = setting.copyWith(labelColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicatorColor),
      ColorGroupWidget(setting.indicatorColor,  (value) {
        setState(() {
          setting = setting.copyWith(indicatorColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kUnselectedLabelColor),
      ColorGroupWidget(setting.unselectedLabelColor,  (value) {
        setState(() {
          setting = setting.copyWith(unselectedLabelColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicator),
      DecorationGroupWidget(setting.indicator, decorationValues, (value) {
        setState(() {
          setting = setting.copyWith(indicator: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kIsScrollable,
        value: setting.isScrollable,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isScrollable: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kIndicatorWeight,
        value: setting.indicatorWeight,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(indicatorWeight: value);
          });
        },
      ),


    ];
  }

  @override
  String getTitle() {
    return 'TabBar';
  }

  @override
  Widget getWidget() {
    return DefaultTabController(
      length: setting.tabs.value.length,
      child: Scaffold(
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
        body: Center(child: Text('Body')),
      ),
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
  final Value<TextStyle> labelStyle;
  final Value<Color> unselectedLabelColor;
  final Value<TextStyle> unselectedLabelStyle;

  TabBarSetting({
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

  TabBarSetting copyWith({
    Value<List<Widget>> tabs,
    Value<TabController> controller,
    Value<bool> isScrollable,
    Value<Color> indicatorColor,
    Value<double> indicatorWeight,
    Value<EdgeInsetsGeometry> indicatorPadding,
    Value<Decoration> indicator,
    Value<TabBarIndicatorSize> indicatorSize,
    Value<Color> labelColor,
    Value<Color> unselectedLabelColor,
    Value<TextStyle> labelStyle,
    Value<TextStyle> unselectedLabelStyle,
  }) {
    return TabBarSetting(
      tabs: tabs ?? this.tabs,
      controller: controller ?? this.controller,
      isScrollable: isScrollable ?? this.isScrollable,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorWeight: indicatorWeight ?? this.indicatorWeight,
      indicatorPadding: indicatorPadding ?? this.indicatorPadding,
      indicator: indicator ?? this.indicator,
      indicatorSize: indicatorSize ?? this.indicatorSize,
      labelColor: labelColor ?? this.labelColor,
      labelStyle: labelStyle ?? this.labelStyle,
      unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
    );
  }
}


