import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CustomScrollViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/CustomScrollView';
  final String detail = '''一个滚动型创建使用棉条自定义滚动效果。

一个CustomScrollView允许您提供条子直接创建不同的滚动效果，如列表，网格，扩大头。例如，要创建包含展开的应用栏，后跟列表和网格的滚动视图，请使用三个条带的列表：SliverAppBar，SliverList和SliverGrid。

这些条子中的小部件必须生成RenderSliv​​er对象。

要控制滚动视图的初始滚动偏移，请为 控制器提供其ScrollController.initialScrollOffset属性集。''';

  @override
  _CustomScrollViewDemoState createState() => _CustomScrollViewDemoState();
}

class _CustomScrollViewDemoState extends ExampleState<CustomScrollViewDemo> {
  CustomScrollViewSetting setting;

  @override
  void initState() {
    setting = CustomScrollViewSetting(
        controller: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        reverse: boolValues[0],
        shrinkWrap: boolValues[0],
        scrollDirection: axisValues[1],
        primary: boolValues[0],
        physics: physicsValues[0],
        slivers: Value(
          value: <Widget>[
            //工具栏
            SliverAppBar(
              title: Text('标题'),
            ),
            //列表
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Text('I'),
                  Text('❤'),
                  Text('Love'),
                  Text('❤'),
                  Text('Flutter'),
                  Text('❤'),
                  Text('And'),
                  Text('❤'),
                  Text('Dart'),
                  Column(
                    children: <Widget>[
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                    ],
                  )
                ],
              ),
            ),
            //网格
            SliverGrid(
              delegate: SliverChildListDelegate(<Widget>[
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
              ]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ],
        label: '''<Widget>[
            //工具栏
            SliverAppBar(
              title: Text('标题'),
            ),
            //列表
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Text('I'),
                  Text('❤'),
                  Text('Love'),
                  Text('❤'),
                  Text('Flutter'),
                  Text('❤'),
                  Text('And'),
                  Text('❤'),
                  Text('Dart'),
                  Column(
                    children: <Widget>[
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                      Text('❤'),
                    ],
                  )
                ],
              ),
            ),
            //网格
            SliverGrid(
              delegate: SliverChildListDelegate(<Widget>[
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
              ]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ]''',
        ),);
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CustomScrollView(
      scrollDirection: ${setting.scrollDirection?.label ?? ''},
      reverse: ${setting.reverse?.label ?? ''},
      controller: ${setting.controller?.label ?? ''},
      primary: ${setting.primary?.label ?? ''},
      physics: ${setting.physics?.label ?? ''},
      shrinkWrap: ${setting.shrinkWrap?.label ?? ''},
      cacheExtent: ${setting.cacheExtent?.label ?? ''},
      slivers: ${setting.slivers?.label ?? ''},
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
    return 'CustomScrollView';
  }

  @override
  Widget getWidget() {
    return CustomScrollView(
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      controller: setting.controller?.value,
      primary: setting.primary?.value,
      physics: setting.physics?.value,
      shrinkWrap: setting.shrinkWrap?.value,
      cacheExtent: setting.cacheExtent?.value,
      slivers: setting.slivers?.value,
    );
  }
}

class CustomScrollViewSetting {
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollController> controller;
  final Value<bool> primary;
  final Value<ScrollPhysics> physics;
  final Value<bool> shrinkWrap;
  final Value<double> cacheExtent;
  final Value<List<Widget>> slivers;

  CustomScrollViewSetting({
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.cacheExtent,
    this.slivers,
  });

  CustomScrollViewSetting copyWith({
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollController> controller,
    Value<bool> primary,
    Value<ScrollPhysics> physics,
    Value<List<Widget>> slivers,
    Value<double> cacheExtent,
    Value<bool> shrinkWrap,
  }) {
    return CustomScrollViewSetting(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      slivers: slivers ?? this.slivers,
      cacheExtent: cacheExtent ?? this.cacheExtent,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
    );
  }
}
