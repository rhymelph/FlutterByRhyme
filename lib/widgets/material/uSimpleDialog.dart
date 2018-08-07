import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SimpleDialogDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/SimpleDialog';
  final String detail = '';

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends ExampleState<SimpleDialogDemo> {
  SimpleDialogSetting setting;

  @override
  void initState() {
    setting=SimpleDialogSetting(
      contentPadding: paddingValues[0],
      titlePadding: paddingValues[0],
    );
    super.initState();
  }
  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''SimpleDialog(
      title: Text(${setting.title?.label??''}),
      contentPadding: ${setting.contentPadding?.label??''},
      titlePadding: ${setting.titlePadding?.label??''},
      semanticLabel: ${setting.semanticLabel?.label??''},
      children: ${setting.children?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      EditTextTitleWidget(StringParams.kTitle, setting.title, (value){
        setState(() {
          setting=setting.copyWith(title: value);
        });
      }),
      ValueTitleWidget('titlePadding'),
      RadioGroupWidget(setting.titlePadding, paddingValues, (value){
        setState(() {
          setting=setting.copyWith(titlePadding: value);
        });
      }),
      ValueTitleWidget('contentPadding'),
      RadioGroupWidget(setting.contentPadding, paddingValues, (value){
        setState(() {
          setting=setting.copyWith(contentPadding: value);
        });
      }),
    ];
  }
  @override
  String getTitle() {
    return 'SimpleDialog';
  }

  @override
  Widget getWidget() {
    return SimpleDialog(
      title: Text(setting.title?.value),
      contentPadding: setting.contentPadding?.value,
      titlePadding: setting.titlePadding?.value,
      semanticLabel: setting.semanticLabel?.value,
      children: setting.children?.value,
    );
  }
}

class SimpleDialogSetting {
  final Value<String> title;
  final Value<EdgeInsetsGeometry> titlePadding;
  final Value<List<Widget>> children;
  final Value<EdgeInsetsGeometry> contentPadding;
  final Value<String> semanticLabel;

  SimpleDialogSetting({
    this.title,
    this.titlePadding,
    this.children,
    this.contentPadding,
    this.semanticLabel,
  });

  SimpleDialogSetting copyWith({
    Value<String> title,
    Value<EdgeInsetsGeometry> titlePadding,
    Value<List<Widget>> children,
    Value<EdgeInsetsGeometry> contentPadding,
    Value<String> semanticLabel,
  }) {
    return SimpleDialogSetting(
      title: title ?? this.title,
      titlePadding: titlePadding ?? this.titlePadding,
      children: children ?? this.children,
      contentPadding: contentPadding ?? this.contentPadding,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}
