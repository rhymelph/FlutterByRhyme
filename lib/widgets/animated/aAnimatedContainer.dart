import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedContainerDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedContainer';
  final String detail = '''在一段时间内逐渐更改其值的容器。

使用提供的曲线和持续时间更改时，AnimatedContainer将在属性的旧值和新值之间自动设置动画。null的属性不是动画。

此类对于使用其内部AnimationController在Container的不同参数之间生成简单的隐式转换非常有用。对于更复杂的动画，您可能希望使用AnimatedWidget的子类， 例如DecoratedBoxTransition或使用您自己的 AnimationController。''';

  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends ExampleState<AnimatedContainerDemo> {
  AnimatedContainerSetting setting;

  @override
  void initState() {
    setting = AnimatedContainerSetting(
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
    return '''AnimatedContainer(
        curve: ${setting.curve?.label??''},
        duration: ${setting.duration?.label??''},
        alignment: ${setting.alignment?.label??''},
        padding: ${setting.padding?.label??''},
        color: ${setting.color?.label??''},
        decoration: ${setting.decoration?.label??''},
        foregroundDecoration: ${setting.foregroundDecoration?.label??''},
        margin: ${setting.margin?.label??''},
        transform: ${setting.transform?.label??''},
        child: Text('Container.child'))''';
  }

  @override
  List<Widget> getSetting() {
    return <Widget>[
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value){
        setState(() {
          setting=setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kCurve),
      RadioGroupWidget(setting.curve, curveValues, (value){
        setState(() {
          setting=setting.copyWith(curve: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget<AlignmentGeometry>(
          setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget<EdgeInsetsGeometry>(setting.padding, paddingValues,
              (value) {
            setState(() {
              setting = setting.copyWith(padding: value);
            });
          }),
      ValueTitleWidget(StringParams.kMargin),
      RadioGroupWidget<EdgeInsetsGeometry>(setting.margin, marginValues, (value) {
        setState(() {
          setting = setting.copyWith(margin: value);
        });
      }),
      ValueTitleWidget(StringParams.kTransform),
      RadioGroupWidget<Matrix4>(setting.transform, transformValues, (value) {
        setState(() {
          setting = setting.copyWith(transform: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
        if (setting.decoration != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(color: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kDecoration),
      DecorationGroupWidget(setting.decoration, decorationValues, (value) {
        if (setting.color != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(decoration: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kForegroundDecoration),
      DecorationGroupWidget(
          setting.foregroundDecoration, foregroundDecorationValues, (value) {
        setState(() {
          setting = setting.copyWith(foregroundDecoration: value);
        });
      }),
    ];
  }

  void _showSyncSelectTip() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Only can select color or decoration !\n颜色，装饰只能选中一个!')));
  }
  @override
  String getTitle() {
    return 'AnimatedContainer';
  }

  @override
  Widget getWidget() {
    return AnimatedContainer(
        curve: setting.curve?.value,
        duration: setting.duration?.value,
        alignment: setting.alignment?.value,
        padding: setting.padding?.value,
        color: setting.color?.value,
        decoration: setting.decoration?.value,
        foregroundDecoration: setting.foregroundDecoration?.value,
        margin: setting.margin?.value,
        transform: setting.transform?.value,
        child: Text('Container.child'));
  }
}

class AnimatedContainerSetting {
  final Value<Curve> curve;
  final Value<Duration> duration;
  final Value<AlignmentGeometry> alignment;
  final Value<Color> color;
  final Value<EdgeInsetsGeometry> padding;
  final Value<Decoration> decoration;
  final Value<Decoration> foregroundDecoration;
  final Value<EdgeInsetsGeometry> margin;
  final Value<Matrix4> transform;

  AnimatedContainerSetting(
      {this.curve,
      this.duration,
      this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.margin,
      this.transform});

  AnimatedContainerSetting copyWith(
      {Value<Duration> duration,
      Value<Curve> curve,
      Value<AlignmentGeometry> alignment,
      Value<Color> color,
      Value<EdgeInsetsGeometry> padding,
      Value<Decoration> decoration,
      Value<Decoration> foregroundDecoration,
      Value<EdgeInsetsGeometry> margin,
      Value<Matrix4> transform}) {
    return AnimatedContainerSetting(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
    );
  }
}
