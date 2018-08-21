import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoNavigationBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoNavigationBar';
  final String detail = '''An iOS-styled navigation bar.
The navigation bar is a toolbar that minimally consists of a widget, normally a page title, in the middle of the toolbar.
It also supports a leading and trailing widget before and after the middle widget while keeping the middle widget centered.
The leading widget will automatically be a back chevron icon button (or a close button in case of a fullscreen dialog) to pop the current route if none is provided and automaticallyImplyLeading is true (true by default).
It should be placed at top of the screen and automatically accounts for the OS's status bar.
If the given backgroundColor's opacity is not 1.0 (which is the case by default), it will produce a blurring effect to the content behind it.
See also:
CupertinoPageScaffold, a page layout helper typically hosting the CupertinoNavigationBar.
CupertinoSliverNavigationBar for a navigation bar to be placed in a scrolling list and that supports iOS-11-style large titles.''';

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
