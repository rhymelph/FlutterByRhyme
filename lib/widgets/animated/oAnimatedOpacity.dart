import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedOpacity';
  final String detail = '''不透明度的动画版本，只要给定的不透明度发生变化，就会自动转换孩子在给定持续时间内的不透明度。

动画不透明度相对昂贵，因为它需要将子画面绘制到中间缓冲区中。''';

  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends ExampleState<AnimatedOpacityDemo> {
  AnimatedOpacitySetting setting;

  @override
  void initState() {
    setting = AnimatedOpacitySetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      opacity: doubleOneValues[1],
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
    return '''AnimatedOpacity(
      child: ${setting.child?.label ?? ''},
      opacity: ${setting.opacity?.label ?? ''},
      curve: ${setting.curve?.label ?? ''},
      duration: ${setting.duration?.label ?? ''},
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

      ValueTitleWidget(StringParams.kOpacity),
      SeekBarGroupWidget(setting.opacity, (value){
        setState(() {
          setState(() {
            setting = setting.copyWith(opacity: value);
          });
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedOpacity';
  }

  @override
  Widget getWidget() {
    return AnimatedOpacity(
      child: setting.child?.value,
      opacity: setting.opacity?.value,
      curve: setting.curve?.value,
      duration: setting.duration?.value,
    );
  }
}

class AnimatedOpacitySetting {
  final Value<Widget> child;
  final Value<double> opacity;
  final Value<Curve> curve;
  final Value<Duration> duration;

  AnimatedOpacitySetting({
    this.child,
    this.opacity,
    this.curve,
    this.duration,
  });

  AnimatedOpacitySetting copyWith({
    Value<Widget> child,
    Value<double> opacity,
    Value<Curve> curve,
    Value<Duration> duration,
  }) {
    return AnimatedOpacitySetting(
      child: child ?? this.child,
      opacity: opacity ?? this.opacity,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}
