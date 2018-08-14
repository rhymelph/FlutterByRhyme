import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoAlertDialogDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoAlertDialog';
  final String detail = '';

  @override
  _CupertinoAlertDialogDemoState createState() =>
      _CupertinoAlertDialogDemoState();
}

class _CupertinoAlertDialogDemoState
    extends ExampleState<CupertinoAlertDialogDemo> {
  CupertinoAlertDialogSetting setting;

  @override
  void initState() {
    setting = CupertinoAlertDialogSetting(
      barrierDismissible: boolValues[0],
      title: Value(
        name: '标题',
        value: '标题',
        label: '标题',
      ),
      content: Value(
        name: '内容',
        value: '内容',
        label: '内容',
      ),
      actions: Value(value: <Widget>[
        CupertinoDialogAction(
          child: Text('确定'),
          isDefaultAction: true,
          onPressed: () {
            exampleKey.currentState.showToast('点击了确定');
          },
        ),
        CupertinoDialogAction(
          child: Text('取消'),
          isDestructiveAction: true,//true为红色，false为蓝色
          isDefaultAction: true,//true为粗体，false为正常
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      label: '''<Widget>[
        CupertinoDialogAction(
          child: Text('确定'),
          isDefaultAction: true,
          onPressed: () {
            //todo click sure
          },
        ),
        CupertinoDialogAction(
          child: Text('取消'),
          isDestructiveAction: true,//true为红色，false为蓝色
          isDefaultAction: true,//true为粗体，false为正常
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ]''',),
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
        child: Text('Show CupertinoAlertDialog'),
      );
Widget _getDialog(){
    return CupertinoAlertDialog(
      title: Text('${setting.title?.label??''}'),
      content: Text('${setting.content?.label??''}'),
      actions: ${setting.actions?.label??''},
      scrollController: ${setting.scrollController?.label??''},
      actionScrollController: ${setting.actionScrollController?.label??''},
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
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoAlertDialog';
  }

  Widget _getDialog() {
    return CupertinoAlertDialog(
      title: Text(setting.title?.value),
      content: Text(setting.content?.value),
      actions: setting.actions?.value,
      scrollController: setting.scrollController?.value,
      actionScrollController: setting.actionScrollController?.value,
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
        child: Text('Show CupertinoAlertDialog'),
      ),
    );
  }
}

class CupertinoAlertDialogSetting {
  final Value<bool> barrierDismissible;
  final Value<String> title;
  final Value<String> content;
  final Value<List<Widget>> actions;
  final Value<ScrollController> scrollController;
  final Value<ScrollController> actionScrollController;

  CupertinoAlertDialogSetting({
    this.barrierDismissible,
    this.title,
    this.content,
    this.actions,
    this.scrollController,
    this.actionScrollController,
  });

  CupertinoAlertDialogSetting copyWith({
    Value<bool> barrierDismissible,
    Value<String> title,
    Value<String> content,
    Value<List<Widget>> actions,
    Value<ScrollController> scrollController,
    Value<ScrollController> actionScrollController,
  }) {
    return CupertinoAlertDialogSetting(
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      title: title ?? this.title,
      content: content ?? this.content,
      actions: actions ?? this.actions,
      scrollController: scrollController ?? this.scrollController,
      actionScrollController:
          actionScrollController ?? this.actionScrollController,
    );
  }
}
