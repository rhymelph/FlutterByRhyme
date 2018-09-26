import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedWidgetBaseStateDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedWidgetBaseState';
  final String detail = '''具有隐式动画的小部件的基类，需要在动画运行时重建其小部件树。

这个类调用构建动画票证的每个帧。对于不重建每个帧的变体，请考虑直接对ImplicitlyAnimatedWidgetState进行子类化 。

子类必须实现forEachTween方法，以允许 AnimatedWidgetBaseState遍历子类的窗口小部件字段并为其设置动画。''';

  @override
  _AnimatedWidgetBaseStateDemoState createState() =>
      _AnimatedWidgetBaseStateDemoState();
}

class _AnimatedWidgetBaseStateDemoState
    extends ExampleState<AnimatedWidgetBaseStateDemo> {
  AnimatedWidgetBaseStateSetting setting;

  @override
  void initState() {
    setting = AnimatedWidgetBaseStateSetting(
      child: Value(
        value: Center(
          child: Text('Circle'),
        ),
        label: "Center(child: Text('Circle'),)",
      ),
      color: colorValues[0],
      borderColor: colorValues[1],
      width: doubleMiniValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''class AnimatedCircle extends ImplicitlyAnimatedWidget {
  final Color color;
  final Color borderColor;
  final Widget child;
  final double width;

  AnimatedCircle({
    @required this.width,
    @required this.child,
    @required this.color,
    this.borderColor,
    Curve curve: Curves.linear,
    Duration duration: const Duration(seconds: 1),
  }) : super(curve: curve, duration: duration);

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends AnimatedWidgetBaseState<AnimatedCircle> {
  ColorTween color;
  ColorTween borderColor;
  Tween<double> width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: color.evaluate(animation),
        shape: BoxShape.circle,
        border: Border.all(
            color: borderColor.evaluate(animation),
            width: width.evaluate(animation)),
      ),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    color = visitor(
        color, widget.color, (dynamic value) => new ColorTween(begin: value));
    borderColor = visitor(borderColor, widget.borderColor,
        (dynamic value) => new ColorTween(begin: value));
    width = visitor(width, widget.width,
        (dynamic value) => new Tween<double>(begin: value));
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget(StringParams.kBorder),
      ColorGroupWidget(setting.borderColor, (value) {
        setState(() {
          setting = setting.copyWith(borderColor: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kWidth,
        value: setting.width,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(width: value);
          });
        },
      )
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedWidgetBaseState';
  }

  @override
  Widget getWidget() {
    return Center(
      child: AnimatedCircle(
        width: setting.width?.value,
        color: setting.color?.value,
        borderColor: setting.borderColor?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class AnimatedWidgetBaseStateSetting {
  final Value<double> width;
  final Value<Color> color;
  final Value<Color> borderColor;
  final Value<Widget> child;

  AnimatedWidgetBaseStateSetting({
    this.width,
    this.color,
    this.borderColor,
    this.child,
  });

  AnimatedWidgetBaseStateSetting copyWith({
    Value<Color> color,
    Value<Color> borderColor,
    Value<Widget> child,
    Value<double> width,
  }) {
    return AnimatedWidgetBaseStateSetting(
      color: color ?? this.color,
      width: width ?? this.width,
      borderColor: borderColor ?? this.borderColor,
      child: child ?? this.child,
    );
  }
}

class AnimatedCircle extends ImplicitlyAnimatedWidget {
  final Color color;
  final Color borderColor;
  final Widget child;
  final double width;

  AnimatedCircle({
    @required this.width,
    @required this.child,
    @required this.color,
    this.borderColor,
    Curve curve: Curves.linear,
    Duration duration: const Duration(seconds: 1),
  }) : super(curve: curve, duration: duration);

  @override
  _AnimatedCircleState createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends AnimatedWidgetBaseState<AnimatedCircle> {
  ColorTween color;
  ColorTween borderColor;
  Tween<double> width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: color.evaluate(animation),
        shape: BoxShape.circle,
        border: Border.all(
            color: borderColor.evaluate(animation),
            width: width.evaluate(animation)),
      ),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    color = visitor(
        color, widget.color, (dynamic value) => new ColorTween(begin: value));
    borderColor = visitor(borderColor, widget.borderColor,
        (dynamic value) => new ColorTween(begin: value));
    width = visitor(width, widget.width,
        (dynamic value) => new Tween<double>(begin: value));
  }
}
