import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FormDemo extends StatefulWidget {
  static const String routeName = 'widgets/input/Form';
  final String detail = '''''';

  @override
  _FormDemoState createState() =>
      _FormDemoState();
}

class _FormDemoState
    extends ExampleState<FormDemo> {
  GlobalKey<FormState> key=new GlobalKey();

  FormSetting setting;

  @override
  void initState() {
    setting = FormSetting(
      child: Value(),
      autovalidate: boolValues[0],
      onWillPop: Value(
        value: (){
          key.currentState.save();
          return Future<bool>.value(true);
        }
      ),
      onChanged: Value(
        value: (){
          print('发生改变');
        }
      ),
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
      SwitchValueTitleWidget(title: StringParams.kAutovalidate, value: setting.autovalidate, onChanged: (value){
        setState(() {
          setting=setting.copyWith(autovalidate: value);
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
      child: child??this.child,
      autovalidate: autovalidate??this.autovalidate,
      onChanged: onChanged??this.onChanged,
      onWillPop: onWillPop??this.onWillPop,
    );
  }
}
