import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FormDemo extends StatefulWidget {
  static const String routeName = 'widgets/input/Form';
  final String detail = '''用于将多个表单字段小部件（例如TextField小部件）分组在一起的可选容器。

每个单独的表单字段都应该包装在FormField小部件中，并将Form小部件作为所有这些小部件的共同祖先。调用FormState上的方法 来保存，重置或验证作为此Form的后代的每个FormField。要获取FormState，可以将Form.of 与其祖先为Form的上下文一起使用，或者将GlobalKey传递给 Form构造函数并调用GlobalKey.currentState。''';

  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends ExampleState<FormDemo> {
  FormSetting setting;
  bool isClickBack = false;
  TextEditingController controller;

  String saveText = '';

  @override
  void initState() {
    controller = TextEditingController();
    setting = FormSetting(
      child: Value(
        value: Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                TextFormField(
                  initialValue: saveText,
                  onSaved: (value) {
                    saveText = value;
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                            onPressed: () {
                              Form.of(context).reset();
                              print(saveText);
                            },
                            child: Text('重置'))),
                    Expanded(
                        child: FlatButton(
                            onPressed: () {
                              Form.of(context).save();
                            },
                            child: Text('保存')))
                  ],
                )
              ],
            );
          },
        ),
        label: '''Builder(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                TextFormField(
                //当调用Form.of(context).reset();返回该值
                  initialValue: saveText,
                  onSaved: (value) {
                //当调用Form.of(context).save();会调用该方法
                    saveText = value;
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                            onPressed: () {
                              Form.of(context).reset();
                              print(saveText);
                            },
                            child: Text('重置'))),
                    Expanded(
                        child: FlatButton(
                            onPressed: () {
                              Form.of(context).save();
                            },
                            child: Text('保存')))
                  ],
                )
              ],
            );
          },
        )''',

      ),
      autovalidate: boolValues[0],
      onWillPop: Value(
          value: () {
            if (isClickBack) {
              return Future<bool>.value(true);
            } else {
              isClickBack = true;
              exampleKey.currentState.showToast('再按一次退出');
              return Future<bool>.value(false);
            }
          },
          label: '''Value(value: () {
        //bool isClickBack=false;
        if (isClickBack) {
          return Future<bool>.value(true);
        } else {
        //这里可以保存值
          isClickBack = true;
          //showToast('再按一次退出');
          return Future<bool>.value(false);
        }
      }'''),
      onChanged: Value(value: () {
        //当值发生该变时调用
//        print('发生改变');
      },label: '''() {
        //当值发生该变时调用
      }'''),
    );
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Form(
      child: ${setting.child?.label??''},
      autovalidate: ${setting.autovalidate?.label??''},
      onWillPop: ${setting.onWillPop?.label??''},
      onChanged: ${setting.onChanged?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
          title: StringParams.kAutovalidate,
          value: setting.autovalidate,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(autovalidate: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'Form';
  }

  @override
  Widget getWidget() {
    return Form(
      child: setting.child?.value,
      autovalidate: setting.autovalidate?.value,
      onWillPop: setting.onWillPop?.value,
      onChanged: setting.onChanged?.value,
    );
  }
}

class FormSetting {
  final Value<Widget> child;
  final Value<bool> autovalidate;
  final Value<WillPopCallback> onWillPop;
  final Value<VoidCallback> onChanged;

  FormSetting({
    @required this.child,
    this.autovalidate,
    this.onWillPop,
    this.onChanged,
  });

  FormSetting copyWith({
    Value<Widget> child,
    Value<bool> autovalidate,
    Value<WillPopCallback> onWillPop,
    Value<VoidCallback> onChanged,
  }) {
    return FormSetting(
      child: child ?? this.child,
      autovalidate: autovalidate ?? this.autovalidate,
      onChanged: onChanged ?? this.onChanged,
      onWillPop: onWillPop ?? this.onWillPop,
    );
  }
}
