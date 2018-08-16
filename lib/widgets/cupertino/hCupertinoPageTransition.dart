import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:async';
class CupertinoPageTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoPageTransition';
  final String detail = '''''';

  @override
  _CupertinoPageTransitionDemoState createState() =>
      _CupertinoPageTransitionDemoState();
}

class _CupertinoPageTransitionDemoState
    extends ExampleState<CupertinoPageTransitionDemo>
with TickerProviderStateMixin{
  CupertinoPageTransitionSetting setting;

  @override
  void initState() {
    AnimationController controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
//    controller.forward(from: 1.0);
    controller.reverse(from: 1.0);
    setting = CupertinoPageTransitionSetting(
      child: Value(
        value: Text('This is CupertinoPageTransition'),
        label: "Text('This is CupertinoPageTransition')",
      ),
      primaryRouteAnimation:Value(
        value:  controller,
      ),
      secondaryRouteAnimation: Value(
        value:  controller,
      ),
      linearTransition: boolValues[0],
    );
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
    return 'CupertinoPageTransition';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoPageTransition(
        primaryRouteAnimation: setting.primaryRouteAnimation?.value,
        secondaryRouteAnimation: setting.secondaryRouteAnimation?.value,
        child: setting.child?.value,
        linearTransition: setting.linearTransition?.value,
      ),
    );
  }
}

class CupertinoPageTransitionSetting {
  final Value<Animation<double>> primaryRouteAnimation;
  final Value<Animation<double>> secondaryRouteAnimation;
  final Value<Widget> child;
  final Value<bool> linearTransition;

  CupertinoPageTransitionSetting({
    this.primaryRouteAnimation,
    this.secondaryRouteAnimation,
    this.child,
    this.linearTransition,
  });

  CupertinoPageTransitionSetting copyWith({
    Value<Animation<double>> primaryRouteAnimation,
    Value<Animation<double>> secondaryRouteAnimation,
    Value<Widget> child,
    Value<bool> linearTransition,
  }) {
    return CupertinoPageTransitionSetting(
      primaryRouteAnimation:
          primaryRouteAnimation ?? this.primaryRouteAnimation,
      secondaryRouteAnimation:
          secondaryRouteAnimation ?? this.secondaryRouteAnimation,
      child: child ?? this.child,
      linearTransition: linearTransition ?? this.linearTransition,
    );
  }
}

class PrimaryAnimationController extends Animation<double>{
  double _value=0.0;
  AnimationStatus _status=AnimationStatus.forward;
  @override//每当有值发生改变时会监听
  void addListener(VoidCallback listener) {
    print('add');
  }
  @override //动画状态发生改变时会监听
  void addStatusListener(AnimationStatusListener listener) {
    print('addStatus');
  }
  @override//移除值监听时会监听
  void removeListener(VoidCallback listener) {
    print('remove');
  }
  @override//移除动画状态时会监听
  void removeStatusListener(AnimationStatusListener listener) {
    print('removeStatus');
  }
  @override
  AnimationStatus get status => _status;
  @override
  double get value => _value;
}

class SecondaryRouteAnimationController extends Animation<double>{
  double _value=0.0;
  AnimationStatus _status=AnimationStatus.forward;
  @override//每当有值发生改变时会监听
  void addListener(VoidCallback listener) {
    print('add');
  }
  @override //动画状态发生改变时会监听
  void addStatusListener(AnimationStatusListener listener) {
    print('addStatus');
  }
  @override//移除值监听时会监听
  void removeListener(VoidCallback listener) {
    print('remove');
  }
  @override//移除动画状态时会监听
  void removeStatusListener(AnimationStatusListener listener) {
    print('removeStatus');
  }
  @override
  AnimationStatus get status => _status;
  @override
  double get value => _value;
}
