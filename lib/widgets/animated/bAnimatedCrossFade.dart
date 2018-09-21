import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedCrossFade';
  final String detail = '''''';

  @override
  _AnimatedCrossFadeDemoState createState() =>
      _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends ExampleState<AnimatedCrossFadeDemo> {
  AnimatedCrossFadeSetting setting;

  @override
  void initState() {
    setting = AnimatedCrossFadeSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'AnimatedCrossFade';
  }


  @override
  Widget getWidget() {
    return AnimatedCrossFade(
      secondChild: null, duration: null, firstChild: null, crossFadeState: null,
    );
  }
}

class AnimatedCrossFadeSetting {

//  AnimatedCrossFadeSetting
//  (
//  {
//});
//
//AnimatedCrossFadeSetting copyWith
//(
//{})
//{
//return AnimatedCrossFadeSetting(
//);
//}
}
