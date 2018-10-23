import 'package:flutter/cupertino.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoActionSheetDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoActionSheet';
  final String detail = '''iOS风格的操作表。

操作表是一种特定的警报样式，它向用户显示一组与当前上下文相关的两个或多个选项。操作表可以包含标题，附加消息和操作列表。标题显示在消息上方，操作显示在此内容下方。

此操作表将其标题和消息设置为与标准iOS操作表标题和消息文本样式匹配。

要显示看起来像标准iOS操作表按钮的操作按钮，请为此操作表提供的操作提供CupertinoActionSheetAction。

以包括IOS的风格取消按钮与其他按钮分开，提供一种CupertinoActionSheetAction为cancelButton给予本动作片。

操作表通常作为子窗口小部件传递给 showCupertinoModalPopup，它通过从屏幕底部向上滑动来显示操作表。''';

  @override
  _CupertinoActionSheetDemoState createState() =>
      _CupertinoActionSheetDemoState();
}

class _CupertinoActionSheetDemoState
    extends ExampleState<CupertinoActionSheetDemo> {
  CupertinoActionSheetSetting setting;

  @override
  void initState() {
    setting = CupertinoActionSheetSetting(
        messageScrollController: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        actionScrollController: Value(
          value: ScrollController(),
          label: 'ScrollController()',
        ),
        title: Value(
          value: Text('Title'),
          label: "Text('Title')",
        ),
        message: Value(
          value: Text('Message'),
          label: "Text('Message')",
        ),
        actions: Value(
          value: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Action1'),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('Action2'),
              onPressed: () {},
            ),
          ],
          label: '''<Widget>[
            CupertinoActionSheetAction(
              child: Text('Action1'),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('Action2'),
              onPressed: () {},
            ),
          ]
          ''',
        ),
        cancelButton: Value(
          value: CupertinoActionSheetAction(
            child: Text('cancel'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          label: '''CupertinoActionSheetAction(
            child: Text('cancel'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
          )''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoButton(
        onPressed: () {
        //展示
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                    title: ${setting.title?.label ?? ''},
                    message: ${setting.message?.label ?? ''},
                    messageScrollController:
                        ${setting.messageScrollController?.label ?? ''},
                    actions: ${setting.actions?.label ?? ''},
                    actionScrollController:
                        ${setting.actionScrollController?.label ?? ''},
                    cancelButton: ${setting.cancelButton?.label ?? ''},
                  ));
        },
        child: Text('Show CupertinoActionSheet'),
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'CupertinoActionSheet';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                    title: setting.title?.value,
                    message: setting.message?.value,
                    messageScrollController:
                        setting.messageScrollController?.value,
                    actions: setting.actions?.value,
                    actionScrollController:
                        setting.actionScrollController?.value,
                    cancelButton: setting.cancelButton?.value,
                  ));
        },
        child: Text('Show CupertinoActionSheet'),
      ),
    );
  }
}

class CupertinoActionSheetSetting {
  final Value<Widget> title;
  final Value<Widget> message;
  final Value<List<Widget>> actions;
  final Value<ScrollController> messageScrollController;
  final Value<ScrollController> actionScrollController;
  final Value<Widget> cancelButton;

  CupertinoActionSheetSetting({
    this.title,
    this.message,
    this.actions,
    this.messageScrollController,
    this.actionScrollController,
    this.cancelButton,
  });

  CupertinoActionSheetSetting copyWith({
    Value<Widget> title,
    Value<Widget> message,
    Value<List<Widget>> actions,
    Value<ScrollController> messageScrollController,
    Value<ScrollController> actionScrollController,
    Value<Widget> cancelButton,
  }) {
    return CupertinoActionSheetSetting();
  }
}
