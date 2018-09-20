import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/ListView';
  final String detail = '''可线性排列的小部件可滚动列表。

ListView是最常用的滚动小部件。它在滚动方向上一个接一个地显示其子项。在横轴中，子项需要填充ListView。

如果为非null，则itemExtent强制子项在滚动方向上具有给定范围。指定itemExtent比让孩子确定自己的范围更有效，因为滚动机器可以利用孩子保存工作的程度的预知，例如当滚动位置急剧变化时。

构造ListView有四个选项：

默认构造函数采用显式List孩子的。此构造函数适用于具有少量子项的列表视图，因为构造List需要为可能在列表视图中显示的每个子项执行工作，而不仅仅是那些实际可见的子项。

该ListView.builder构造函数采用IndexedWidgetBuilder，它建立在孩子的需求。此构造函数适用于具有大量（或无限）子项数的列表视图，因为仅为实际可见的子项调用构建器。

该ListView.separated构造函数有两个IndexedWidgetBuilder S： itemBuilder按需建立个子项目，separatorBuilder 同样建立其出现在子项之间的分隔符的孩子。此构造函数适用于具有固定数量子项的列表视图。

该ListView.custom构造需要SliverChildDelegate，它提供了自定义子模型的其他方面的能力。例如，SliverChildDelegate可以控制用于估计实际上不可见的子项大小的算法。

要控制滚动视图的初始滚动偏移，请为 控制器提供其ScrollController.initialScrollOffset属性集。

默认情况下，ListView将自动填充列表的可滚动末端，以避免MediaQuery填充指示的部分障碍。要避免此行为，请使用零填充属性覆盖。''';

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
