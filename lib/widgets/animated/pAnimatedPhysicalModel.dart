import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedPhysicalModelDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedPhysicalModel';
  final String detail = '''PhysicalModel的动画版本。

该borderRadius和海拔的动画。

如果设置了animateColor属性，则会对颜色进行动画处理; 否则，颜色会在动画开始时立即改变，以用于其他两个属性。这允许颜色独立地动画化（例如，因为它由AnimatedTheme驱动）。

该形状没有设置动画。''';

  @override
  _AnimatedPhysicalModelDemoState createState() =>
      _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState
    extends ExampleState<AnimatedPhysicalModelDemo> {
  AnimatedPhysicalModelSetting setting;

  @override
  void initState() {
    setting = AnimatedPhysicalModelSetting(
      shape: boxShapeValues[0],
      clipBehavior: clipValues[0],
      borderRadius: borderRadiusValues[0],
      elevation: doubleLargeValues[0],
      color: colorValues[1],
      shadowColor: colorValues[2],
      animateColor: boolValues[0],
      animateShadowColor: boolValues[0],
      curve: curveValues[0],
      duration: durationValues[0],
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AnimatedPhysicalModel(
      child: ${setting.child?.label??''},
      shape: ${setting.shape?.label??''},
      clipBehavior: ${setting.clipBehavior?.label??''},
      borderRadius: ${setting.borderRadius?.label??''},
      elevation: ${setting.elevation?.label??''},
      color: ${setting.color?.label??''},
      animateColor: ${setting.animateColor?.label??''},
      shadowColor: ${setting.shadowColor?.label??''},
      animateShadowColor: ${setting.animateShadowColor?.label??''},
      curve: ${setting.curve?.label??''},
      duration: ${setting.duration?.label??''},
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
      ValueTitleWidget(StringParams.kShape),
      RadioGroupWidget(setting.shape, boxShapeValues, (value) {
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget(StringParams.kClipBehavior),
      RadioGroupWidget(setting.clipBehavior, clipValues, (value) {
        setState(() {
          setting = setting.copyWith(clipBehavior: value);
        });
      }),
      ValueTitleWidget(StringParams.kBorderRadius),
      RadioGroupWidget(setting.borderRadius, borderRadiusValues, (value) {
        setState(() {
          setting = setting.copyWith(borderRadius: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value){
        setState(() {
          setting=setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget(StringParams.kShadowColor),
      ColorGroupWidget(setting.shadowColor, (value){
        setState(() {
          setting=setting.copyWith(shadowColor: value);
        });
      }),
      DropDownValueTitleWidget(selectList: doubleLargeValues, title: StringParams.kElevation, value: setting.elevation,onChanged: (value){
        setState(() {
          setting=setting.copyWith(elevation: value);
        });
      },),
      SwitchValueTitleWidget(title: StringParams.kAnimateColor, value: setting.animateColor, onChanged: (value){
        setState(() {
          setting=setting.copyWith(animateColor: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kAnimateColor, value: setting.animateShadowColor, onChanged: (value){
        setState(() {
          setting=setting.copyWith(animateShadowColor: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedPhysicalModel';
  }

  @override
  Widget getWidget() {
    return AnimatedPhysicalModel(
      child: setting.child?.value,
      shape: setting.shape?.value,
      clipBehavior: setting.clipBehavior?.value,
      borderRadius: setting.borderRadius?.value,
      elevation: setting.elevation?.value,
      color: setting.color?.value,
      animateColor: setting.animateColor?.value,
      shadowColor: setting.shadowColor?.value,
      animateShadowColor: setting.animateShadowColor?.value,
      curve: setting.curve?.value,
      duration: setting.duration?.value,
    );
  }
}

class AnimatedPhysicalModelSetting {
  final Value<Widget> child;
  final Value<BoxShape> shape;
  final Value<Clip> clipBehavior;
  final Value<BorderRadius> borderRadius;
  final Value<double> elevation;
  final Value<Color> color;
  final Value<bool> animateColor;
  final Value<Color> shadowColor;
  final Value<bool> animateShadowColor;
  final Value<Curve> curve;
  final Value<Duration> duration;

  AnimatedPhysicalModelSetting({
    this.child,
    this.shape,
    this.clipBehavior, // ignore: deprecated_member_use,
    this.borderRadius,
    this.elevation,
    this.color,
    this.animateColor,
    this.shadowColor,
    this.animateShadowColor,
    this.curve,
    this.duration,
  });

  AnimatedPhysicalModelSetting copyWith({
    Value<Widget> child,
    Value<BoxShape> shape,
    Value<Clip> clipBehavior,
    Value<BorderRadius> borderRadius,
    Value<double> elevation,
    Value<Color> color,
    Value<bool> animateColor,
    Value<Color> shadowColor,
    Value<bool> animateShadowColor,
    Value<Curve> curve,
    Value<Duration> duration,
  }) {
    return AnimatedPhysicalModelSetting(
      child: child ?? this.child,
      shape: shape ?? this.shape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      color: color ?? this.color,
      animateColor: animateColor ?? this.animateColor,
      shadowColor: shadowColor ?? this.shadowColor,
      animateShadowColor: animateShadowColor ?? this.animateShadowColor,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}
