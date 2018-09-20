import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoNavigationBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoNavigationBar';
  final String detail = '''OS风格的导航栏。

导航栏是一个工具栏，最小程度上由工具栏中间的小部件组成，通常是页面标题。

它还支持中间窗口小部件之前和之后的前导和尾随窗口 小部件，同时保持中间窗口小部件居中。

在领先的部件会自动为回字形图标按钮（或者在全屏对话的情况下，关闭按钮），弹出当前路由。如果没有提供，并automaticallyImplyLeading是真（默认为true）。

该中间部件会自动从目前的路线的标题文字。如果没有提供，并automaticallyImplyMiddle是真（默认为true）。

它应放在屏幕顶部，并自动记录操作系统的状态栏。

如果给定的backgroundColor的不透明度不是1.0（默认情况下是这种情况），它将对其后面的内容产生模糊效果。''';

  @override
  _CupertinoNavigationBarDemoState createState() =>
      _CupertinoNavigationBarDemoState();
}

class _CupertinoNavigationBarDemoState
    extends ExampleState<CupertinoNavigationBarDemo> {
  CupertinoNavigationBarSetting setting;

  @override
  void initState() {
    setting = CupertinoNavigationBarSetting(
      automaticallyImplyLeading: boolValues[1],
      backgroundColor: colorValues[1],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoNavigationBar(
        leading: ${setting.leading?.label ?? ''},
        automaticallyImplyLeading: ${setting.automaticallyImplyLeading?.label ?? ''},
        middle: Text(${setting.middle?.label ?? "''"}),
        trailing: ${setting.trailing?.label ?? ''},
        border: ${setting.border?.label ?? ''},
        backgroundColor: ${setting.backgroundColor?.label ?? ''},
        padding: ${setting.padding?.label ?? ''},
        actionsForegroundColor: ${setting.actionsForegroundColor?.label ?? ''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kSave,
        onPressed: () {
          Navigator.pop(
              context,
              Value<ObstructingPreferredSizeWidget>(
                name: 'AppBar',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ValueTitleWidget(StringParams.kLeading),
      RadioGroupWidget(setting.leading, iconValues, (value) {
        setState(() {
          setting = setting.copyWith(leading: value);
        });
      }),
      ValueTitleWidget('trailing'),
      RadioGroupWidget(setting.trailing, iconValues, (value) {
        setState(() {
          setting = setting.copyWith(trailing: value);
        });
      }),
      ValueTitleWidget('border'),
      RadioGroupWidget(setting.border, borderValues, (value) {
        setState(() {
          setting = setting.copyWith(border: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, iosPaddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kActionsForegroundColor),
      ColorGroupWidget(setting.actionsForegroundColor, (value) {
        setState(() {
          setting = setting.copyWith(actionsForegroundColor: value);
        });
      }),
      EditTextTitleWidget(StringParams.kMiddle, setting.middle, (value) {
        setState(() {
          setting = setting.copyWith(middle: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kAutomaticallyImplyLeading,
          value: setting.automaticallyImplyLeading,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(automaticallyImplyLeading: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoNavigationBar';
  }

  @override
  Widget getWidget() {
    return CupertinoPageScaffold(
      navigationBar: returnWidget(),
      child: Center(
        child: Text('Body'),
      ),
    );
  }

  returnWidget() {
    return CupertinoNavigationBar(
      leading: setting.leading?.value,
      automaticallyImplyLeading: setting.automaticallyImplyLeading?.value,
      middle: Text(setting.middle?.value ?? ''),
      trailing: setting.trailing?.value,
      border: setting.border?.value,
      backgroundColor: setting.backgroundColor?.value,
//      padding: setting.padding?.value,
      actionsForegroundColor: setting.actionsForegroundColor?.value,
    );
  }
}

class CupertinoNavigationBarSetting {
  final Value<Widget> leading;
  final Value<bool> automaticallyImplyLeading;
  final Value<String> middle;
  final Value<Widget> trailing;
  final Value<Border> border;
  final Value<Color> backgroundColor;
  final Value<EdgeInsetsDirectional> padding;
  final Value<Color> actionsForegroundColor;

  CupertinoNavigationBarSetting({
    this.leading,
    this.automaticallyImplyLeading,
    this.middle,
    this.trailing,
    this.border,
    this.backgroundColor,
    this.padding,
    this.actionsForegroundColor,
  });

  CupertinoNavigationBarSetting copyWith({
    Value<Widget> leading,
    Value<bool> automaticallyImplyLeading,
    Value<String> middle,
    Value<Widget> trailing,
    Value<Border> border,
    Value<Color> backgroundColor,
    Value<EdgeInsetsDirectional> padding,
    Value<Color> actionsForegroundColor,
  }) {
    return CupertinoNavigationBarSetting(
      leading: leading ?? this.leading,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      middle: middle ?? this.middle,
      trailing: trailing ?? this.trailing,
      border: border ?? this.border,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      actionsForegroundColor:
          actionsForegroundColor ?? this.actionsForegroundColor,
    );
  }
}
