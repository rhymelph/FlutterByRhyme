import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class PositionedTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/PositionedTransition';
  final String detail = '''''';

  @override
  _PositionedTransitionDemoState createState() =>
      _PositionedTransitionDemoState();
}

class _PositionedTransitionDemoState
    extends ExampleState<PositionedTransitionDemo>
    with SingleTickerProviderStateMixin {
  PositionedTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    setting = PositionedTransitionSetting(
      rect: Value(
        value: RelativeRectTween(
          begin: RelativeRect.fromLTRB(20.0, 20.0, 200.0, 200.0),
          end: RelativeRect.fromLTRB(0.0, 0.0, 150.0, 150.0),
        ).animate(_controller),
        label: '''RelativeRectTween(
          begin: RelativeRect.fromLTRB(20.0, 20.0, 200.0, 200.0),
          end: RelativeRect.fromLTRB(0.0, 0.0, 150.0, 150.0),
        ).animate(_controller)''',
      ),
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
    );
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
    return '''//vsync: this 需要 with SingleTickerProviderStateMixin
AnimationController _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
        
Stack(
      children: <Widget>[
  PositionedTransition(
      child: ${setting.child?.label ?? ''},
      rect: ${setting.rect?.label ?? ''},
    )
   ],
  )
  
 //动画启动
 _controller.forward();''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: '动画启动',
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'PositionedTransition';
  }

  @override
  Widget getWidget() {
    return Stack(
      children: <Widget>[
        PositionedTransition(
          child: setting.child?.value,
          rect: setting.rect?.value,
        )
      ],
    );
  }
}

class PositionedTransitionSetting {
  final Value<Animation<RelativeRect>> rect;
  final Value<Widget> child;

  PositionedTransitionSetting({
    this.rect,
    this.child,
  });

  PositionedTransitionSetting copyWith({
    Value<Animation<RelativeRect>> rect,
    Value<Widget> child,
  }) {
    return PositionedTransitionSetting(
      rect: rect ?? this.rect,
      child: child ?? this.child,
    );
  }
}
