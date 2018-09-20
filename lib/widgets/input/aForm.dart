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
  GlobalKey<FormState> key = new GlobalKey();

  FormSetting setting;

  @override
  void initState() {
    setting = FormSetting(
      child: Value(value: Builder(builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            FormField<double>(
              onSaved: (double value) {
                print('$value');
              },
              initialValue: 10.0,
              validator: (double value){
                return value>50?'大於50':'小於等於50';
              },
              builder: (FormFieldState<double> field) {
                return new Slider(
                  min: 0.0,
                  max: 100.0,
                  divisions: 5,
                  activeColor: Colors.orange[100 + (field.value * 5.0).round()],
                  label: '${field.value.round()}',
                  value: field.value,
                  onChanged: field.didChange,
                );
              },
            ),
          ],
        );
      })),
      autovalidate: boolValues[0],
      onWillPop: Value(value: () {
        key.currentState.save();
        return Future<bool>.value(true);
      }),
      onChanged: Value(value: () {
        print('发生改变');
      }),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''''';
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
      key: key,
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
