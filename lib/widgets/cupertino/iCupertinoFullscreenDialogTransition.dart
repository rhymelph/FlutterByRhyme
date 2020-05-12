import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoFullscreenDialogTransitionDemo extends StatefulWidget {
  static const String routeName =
      'widgets/cupertino/CupertinoFullscreenDialogTransition';
  final String detail = '''用于召唤全屏对话框的iOS风格转换。

例如，通过从底部引入下一个屏幕来创建新日历事件时使用。''';

  @override
  _CupertinoFullscreenDialogTransitionDemoState createState() =>
      _CupertinoFullscreenDialogTransitionDemoState();
}

class _CupertinoFullscreenDialogTransitionDemoState
    extends ExampleState<CupertinoFullscreenDialogTransitionDemo> {
  CupertinoFullscreenDialogTransitionSetting setting;

  @override
  void initState() {
    setting = CupertinoFullscreenDialogTransitionSetting(
        primaryRouteAnimation: Value(
          value: kAlwaysCompleteAnimation,
          label: 'kAlwaysCompleteAnimation',
        ),
        secondaryRouteAnimation: Value(
          value: kAlwaysCompleteAnimation,
          label: 'kAlwaysCompleteAnimation',
        ),
        linearTransition: Value<bool>(
          name: 'true',
          value: true,
          label: 'true',
        ),
        child: Value(
          value: Text('FullscreenDialog'),
          label: "Text('FullscreenDialog')",
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoFullscreenDialogTransition(
        secondaryRouteAnimation: ${setting.secondaryRouteAnimation?.label ?? ''},
        primaryRouteAnimation: ${setting.primaryRouteAnimation?.label ?? ''},
        linearTransition: ${setting.linearTransition?.label ?? ''},
        child: ${setting.child?.label ?? ''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'CupertinoFullscreenDialogTransition';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoFullscreenDialogTransition(
        secondaryRouteAnimation: setting.secondaryRouteAnimation?.value,
        primaryRouteAnimation: setting.primaryRouteAnimation?.value,
        linearTransition: setting.linearTransition?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class CupertinoFullscreenDialogTransitionSetting {
  final Value<Animation<double>> secondaryRouteAnimation;
  final Value<Animation<double>> primaryRouteAnimation;
  final Value<bool> linearTransition;
  final Value<Widget> child;

  CupertinoFullscreenDialogTransitionSetting(
      {this.secondaryRouteAnimation,
      this.primaryRouteAnimation,
      this.linearTransition,
      this.child});

  CupertinoFullscreenDialogTransitionSetting copyWith({
    Value<Animation<double>> secondaryRouteAnimation,
    Value<Animation<double>> primaryRouteAnimation,
    bool linearTransition,
    Value<Widget> child,
  }) {
    return CupertinoFullscreenDialogTransitionSetting(
      secondaryRouteAnimation:
          secondaryRouteAnimation ?? this.secondaryRouteAnimation,
      primaryRouteAnimation:
          primaryRouteAnimation ?? this.primaryRouteAnimation,
      linearTransition: linearTransition ?? this.linearTransition,
      child: child ?? this.child,
    );
  }
}
