import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SlideTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/SlideTransition';
  final String detail = '''动画小部件相对于其正常位置的位置。

翻译表示为缩小到孩子大小的偏移量。例如，a 为0.25 的Offsetdx将导致子宽度的四分之一的水平平移。

默认情况下，偏移量应用于画布的坐标系（因此正x偏移将子项向右移动）。如果提供了 textDirection，则在读取方向上应用偏移，因此在从右到左的文本中，正x偏移向左移动，而在从左到右文本中，正x偏移向右移动。''';

  @override
  _SlideTransitionDemoState createState() => _SlideTransitionDemoState();
}

class _SlideTransitionDemoState extends ExampleState<SlideTransitionDemo>
    with SingleTickerProviderStateMixin {
  SlideTransitionSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2));
    setting = SlideTransitionSetting(
      position: Value(
        value: Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(0.5, 0.2),
        ).animate(_controller),
        label: '''Tween<Offset>(
          begin: Offset(0.0, 0.0),
          end: Offset(0.5, 0.2),
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
        
SlideTransition(
      position: ${setting.position?.label ?? ''},
      transformHitTests: ${setting.transformHitTests?.label ?? ''},
      textDirection: ${setting.textDirection?.label ?? ''},
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
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kTransformHitTests,
          value: setting.transformHitTests,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(transformHitTests: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'SlideTransition';
  }

  @override
  Widget getWidget() {
    return SlideTransition(
      position: setting.position?.value,
      transformHitTests: setting.transformHitTests?.value,
      textDirection: setting.textDirection?.value,
      child: setting.child?.value,
    );
  }
}

class SlideTransitionSetting {
  final Value<Animation<Offset>> position;
  final Value<bool> transformHitTests;
  final Value<TextDirection> textDirection;
  final Value<Widget> child;

  SlideTransitionSetting({
    this.position,
    this.transformHitTests,
    this.textDirection,
    this.child,
  });

  SlideTransitionSetting copyWith({
    Value<Animation<Offset>> position,
    Value<bool> transformHitTests,
    Value<TextDirection> textDirection,
    Value<Widget> child,
  }) {
    return SlideTransitionSetting(
      position: position ?? this.position,
      transformHitTests: transformHitTests ?? this.transformHitTests,
      textDirection: textDirection ?? this.textDirection,
      child: child ?? this.child,
    );
  }
}
