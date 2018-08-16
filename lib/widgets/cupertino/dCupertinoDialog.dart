import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoDialogDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoDialog';
  final String detail = '''An iOS-style dialog.
This dialog widget does not have any opinion about the contents of the dialog. Rather than using this widget directly, consider using CupertinoAlertDialog, which implement a specific kind of dialog.
Push with Navigator.of(..., rootNavigator: true) when using with CupertinoTabScaffold to ensure that the dialog appears above the tabs.
See also:
CupertinoAlertDialog, which is a dialog with title, contents, and actions.
developer.apple.com/ios/human-interface-guidelines/views/alerts/''';

  @override
  _CupertinoDialogDemoState createState() => _CupertinoDialogDemoState();
}

class _CupertinoDialogDemoState extends ExampleState<CupertinoDialogDemo> {
  CupertinoDialogSetting setting;

  @override
  void initState() {
    setting = CupertinoDialogSetting(
      child: Value(
        value: CupertinoActivityIndicator(radius: 25.0,),
        label: 'CupertinoActivityIndicator(radius: 25.0,)',
      ),
      barrierDismissible: boolValues[0],
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
          showDialog(
            context: context,
            barrierDismissible: ${setting.barrierDismissible?.label??''},
            builder: (BuildContext context) {
              return _getDialog();
            },
          );
        },
        child: Text('Show CupertinoDialog'),
      )
      
Widget _getDialog() {
    return CupertinoDialog(
      child: ${setting.child?.label??''},
    );
  }''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
          title: StringParams.kBarrierDismissible,
          value: setting.barrierDismissible,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(barrierDismissible: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoDialog';
  }

  Widget _getDialog() {
    return CupertinoDialog(
      child: setting.child?.value,
    );
  }

  @override
  Widget getWidget() {
    return Center(
      child: FlatButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: setting.barrierDismissible?.value,
            builder: (BuildContext context) {
              return _getDialog();
            },
          );
        },
        child: Text('Show CupertinoDialog'),
      ),
    );
  }
}

class CupertinoDialogSetting {
  final Value<bool> barrierDismissible;
  final Value<Widget> child;

  CupertinoDialogSetting({
    this.barrierDismissible,
    this.child,
  });

  CupertinoDialogSetting copyWith({
    Value<bool> barrierDismissible,
    Value<Widget> child,
  }) {
    return CupertinoDialogSetting(
      barrierDismissible: barrierDismissible??this.barrierDismissible,
      child: child??this.child,
    );
  }
}
