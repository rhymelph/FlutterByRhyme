import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:math';

class AnimatedBuilderDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedBuilder';
  final String detail = '''''';

  @override
  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends ExampleState<AnimatedBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimatedBuilderSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    setting = AnimatedBuilderSetting(
        animation: Value(
          value: _controller,
          label: '_controller',
        ),
        child: Value(
          value: Image.asset('images/burgers.jpg'),
          label: "Image.asset('images/burgers.jpg')",
        ),
        builder: Value(
            value: (BuildContext context, Widget child) {
              return new Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            label: '''(BuildContext context, Widget child) {
              return new Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            }'''));
    super.initState();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AnimationController _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
        
AnimatedBuilder(
      animation: ${setting.animation?.label??''},
      builder: ${setting.builder?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(title:'动画启动',onPressed: (){
        _controller.reset();
        _controller.forward();
      },)
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedBuilder';
  }

  @override
  Widget getWidget() {
    return AnimatedBuilder(
      animation: setting.animation?.value,
      builder: setting.builder?.value,
      child: setting.child?.value,
    );
  }
}

class AnimatedBuilderSetting {
  final Value<Listenable> animation;
  final Value<TransitionBuilder> builder;
  final Value<Widget> child;

  AnimatedBuilderSetting({
    this.animation,
    this.builder,
    this.child,
  });

  AnimatedBuilderSetting copyWith({
    final Value<Listenable> animation,
    final Value<TransitionBuilder> builder,
    final Value<Widget> child,
  }) {
    return AnimatedBuilderSetting(
      animation: animation ?? this.animation,
      builder: builder ?? this.builder,
      child: child ?? this.child,
    );
  }
}
