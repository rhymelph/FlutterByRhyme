import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ScaleTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/ScaleTransition';
  final String detail = '动画转换小部件的比例。';

  @override
  _ScaleTransitionDemoState createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends ExampleState<ScaleTransitionDemo>
    with SingleTickerProviderStateMixin {
  ScaleTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    setting = ScaleTransitionSetting(
      scale: Value(value: _controller, label: '_controller'),
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
        
ScaleTransition(
      scale: ${setting.scale?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
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
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget<AlignmentGeometry>(setting.alignment, alignmentValues,
          (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ScaleTransition';
  }

  @override
  Widget getWidget() {
    return ScaleTransition(
      scale: setting.scale?.value,
      alignment: setting.alignment?.value,
      child: setting.child?.value,
    );
  }
}

class ScaleTransitionSetting {
  final Value<Animation<double>> scale;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;

  ScaleTransitionSetting({this.scale, this.alignment, this.child});

  ScaleTransitionSetting copyWith({
    Value<Animation<double>> scale,
    Value<AlignmentGeometry> alignment,
    Value<Widget> child,
  }) {
    return ScaleTransitionSetting(
      scale: scale ?? this.scale,
      alignment: alignment ?? this.alignment,
      child: child ?? this.child,
    );
  }
}
