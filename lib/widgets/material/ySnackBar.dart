import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SnackBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/SnackBar';
  final String detail = '''带有可选操作的轻量级消息，短暂显示在屏幕底部。

要显示小吃店，请致电Scaffold.of(context).showSnackBar()，传递描述消息的SnackBar实例。

要控制SnackBar保持可见的时间，请指定持续时间。

启用TalkBack或VoiceOver时，带有操作的SnackBar不会超时。这由AccessibilityFeatures.accessibleNavigation控制。''';

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends ExampleState<SnackBarDemo> {
  SnackBarSetting setting;

  @override
  void initState() {
    setting = new SnackBarSetting(
        content: Value(
          value: Text('This is a SnackBar'),
          label: "Text('This is a SnackBar')",
        ),
        duration: durationValues[0],
        action: Value(
          value: SnackBarAction(
            label: 'hello',
            onPressed: () {
              //click the action
            },
          ),
          label: '''SnackBarAction(
            label: 'hello',
            onPressed: () {
              //click the action
            },
          )''',
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
    return '''FlatButton(
        onPressed: () {
        //scaffoldkey is Scaffold Key
          scaffoldKey.currentState.showSnackBar(getSnackBar());
        },
        child: Text('Show SnackBar'),
      )
      
Widget getSnackBar() {
    return SnackBar(
      content: ${setting.content?.label??''},
      backgroundColor: ${setting.backgroundColor?.label??''},
      action: ${setting.action?.label??''},
      duration: ${setting.duration?.label??''},
      animation: ${setting.animation?.label??''},
    );
  }''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value){
        setState(() {
          setting=setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),

    ];
  }

  @override
  String getTitle() {
    return 'SnackBar';
  }

  Widget getSnackBar() {
    return SnackBar(
      content: setting.content?.value,
      backgroundColor: setting.backgroundColor?.value,
      action: setting.action?.value,
      duration: setting.duration?.value,
      animation: setting.animation?.value,
    );
  }

  @override
  Widget getWidget() {
    return Center(
      child: FlatButton(
        onPressed: () {
          scaffoldKey.currentState.showSnackBar(getSnackBar());
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}

class SnackBarSetting {
  final Value<Widget> content;
  final Value<Color> backgroundColor;
  final Value<SnackBarAction> action;
  final Value<Duration> duration;
  final Value<Animation<double>> animation;

  SnackBarSetting(
      {this.content,
      this.backgroundColor,
      this.action,
      this.duration,
      this.animation});

  SnackBarSetting copyWith({
    Value<Widget> content,
    Value<Color> backgroundColor,
    Value<SnackBarAction> action,
    Value<Duration> duration,
    Value<Animation<double>> animation,
  }) {
    return SnackBarSetting(
      content: content ?? this.content,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      action: action ?? this.action,
      duration: duration ?? this.duration,
      animation: animation ?? this.animation,
    );
  }
}
