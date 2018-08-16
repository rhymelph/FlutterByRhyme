import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoDialogActionDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoDialogAction';
  final String detail = '''A button typically used in a CupertinoAlertDialog.
See also:
CupertinoAlertDialog, a dialog that informs the user about situations that require acknowledgement
Inheritance
Object Diagnosticable DiagnosticableTree Widget StatelessWidget CupertinoDialogAction''';

  @override
  _CupertinoDialogActionDemoState createState() =>
      _CupertinoDialogActionDemoState();
}

class _CupertinoDialogActionDemoState
    extends ExampleState<CupertinoDialogActionDemo> {
  CupertinoDialogActionSetting setting;

  @override
  void initState() {
    setting = CupertinoDialogActionSetting(
      onPressed: onPressValues[0],
      child: Value(
        value: Text('Action'),
        label: "Text('Action')",
      ),
      isDestructiveAction: boolValues[0],
      isDefaultAction: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoDialogAction(
      child: ${setting.child?.label??''},
      onPressed: ${setting.onPressed?.label??''},
      isDefaultAction: ${setting.isDefaultAction?.label??''},
      isDestructiveAction: ${setting.isDestructiveAction?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.konPressed),
      RadioGroupWidget(setting.onPressed, onPressValues, (value){
        setState(() {
          setting=setting.copyWith(onPressed: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kIsDefaultAction,
          value: setting.isDefaultAction,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(isDefaultAction: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kIsDestructiveAction,
          value: setting.isDestructiveAction,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(isDestructiveAction: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoDialogAction';
  }

  @override
  Widget getWidget() {
    return CupertinoDialogAction(
      child: setting.child?.value,
      onPressed: setting.onPressed?.value == null
          ? setting.onPressed?.value
          : () {
        setting.onPressed?.value(scaffoldKey);
      },
      isDefaultAction: setting.isDefaultAction?.value,
      isDestructiveAction: setting.isDestructiveAction?.value,
    );
  }
}

class CupertinoDialogActionSetting {
  final Value<Widget> child;
  final Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed;
  final Value<bool> isDefaultAction;
  final Value<bool> isDestructiveAction;

  CupertinoDialogActionSetting({
    this.child,
    this.onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
  });

  CupertinoDialogActionSetting copyWith({
    Value<Widget> child,
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed,
    Value<bool> isDefaultAction,
    Value<bool> isDestructiveAction,
  }) {
    return CupertinoDialogActionSetting(
      child: child ?? this.child,
      onPressed: onPressed ?? this.onPressed,
      isDefaultAction: isDefaultAction ?? this.isDefaultAction,
      isDestructiveAction: isDestructiveAction ?? this.isDestructiveAction,
    );
  }
}
