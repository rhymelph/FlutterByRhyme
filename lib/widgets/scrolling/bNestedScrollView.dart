import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class NestedScrollViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/NestedScrollView';
  final String detail = '''其中的滚动视图可以嵌套其他滚动视图，其滚动位置本质上是链接的。

此小部件最常见的用例是可滚动视图，其中包含一个灵活的SliverAppBar，其中包含标题中的TabBar（由headerSliv​​erBuilder构建 ，并在主体中包含TabBarView，以便可滚动视图的内容根据哪个选项卡可见而变化。''';

  @override
  _NestedScrollViewDemoState createState() => _NestedScrollViewDemoState();
}

class _NestedScrollViewDemoState extends ExampleState<NestedScrollViewDemo> {
  NestedScrollViewSetting setting;

  @override
  void initState() {
    setting = NestedScrollViewSetting(
        controller: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        reverse: boolValues[0],
        physics: physicsValues[0],
        scrollDirection: axisValues[0],
        headerSliverBuilder: Value(
          value: (BuildContext context, bool innerBoxIsScrolled) {
            //内盒是否滚动
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          label: '''(BuildContext context, bool innerBoxIsScrolled) {
            //内盒是否滚动
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          }''',
        ),
        body: Value(
          value: ListView(
            children: <Widget>[
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
              ListTile(
                leading: CircleAvatar(
                  child: Text('K'),
                ),
                title: Text('Kotlin'),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Text('O'),
                ),
                title: Text('Object-C'),
              ),
            ],
          ),

          label: '''ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text('F'),
                ),
                title: Text('Flutter'),
              ),
              //...
            ],
          )''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''NestedScrollView(
      headerSliverBuilder: ${setting.headerSliverBuilder?.label ?? ''},
      body: ${setting.body?.label ?? ''},
      controller: ${setting.controller?.label ?? ''},
      scrollDirection: ${setting.scrollDirection?.label ?? ''},
      reverse: ${setting.reverse?.label ?? ''},
      physics: ${setting.physics?.label ?? ''},
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

    ];
  }

  @override
  String getTitle() {
    return 'NestedScrollView';
  }

  @override
  Widget getWidget() {
    return NestedScrollView(
      headerSliverBuilder: setting.headerSliverBuilder?.value,
      body: setting.body?.value,
      controller: setting.controller?.value,
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      physics: setting.physics?.value,
    );
  }
}

class NestedScrollViewSetting {
  final Value<ScrollController> controller;
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollPhysics> physics;
  final Value<NestedScrollViewHeaderSliversBuilder> headerSliverBuilder;
  final Value<Widget> body;

  NestedScrollViewSetting(
      {this.controller,
      this.scrollDirection,
      this.reverse,
      this.physics,
      this.headerSliverBuilder,
      this.body});

  NestedScrollViewSetting copyWith({
    Value<ScrollController> controller,
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollPhysics> physics,
    Value<NestedScrollViewHeaderSliversBuilder> headerSliverBuilder,
    Value<Widget> body,
  }) {
    return NestedScrollViewSetting(
      controller: controller ?? this.controller,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      physics: physics ?? this.physics,
      headerSliverBuilder: headerSliverBuilder ?? this.headerSliverBuilder,
      body: body ?? this.body,
    );
  }
}
