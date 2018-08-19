import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoFullscreenDialogTransitionDemo extends StatefulWidget {
  static const String routeName =
      'widgets/cupertino/CupertinoFullscreenDialogTransition';
  final String detail = '''An iOS-style transition used for summoning fullscreen dialogs.
For example, used when creating a new calendar event by bringing in the next screen from the bottom.
Inheritance
Object Diagnosticable DiagnosticableTree Widget StatelessWidget CupertinoFullscreenDialogTransition''';

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
