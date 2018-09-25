import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SizeTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/SizeTransition';
  final String detail = '''动画自己的大小和剪辑并对齐其孩子。

SizeTransition充当ClipRect，根据轴的值激活其宽度或高度。子轴沿轴的对齐由axisAlignment指定。

像大多数小部件一样，SizeTransition将符合它给出的约束，所以一定要把它放在可以改变大小的上下文中。例如，如果将它放入具有固定大小的Container中，则 SizeTransition将无法更改大小，并且似乎什么都不做。''';

  @override
  _SizeTransitionDemoState createState() => _SizeTransitionDemoState();
}

class _SizeTransitionDemoState extends ExampleState<SizeTransitionDemo>
  with SingleTickerProviderStateMixin{
  SizeTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    setting = SizeTransitionSetting(
      sizeFactor: Value(value: _controller, label: '_controller'),
      axis: axisValues[0],
      axisAlignment: doubleMiniValues[0],
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
        
Center(
      child: SizeTransition(
        sizeFactor: ${setting.sizeFactor?.label??''},
        axis: ${setting.axis?.label??''},
        axisAlignment: ${setting.axisAlignment?.label??''},
        child: ${setting.child?.label??''},
      ),
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
      ValueTitleWidget(StringParams.kAxis),
      RadioGroupWidget(setting.axis, axisValues, (value) {
        setState(() {
          setting = setting.copyWith(axis: value);
        });
      }),
      DropDownValueTitleWidget<double>(
        title: StringParams.kAlignment,
        selectList: doubleMiniValues,
        value: setting.axisAlignment,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(axisAlignment: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'SizeTransition';
  }

  @override
  Widget getWidget() {
    return Center(
      child: SizeTransition(
        sizeFactor: setting.sizeFactor?.value,
        axis: setting.axis?.value,
        axisAlignment: setting.axisAlignment?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class SizeTransitionSetting {
  final Value<Animation<double>> sizeFactor;
  final Value<Axis> axis;
  final Value<double> axisAlignment;
  final Value<Widget> child;

  SizeTransitionSetting({
    this.axis,
    this.sizeFactor,
    this.axisAlignment,
    this.child,
  });

  SizeTransitionSetting copyWith({
    Value<Animation<double>> sizeFactor,
    Value<Axis> axis,
    Value<double> axisAlignment,
    Value<Widget> child,
  }) {
    return SizeTransitionSetting(
      sizeFactor: sizeFactor ?? this.sizeFactor,
      axis: axis ?? this.axis,
      axisAlignment: axisAlignment ?? this.axisAlignment,
      child: child ?? this.child,
    );
  }
}
