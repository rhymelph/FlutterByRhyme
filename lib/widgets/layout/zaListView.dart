import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/ListView';
  final String detail = '';

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends ExampleState<ListViewDemo> {
  ListViewSetting setting;

  @override
  void initState() {
    setting = ListViewSetting(
      children: Value(
        value: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('F'),
            ),
            title: Text('Flutter'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('D'),
            ),
            title: Text('Dart'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('A'),
            ),
            title: Text('Android'),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('I'),
            ),
            title: Text('IOS'),
          ),
        ],
        label: '''<Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Text('F'),
          ),
          title: Text('Flutter'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('D'),
          ),
          title: Text('Dart'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('A'),
          ),
          title: Text('Android'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Text('I'),
          ),
          title: Text('IOS'),
        ),
      ]''',
      ),
      reverse: boolValues[0],
      shrinkWrap: boolValues[0],
      addAutomaticKeepAlives: boolValues[0],
      addRepaintBoundaries: boolValues[0],
      scrollDirection: axisValues[1],
      primary: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''ListView(
      scrollDirection: ${setting.scrollDirection?.label ?? ''},
      reverse: ${setting.reverse?.label ?? ''},
      controller: ${setting.controller?.label ?? ''},
      primary: ${setting.primary?.label ?? ''},
      physics: ${setting.physics?.label ?? ''},
      shrinkWrap: ${setting.shrinkWrap?.label ?? ''},
      padding: ${setting.padding?.label ?? ''},
      itemExtent: ${setting.itemExtent?.label ?? ''},
      addAutomaticKeepAlives: ${setting.addAutomaticKeepAlives?.label ?? ''},
      addRepaintBoundaries: ${setting.addRepaintBoundaries?.label ?? ''},
      cacheExtent: ${setting.cacheExtent?.label ?? ''},
      children: ${setting.children?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kScrollDirection),
      RadioGroupWidget(setting.scrollDirection, axisValues, (value) {
        setState(() {
          setting = setting.copyWith(scrollDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kReverse,
          value: setting.reverse,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(reverse: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kShrinkWrap,
          value: setting.shrinkWrap,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(shrinkWrap: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kAddAutomaticKeepAlives,
          value: setting.addAutomaticKeepAlives,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(addAutomaticKeepAlives: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kAddRepaintBoundaries,
          value: setting.addRepaintBoundaries,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(addRepaintBoundaries: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kPrimary,
          value: setting.primary,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(primary: value);
            });
          }),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kItemExtent,
        value: setting.itemExtent,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(itemExtent: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kCacheExtent,
        value: setting.cacheExtent,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(cacheExtent: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'ListView';
  }

  @override
  Widget getWidget() {
    return ListView(
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      controller: setting.controller?.value,
      primary: setting.primary?.value,
      physics: setting.physics?.value,
      shrinkWrap: setting.shrinkWrap?.value,
      padding: setting.padding?.value,
      itemExtent: setting.itemExtent?.value,
      addAutomaticKeepAlives: setting.addAutomaticKeepAlives?.value,
      addRepaintBoundaries: setting.addRepaintBoundaries?.value,
      cacheExtent: setting.cacheExtent?.value,
      children: setting.children?.value,
    );
  }
}

class ListViewSetting {
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollController> controller;
  final Value<bool> primary;
  final Value<ScrollPhysics> physics;
  final Value<bool> shrinkWrap;
  final Value<EdgeInsetsGeometry> padding;
  final Value<double> itemExtent;
  final Value<bool> addAutomaticKeepAlives;
  final Value<bool> addRepaintBoundaries;
  final Value<double> cacheExtent;
  final Value<List<Widget>> children;

  ListViewSetting({
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.itemExtent,
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.cacheExtent,
    this.children,
  });

  ListViewSetting copyWith({
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollController> controller,
    Value<bool> primary,
    Value<ScrollPhysics> physics,
    Value<bool> shrinkWrap,
    Value<EdgeInsetsGeometry> padding,
    Value<double> itemExtent,
    Value<bool> addAutomaticKeepAlives,
    Value<bool> addRepaintBoundaries,
    Value<double> cacheExtent,
    Value<List<Widget>> children,
  }) {
    return ListViewSetting(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      padding: padding ?? this.padding,
      itemExtent: itemExtent ?? this.itemExtent,
      addAutomaticKeepAlives:
          addAutomaticKeepAlives ?? this.addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries ?? this.addRepaintBoundaries,
      cacheExtent: cacheExtent ?? this.cacheExtent,
      children: children ?? this.children,
    );
  }
}
