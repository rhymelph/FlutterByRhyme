import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AlertDialogDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/AlertDialog';
  final String detail = '''材料设计警报对话框。

警报对话框会通知用户需要确认的情况。警报对话框具有可选标题和可选的操作列表。标题显示在内容上方，操作显示在内容下方。

如果内容太大而无法垂直放在屏幕上，则对话框将显示标题和操作，并让内容溢出。考虑使用一个滚动的小部件，如ListView控件，为内容，以避免溢出。

对于为用户提供多个选项之间选择的对话框，请考虑使用SimpleDialog。

通常作为子窗口小部件传递给showDialog，后者显示对话框.''';

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends ExampleState<AlertDialogDemo> {
  AlertDialogSetting setting;

  @override
  void initState() {
    setting = AlertDialogSetting(
        contentPadding: paddingValues[0],
        titlePadding: paddingValues[0],
        actions: Value(
          name: 'actions',
          value: [
            Text('item1'),
            Text('item2'),
            Text('item3'),
          ],
          label: '''[
          Text('item1'),
          Text('item2'),
          Text('item3'),
        ]''',
        ),
        semanticLabel: Value(
          name: 'semanticLabel',
          value: 'SimpleDialog',
          label: 'SimpleDialog',
        ),
        barrierDismissible: boolValues[1]);
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
            barrierDismissible: ${setting.barrierDismissible?.label ?? 'false'},
            builder: (BuildContext context) {
              return _getDialog();
            },
          );
        },
        child: Text('Show AlertDialog'),
      )
Widget _getDialog() {
  return AlertDialog(
        title: Text('${setting.title?.label ?? ''}'),
        content: Text('${setting.content?.label ?? ''}'),
        titlePadding: ${setting.titlePadding?.label ?? ''},
        contentPadding: ${setting.contentPadding?.label ?? ''},
        semanticLabel: '${setting.semanticLabel?.label ?? ''}',
        actions: ${setting.actions?.label ?? ''},
    );
  }''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTitlePadding),
      RadioGroupWidget(setting.titlePadding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(titlePadding: value);
        });
      }),
      ValueTitleWidget(StringParams.kContentPadding),
      RadioGroupWidget(setting.contentPadding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(contentPadding: value);
        });
      }),
      EditTextTitleWidget(StringParams.kTitle, setting.title, (value) {
        setState(() {
          setting = setting.copyWith(title: value);
        });
      }),
      EditTextTitleWidget(StringParams.kContent, setting.content, (value) {
        setState(() {
          setting = setting.copyWith(content: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kBarrierDismissible,
        value: setting.barrierDismissible,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(barrierDismissible: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'SimpleDialog';
  }

  Widget _getDialog() {
    return AlertDialog(
      title: Text(setting.title?.value ?? ''),
      content: Text(setting.content?.value ?? ''),
      contentPadding: setting.contentPadding?.value,
      titlePadding: setting.titlePadding?.value,
      semanticLabel: setting.semanticLabel?.value,
      actions: setting.actions?.value,
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
        child: Text('Show AlertDialog'),
      ),
    );
  }
}

class AlertDialogSetting {
  final Value<String> title;
  final Value<String> content;
  final Value<EdgeInsetsGeometry> titlePadding;
  final Value<List<Widget>> actions;
  final Value<EdgeInsetsGeometry> contentPadding;
  final Value<String> semanticLabel;
  final Value<bool> barrierDismissible;

  AlertDialogSetting({
    this.barrierDismissible,
    this.content,
    this.title,
    this.titlePadding,
    this.actions,
    this.contentPadding,
    this.semanticLabel,
  });

  AlertDialogSetting copyWith({
    Value<bool> barrierDismissible,
    Value<String> title,
    Value<String> content,
    Value<EdgeInsetsGeometry> titlePadding,
    Value<List<Widget>> actions,
    Value<EdgeInsetsGeometry> contentPadding,
    Value<String> semanticLabel,
  }) {
    return AlertDialogSetting(
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      title: title ?? this.title,
      content: content ?? this.content,
      titlePadding: titlePadding ?? this.titlePadding,
      actions: actions ?? this.actions,
      contentPadding: contentPadding ?? this.contentPadding,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}
