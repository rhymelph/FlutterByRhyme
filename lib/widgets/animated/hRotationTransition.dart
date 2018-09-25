import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RotationTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/RotationTransition';
  final String detail = '''动画小部件的旋转。''';

  @override
  _RotationTransitionDemoState createState() => _RotationTransitionDemoState();
}

class _RotationTransitionDemoState extends ExampleState<RotationTransitionDemo>
    with SingleTickerProviderStateMixin {
  RotationTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    setting = RotationTransitionSetting(
      turns: Value(value: _controller, label: '_controller'),
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
        
RotationTransition(
      turns: ${setting.turns?.label ?? ''},
      child: ${setting.child?.label ?? ''},
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
    return 'RotationTransition';
  }

  @override
  Widget getWidget() {
    return RotationTransition(
      turns: setting.turns?.value,
      child: setting.child?.value,
    );
  }
}

class RotationTransitionSetting {
  final Value<Animation<double>> turns;
  final Value<Widget> child;

  RotationTransitionSetting({
    this.turns,
    this.child,
  });

  RotationTransitionSetting copyWith({
    Value<Animation<double>> turns,
    Value<Widget> child,
  }) {
    return RotationTransitionSetting(
      turns: turns ?? this.turns,
      child: child ?? this.child,
    );
  }
}
