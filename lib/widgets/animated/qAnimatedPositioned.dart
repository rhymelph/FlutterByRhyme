import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedPositioned';
  final String detail = '''定位的动画版本，可在给定位置发生变化时自动转换孩子在给定持续时间内的位置。

只有当它是Stack的子元素时才有效。

如果孩子的大小最终会因此动画而改变，则此小部件是一个不错的选择。如果大小旨在保持不变，只有位置随时间变化，那么请考虑使用 SlideTransition。SlideTransition仅触发重绘动画的每一帧，而AnimatedPositioned也会触发重放。''';

  @override
  _AnimatedPositionedDemoState createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState
    extends ExampleState<AnimatedPositionedDemo> {
  AnimatedPositionedSetting setting;

  @override
  void initState() {
    setting = AnimatedPositionedSetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      left: doubleLargeValues[0],
      top: doubleLargeValues[0],
      bottom: doubleLargeValues[0],
      right: doubleLargeValues[0],
//      width: doubleHugeValues[0],
//      height: doubleHugeValues[0],
      curve: curveValues[0],
      duration: durationValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Stack(
      children: <Widget>[
        AnimatedPositioned(
          child: ${setting.child?.label??''},
          left: ${setting.left?.label??''},
          top: ${setting.top?.label??''},
          right: ${setting.right?.label??''},
          bottom: ${setting.bottom?.label??''},
          width: ${setting.width?.label??''},
          height: ${setting.height?.label??''},
          duration: ${setting.duration?.label??''},
        )
      ],
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value) {
        setState(() {
          setting = setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kCurve),
      RadioGroupWidget(setting.curve, curveValues, (value) {
        setState(() {
          setting = setting.copyWith(curve: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kLeft,
        value: setting.left,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(left: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kRight,
        value: setting.right,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(right: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kTop,
        value: setting.top,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(top: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kBottom,
        value: setting.bottom,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(bottom: value);
          });
        },
      ),
//      DropDownValueTitleWidget(
//        selectList: doubleHugeValues,
//        title: StringParams.kWidth,
//        value: setting.width,
//        onChanged: (value) {
//          setState(() {
//            setting = setting.copyWith(width: value);
//          });
//        },
//      ),
//      DropDownValueTitleWidget(
//        selectList: doubleHugeValues,
//        title: StringParams.kHeight,
//        value: setting.height,
//        onChanged: (value) {
//          setState(() {
//            setting = setting.copyWith(height: value);
//          });
//        },
//      ),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedPositioned';
  }

  @override
  Widget getWidget() {
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          child: setting.child?.value,
          left: setting.left?.value,
          top: setting.top?.value,
          right: setting.right?.value,
          bottom: setting.bottom?.value,
          width: setting.width?.value,
          height: setting.height?.value,
          duration: setting.duration?.value,
        )
      ],
    );
  }
}

class AnimatedPositionedSetting {
  final Value<Widget> child;
  final Value<double> left;
  final Value<double> top;
  final Value<double> right;
  final Value<double> bottom;
  final Value<double> width;
  final Value<double> height;
  final Value<Curve> curve;
  final Value<Duration> duration;

  AnimatedPositionedSetting({
    this.child,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.curve,
    this.duration,
  });

  AnimatedPositionedSetting copyWith({
    Value<Widget> child,
    Value<double> left,
    Value<double> top,
    Value<double> right,
    Value<double> bottom,
    Value<double> width,
    Value<double> height,
    Value<Curve> curve,
    Value<Duration> duration,
  }) {
    return AnimatedPositionedSetting(
      child: child ?? this.child,
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      width: width ?? this.width,
      height: height ?? this.height,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
    );
  }
}
