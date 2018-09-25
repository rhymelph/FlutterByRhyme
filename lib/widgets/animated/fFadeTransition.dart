import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FadeTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/FadeTransition';
  final String detail = '''''';

  @override
  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends ExampleState<FadeTransitionDemo>
    with SingleTickerProviderStateMixin {
  FadeTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    setting = FadeTransitionSetting(
      opacity: Value(
        value: _controller,
        label: '_controller',
      ),
      alwaysIncludeSemantics: boolValues[0],
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
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
    return '''//vsync: this 需要 with SingleTickerProviderStateMixin
AnimationController _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
        
FadeTransition(
      opacity: ${setting.opacity?.label ?? ''},
      alwaysIncludeSemantics: ${setting.alwaysIncludeSemantics?.label ?? ''},
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
      SwitchValueTitleWidget(
          title: StringParams.kAlwaysIncludeSemantics,
          value: setting.alwaysIncludeSemantics,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(alwaysIncludeSemantics: value);
            });
          })
    ];
  }

  @override
  String getTitle() {
    return 'FadeTransition';
  }

  @override
  Widget getWidget() {
    return FadeTransition(
      opacity: setting.opacity?.value,
      alwaysIncludeSemantics: setting.alwaysIncludeSemantics?.value,
      child: setting.child?.value,
    );
  }
}

class FadeTransitionSetting {
  final Value<Animation<double>> opacity;
  final Value<bool> alwaysIncludeSemantics;
  final Value<Widget> child;

  FadeTransitionSetting({
    this.opacity,
    this.alwaysIncludeSemantics,
    this.child,
  });

  FadeTransitionSetting copyWith({
    Value<Animation<double>> opacity,
    Value<bool> alwaysIncludeSemantics,
    Value<Widget> child,
  }) {
    return FadeTransitionSetting(
      opacity: opacity ?? this.opacity,
      alwaysIncludeSemantics:
          alwaysIncludeSemantics ?? this.alwaysIncludeSemantics,
      child: child ?? this.child,
    );
  }
}
