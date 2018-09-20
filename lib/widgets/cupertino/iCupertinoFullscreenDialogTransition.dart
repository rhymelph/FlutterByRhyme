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
      animation: Value(
        value: kAlwaysCompleteAnimation,
        label: 'kAlwaysCompleteAnimation',
      ),
      child: Value(
        value: Text('FullscreenDialog'),
        label: "Text('FullscreenDialog')",
      )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoFullscreenDialogTransition(
        animation: ${setting.animation?.label??''},
        child: ${setting.child?.label??''},
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
        animation: setting.animation?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class CupertinoFullscreenDialogTransitionSetting {
  final Value<Animation<double>> animation;
  final Value<Widget> child;

  CupertinoFullscreenDialogTransitionSetting({
    this.animation,
    this.child,
  });

  CupertinoFullscreenDialogTransitionSetting copyWith({
    Value<Animation<double>> animation,
    Value<Widget> child,
  }) {
    return CupertinoFullscreenDialogTransitionSetting(
      animation: animation??this.animation,
      child: child??this.child,
    );
  }
}
