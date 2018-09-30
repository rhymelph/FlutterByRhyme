import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SingleChildScrollViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/SingleChildScrollView';
  final String detail = '''可以滚动单个窗口小部件的框。

当您有一个通常完全可见的单个框时，此小部件很有用，例如时间选择器中的钟面，但如果容器在一个轴上太小（滚动方向），则需要确保它可以滚动）。

如果您需要在两个轴（主滚动方向以及横轴）上进行收缩包装，这也很有用，就像在对话框或弹出菜单中看到的那样。在这种情况下，您可以将SingleChildScrollView 与ListBody子对配对。

当你有一个子列表并且不需要跨轴收缩包装行为时，例如一个始终是屏幕宽度的滚动列表，请考虑ListView，这比包含ListBody或Column的SingleChildScrollView高效得多。很多孩子。''';

  @override
  _SingleChildScrollViewDemoState createState() =>
      _SingleChildScrollViewDemoState();
}

class _SingleChildScrollViewDemoState
    extends ExampleState<SingleChildScrollViewDemo> {
  SingleChildScrollViewSetting setting;

  @override
  void initState() {
    setting = SingleChildScrollViewSetting(
        controller: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        reverse: boolValues[0],
        scrollDirection: axisValues[1],
        primary: boolValues[0],
        physics: physicsValues[0],
        child: Value(
          value: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.lightGreen),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.limeAccent),
              ),
            ),
          ]),
          label: ''' Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            //....
          ]
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
    return '''SingleChildScrollView(
      scrollDirection: ${setting.scrollDirection?.label ?? ''},
      reverse: ${setting.reverse?.label ?? ''},
      controller: ${setting.controller?.label ?? ''},
      primary: ${setting.primary?.label ?? ''},
      physics: ${setting.physics?.label ?? ''},
      padding: ${setting.padding?.label ?? ''},
      child: ${setting.child?.label ?? ''},
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
//      SwitchValueTitleWidget(
//          title: StringParams.kPrimary,
//          value: setting.primary,
//          onChanged: (value) {
//            setState(() {
//              setting = setting.copyWith(primary: value);
//            });
//          }),
    ];
  }

  @override
  String getTitle() {
    return 'SingleChildScrollView';
  }

  @override
  Widget getWidget() {
    return SingleChildScrollView(
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      controller: setting.controller?.value,
      primary: setting.primary?.value,
      physics: setting.physics?.value,
      padding: setting.padding?.value,
      child: setting.child?.value,
    );
  }
}

class SingleChildScrollViewSetting {
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollController> controller;
  final Value<bool> primary;
  final Value<EdgeInsetsGeometry> padding;
  final Value<ScrollPhysics> physics;
  final Value<Widget> child;

  SingleChildScrollViewSetting({
    this.scrollDirection,
    this.reverse,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
  });

  SingleChildScrollViewSetting copyWith({
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollController> controller,
    Value<bool> primary,
    Value<EdgeInsetsGeometry> padding,
    Value<ScrollPhysics> physics,
    Value<Widget> child,
  }) {
    return SingleChildScrollViewSetting(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      padding: padding ?? this.padding,
      child: child ?? this.child,
    );
  }
}
