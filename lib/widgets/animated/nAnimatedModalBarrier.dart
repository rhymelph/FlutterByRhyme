import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedModalBarrierDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedModalBarrier';
  final String detail = '''一个小部件，可以防止用户与自身后面的小部件交互，并且可以使用动画颜色值进行配置。

模态屏障是在每条路线后面呈现的稀松布，这通常会阻止用户与当前路线下方的路线交互，并且通常部分遮挡这些路线。

例如，当屏幕上出现对话框时，对话框下方的页面通常会被模态屏障变暗。

此小部件类似于ModalBarrier，除了它采用动画 颜色而不是单个颜色。''';

  @override
  _AnimatedModalBarrierDemoState createState() =>
      _AnimatedModalBarrierDemoState();
}

class _AnimatedModalBarrierDemoState
    extends ExampleState<AnimatedModalBarrierDemo>
    with SingleTickerProviderStateMixin {
  AnimatedModalBarrierSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    setting = AnimatedModalBarrierSetting(
        barrierSemanticsDismissible: boolValues[0],
        dismissible: boolValues[0],
        semanticsLabel: Value(
          value: 'AnimatedModalBarrier',
          label: 'AnimatedModalBarrier',
        ),
        color: Value(
          value: ColorTween(
            begin: Colors.transparent,
            end: Colors.green.withOpacity(0.5),
          ).animate(_controller),
          label: '''ColorTween(
            begin: Colors.transparent,
            end: Colors.green.withOpacity(0.5),
          ).animate(_controller)''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Stack(
      children: <Widget>[
        Center(
          child: FlatButton(
              onPressed: () {
                //showToast('Hello World!');
              },
              child: Text('Click Me')),
        ),
        AnimatedModalBarrier(
          color: ${setting.color?.label??''},
          dismissible: ${setting.dismissible?.label??''},
          semanticsLabel: "${setting.semanticsLabel?.label??''}",
          barrierSemanticsDismissible:
              ${setting.barrierSemanticsDismissible?.label??''},
        ),
      ],
    )''';
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
          title: StringParams.kDismissible,
          value: setting.dismissible,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(dismissible: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kBarrierSemanticsDismissible,
          value: setting.barrierSemanticsDismissible,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(barrierSemanticsDismissible: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedModalBarrier';
  }

  @override
  Widget getWidget() {
    return Stack(
      children: <Widget>[
        Center(
          child: FlatButton(
              onPressed: () {
                exampleKey.currentState.showToast('Hello World!');
              },
              child: Text('Click Me')),
        ),
        AnimatedModalBarrier(
          color: setting.color?.value,
          dismissible: setting.dismissible?.value,
          semanticsLabel: setting.semanticsLabel?.value,
          barrierSemanticsDismissible:
              setting.barrierSemanticsDismissible?.value,
        ),
      ],
    );
  }
}

class AnimatedModalBarrierSetting {
  final Value<Animation<Color>> color;
  final Value<bool> dismissible;
  final Value<String> semanticsLabel;
  final Value<bool> barrierSemanticsDismissible;

  AnimatedModalBarrierSetting({
    this.color,
    this.dismissible,
    this.semanticsLabel,
    this.barrierSemanticsDismissible,
  });

  AnimatedModalBarrierSetting copyWith({
    Value<Animation<Color>> color,
    Value<bool> dismissible,
    Value<String> semanticsLabel,
    Value<bool> barrierSemanticsDismissible,
  }) {
    return AnimatedModalBarrierSetting(
      color: color ?? this.color,
      dismissible: dismissible ?? this.dismissible,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      barrierSemanticsDismissible:
          barrierSemanticsDismissible ?? this.barrierSemanticsDismissible,
    );
  }
}
