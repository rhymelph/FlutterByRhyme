import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SimpleDialogDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/SimpleDialog';
  final String detail = '''简单的材料设计对话框。

简单的对话框为用户提供了多个选项之间的选择。一个简单的对话框有一个可选的标题，显示在选项上方。

选择通常使用SimpleDialogOption小部件表示。如果使用其他小部件，请参阅contentsPadding以获取有关获取Material Design预期间距的约定的注释。

对于通知用户情况的对话框，请考虑使用 AlertDialog。

通常作为子窗口小部件传递给showDialog，后者显示对话框.''';

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends ExampleState<SimpleDialogDemo> {
  SimpleDialogSetting setting;

  @override
  void initState() {
    setting = SimpleDialogSetting(
      contentPadding: paddingValues[0],
      titlePadding: paddingValues[0],
      children: Value(
        name: 'children',
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
      barrierDismissible: boolValues[1],
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
            barrierDismissible: ${setting.barrierDismissible?.label??'false'},
            builder: (BuildContext context) {
              return getDialog();
            },
          );
        },
        child: Text('Show SimpleDialog'),
      )
      
Widget _getDialog() {
   return SimpleDialog(
         title: Text('${setting.title?.label ?? ''}'),
         contentPadding: ${setting.contentPadding?.label ?? ''},
         titlePadding: ${setting.titlePadding?.label ?? ''},
         semanticLabel: '${setting.semanticLabel?.label ?? ''}',
         children: ${setting.children?.label ?? ''},
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
    return SimpleDialog(
      title: Text(setting.title?.value ?? ''),
      contentPadding: setting.contentPadding?.value,
      titlePadding: setting.titlePadding?.value,
      semanticLabel: setting.semanticLabel?.value,
      children: setting.children?.value,
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

class SimpleDialogSetting {
  final Value<bool> barrierDismissible;

  final Value<String> title;
  final Value<EdgeInsetsGeometry> titlePadding;
  final Value<List<Widget>> children;
  final Value<EdgeInsetsGeometry> contentPadding;
  final Value<String> semanticLabel;

  SimpleDialogSetting({
    this.barrierDismissible,
    this.title,
    this.titlePadding,
    this.children,
    this.contentPadding,
    this.semanticLabel,
  });

  SimpleDialogSetting copyWith({
    Value<bool> barrierDismissible,
    Value<String> title,
    Value<EdgeInsetsGeometry> titlePadding,
    Value<List<Widget>> children,
    Value<EdgeInsetsGeometry> contentPadding,
    Value<String> semanticLabel,
  }) {
    return SimpleDialogSetting(
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      title: title ?? this.title,
      titlePadding: titlePadding ?? this.titlePadding,
      children: children ?? this.children,
      contentPadding: contentPadding ?? this.contentPadding,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}
