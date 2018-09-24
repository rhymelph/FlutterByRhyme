import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedCrossFade';
  final String detail = '''一个小部件，它在两个给定的子节点之间交叉淡化，并在它们的大小之间设置动画。

动画通过crossFadeState参数控制。 firstCurve和secondCurve表示两个孩子的不透明度曲线。该firstCurve反转，即它提供像一个成长曲线时淡出Curves.linear。所述sizeCurve是所使用的淡出孩子的尺寸和衰落式儿童的尺寸之间的动画曲线。

此小部件旨在用于淡化具有相同宽度的一对小部件。在两个孩子具有不同高度的情况下，动画通过对齐他们的顶部边缘在动画期间使儿童溢出，这意味着底部将被剪裁。

当使用不同的crossFadeState属性值重建 现有AnimatedCrossFade时，将自动触发 动画。''';

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends ExampleState<AnimatedCrossFadeDemo> {
  AnimatedCrossFadeSetting setting;

  @override
  void initState() {
    setting = AnimatedCrossFadeSetting(
      firstChild: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      secondChild: Value(
          value: Image.asset('images/pazzer.jpg'),
          label: "Image.asset('images/pazzer.jpg')"),
      firstCurve: curveValues[0],
      secondCurve: curveValues[0],
      sizeCurve: curveValues[0],
      alignment: alignmentValues[0],
      duration: durationValues[0],
      crossFadeState: crossFadeStateValues[0],
      layoutBuilder: Value(
        value: (Widget topChild, Key topChildKey, Widget bottomChild,
            Key bottomChildKey) {
          return new Stack(
            fit: StackFit.loose,
            children: <Widget>[
              new Positioned(
                key: bottomChildKey,
                left: 0.0,
                right: 0.0,
                child: bottomChild,
              ),
              new Positioned(
                left: 0.0,
                right: 0.0,
                key: topChildKey,
                child: topChild,
              )
            ],
          );
        },
        label: '''(Widget topChild, Key topChildKey, Widget bottomChild,
            Key bottomChildKey) {
            //top为firstChild ,bottom为secondchild
          return new Stack(
            fit: StackFit.loose,
            children: <Widget>[
              new Positioned(
                key: bottomChildKey,
                left: 0.0,
                right: 0.0,
                child: bottomChild,
              ),
              new Positioned(
                left: 0.0,
                right: 0.0,
                key: topChildKey,
                child: topChild,
              )
            ],
          );
        }''',

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
    return '''AnimatedCrossFade(
      firstChild: ${setting.firstChild?.label ?? ''},
      firstCurve: ${setting.firstCurve?.label ?? ''},
      secondChild: ${setting.secondChild?.label ?? ''},
      secondCurve: ${setting.secondCurve?.label ?? ''},
      sizeCurve: ${setting.sizeCurve?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
      duration: ${setting.duration?.label ?? ''},
      crossFadeState: ${setting.crossFadeState?.label ?? ''},
      layoutBuilder: ${setting?.layoutBuilder?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kCrossFadeState),
      RadioGroupWidget(setting.crossFadeState, crossFadeStateValues, (value) {
        setState(() {
          setting = setting.copyWith(crossFadeState: value);
        });
      }),
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value) {
        setState(() {
          setting = setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kFirstCurve),
      RadioGroupWidget(setting.firstCurve, curveValues, (value) {
        setState(() {
          setting = setting.copyWith(firstCurve: value);
        });
      }),
      ValueTitleWidget(StringParams.kSecondCurve),
      RadioGroupWidget(setting.secondCurve, curveValues, (value) {
        setState(() {
          setting = setting.copyWith(secondCurve: value);
        });
      }),
      ValueTitleWidget(StringParams.kSizeCurve),
      RadioGroupWidget(setting.sizeCurve, curveValues, (value) {
        setState(() {
          setting = setting.copyWith(sizeCurve: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedCrossFade';
  }

  @override
  Widget getWidget() {
    return AnimatedCrossFade(
      firstChild: setting.firstChild?.value,
      firstCurve: setting.firstCurve?.value,
      secondCurve: setting.secondCurve?.value,
      secondChild: setting.secondChild?.value,
      sizeCurve: setting.sizeCurve?.value,
      alignment: setting.alignment?.value,
      layoutBuilder: setting?.layoutBuilder?.value,
      duration: setting.duration?.value,
      crossFadeState: setting.crossFadeState?.value,
    );
  }
}

class AnimatedCrossFadeSetting {
  final Value<Widget> firstChild;
  final Value<Widget> secondChild;
  final Value<Curve> firstCurve;
  final Value<Curve> secondCurve;
  final Value<Curve> sizeCurve;
  final Value<AlignmentGeometry> alignment;
  final Value<CrossFadeState> crossFadeState;
  final Value<Duration> duration;
  final Value<AnimatedCrossFadeBuilder> layoutBuilder;

  AnimatedCrossFadeSetting({
    this.firstChild,
    this.secondChild,
    this.firstCurve,
    this.secondCurve,
    this.sizeCurve,
    this.alignment,
    this.crossFadeState,
    this.duration,
    this.layoutBuilder,
  });

  AnimatedCrossFadeSetting copyWith({
    Value<Widget> firstChild,
    Value<Widget> secondChild,
    Value<Curve> firstCurve,
    Value<Curve> secondCurve,
    Value<Curve> sizeCurve,
    Value<AlignmentGeometry> alignment,
    Value<CrossFadeState> crossFadeState,
    Value<Duration> duration,
    Value<AnimatedCrossFadeBuilder> layoutBuilder,
  }) {
    return AnimatedCrossFadeSetting(
      firstCurve: firstCurve ?? this.firstCurve,
      firstChild: firstChild ?? this.firstChild,
      secondChild: secondChild ?? this.secondChild,
      secondCurve: secondCurve ?? this.secondCurve,
      sizeCurve: sizeCurve ?? this.sizeCurve,
      alignment: alignment ?? this.alignment,
      crossFadeState: crossFadeState ?? this.crossFadeState,
      duration: duration ?? this.duration,
      layoutBuilder: layoutBuilder ?? this.layoutBuilder,
    );
  }
}
