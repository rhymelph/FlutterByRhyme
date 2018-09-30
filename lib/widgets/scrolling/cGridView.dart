import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class GridViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/GridView';
  final String detail = '''可滚动的2D小部件数组。

网格的主轴方向是它滚动的方向（ scrollDirection）。

最常用的网格布局是GridView.count，它创建一个在交叉轴上具有固定数量的切片的布局，以及 GridView.extent，它创建一个具有最大交叉轴范围的切片的布局。自定义SliverGridDelegate可以生成儿童的任意2D排列，包括未对齐或重叠的排列。

要创建具有大（或无限）数量的孩子的网格，使用 GridView.builder构造带无论是 SliverGridDelegateWithFixedCrossAxisCount或 SliverGridDelegateWithMaxCrossAxisExtent的gridDelegate。

要使用自定义SliverChildDelegate，请使用GridView.custom。

要创建子线性数组，请使用ListView。

要控制滚动视图的初始滚动偏移，请为 控制器提供其ScrollController.initialScrollOffset属性集。''';

  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends ExampleState<GridViewDemo> {
  GridViewSetting setting;

  @override
  void initState() {
    setting = GridViewSetting(
        controller: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        reverse: boolValues[0],
        shrinkWrap: boolValues[0],
        addAutomaticKeepAlives: boolValues[0],
        addRepaintBoundaries: boolValues[0],
        scrollDirection: axisValues[1],
        primary: boolValues[0],
        physics: physicsValues[0],
        gridDelegate: Value(
          value: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          label: '''SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //一行几个
              childAspectRatio: 1.0, //宽高比
              mainAxisSpacing: 10.0, //垂直间距
              crossAxisSpacing: 10.0, //水平间距
            )''',
        ),
        children: Value(
          value: <Widget>[
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
              ),
            ),
          ],
          label: '''<Widget>[
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            //....
          ]''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''GridView(
      scrollDirection: ${setting.scrollDirection?.label??''},
      reverse: ${setting.reverse?.label??''},
      controller: ${setting.controller?.label??''},
      primary: ${setting.primary?.label??''},
      physics: ${setting.physics?.label??''},
      shrinkWrap: ${setting.shrinkWrap?.label??''},
      padding: ${setting.padding?.label??''},
      addAutomaticKeepAlives: ${setting.addAutomaticKeepAlives?.label??''},
      addRepaintBoundaries: ${setting.addRepaintBoundaries?.label??''},
      cacheExtent: ${setting.cacheExtent?.label??''},
      gridDelegate: ${setting.gridDelegate?.label??''},
      children: ${setting.children?.label??''},
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
      ValueTitleWidget(StringParams.kPhysics),
      RadioGroupWidget(
        setting.physics,
        physicsValues,
        (value) {
          setState(() {
            setting = setting.copyWith(physics: value);
          });
        },
      ),
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
    return 'GridView';
  }

  @override
  Widget getWidget() {
    return GridView(
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      controller: setting.controller?.value,
      primary: setting.primary?.value,
      physics: setting.physics?.value,
      shrinkWrap: setting.shrinkWrap?.value,
      padding: setting.padding?.value,
      gridDelegate: setting.gridDelegate?.value,
      addAutomaticKeepAlives: setting.addAutomaticKeepAlives?.value,
      addRepaintBoundaries: setting.addRepaintBoundaries?.value,
      cacheExtent: setting.cacheExtent?.value,
      children: setting.children?.value,
    );
  }
}

class GridViewSetting {
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollController> controller;
  final Value<bool> primary;
  final Value<bool> shrinkWrap;
  final Value<EdgeInsetsGeometry> padding;
  final Value<ScrollPhysics> physics;
  final Value<SliverGridDelegate> gridDelegate;
  final Value<bool> addAutomaticKeepAlives;
  final Value<bool> addRepaintBoundaries;
  final Value<double> cacheExtent;
  final Value<List<Widget>> children;

  GridViewSetting({
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.gridDelegate,
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.cacheExtent,
    this.children,
  });

  GridViewSetting copyWith({
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollController> controller,
    Value<bool> primary,
    Value<bool> shrinkWrap,
    Value<EdgeInsetsGeometry> padding,
    Value<ScrollPhysics> physics,
    Value<SliverGridDelegate> gridDelegate,
    Value<bool> addAutomaticKeepAlives,
    Value<bool> addRepaintBoundaries,
    Value<double> cacheExtent,
    Value<List<Widget>> children,
  }) {
    return GridViewSetting(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      padding: padding ?? this.padding,
      gridDelegate: gridDelegate ?? this.gridDelegate,
      addAutomaticKeepAlives:
          addAutomaticKeepAlives ?? this.addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries ?? this.addRepaintBoundaries,
      cacheExtent: cacheExtent ?? this.cacheExtent,
      children: children ?? this.children,
    );
  }
}
