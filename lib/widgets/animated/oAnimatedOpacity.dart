import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedOpacity';
  final String detail = '';

  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends ExampleState<AnimatedOpacityDemo> {
  AnimatedOpacitySetting setting;

  @override
  void initState() {
    setting = AnimatedOpacitySetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [];
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
      child: child??this.child,
      opacity: opacity??this.opacity,
      curve: curve??this.curve,
      duration: duration??this.duration,
    );
  }
}
