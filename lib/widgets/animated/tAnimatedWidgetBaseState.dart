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
    setting = AnimatedWidgetBaseStateSetting();
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
    return 'AnimatedWidgetBaseState';
  }


  @override
  Widget getWidget() {
    return AnimatedCircle();
  }
}

class AnimatedWidgetBaseStateSetting {

//  AnimatedWidgetBaseStateSetting({
//  });
//
//  AnimatedWidgetBaseStateSetting copyWith({
//  }) {
//    return AnimatedWidgetBaseStateSetting(
//    );
//  }
}

class AnimatedCircle extends ImplicitlyAnimatedWidget{
  @override
  _AnimatedCircleState createState() =>_AnimatedCircleState();


}

class _AnimatedCircleState extends AnimatedWidgetBaseState<AnimatedCircle>{

  @override
  Widget build(BuildContext context) {
  }

  @override
  void forEachTween(TweenVisitor visitor) {
  }

}