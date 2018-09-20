import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/CheckBox';
  final String detail = '''材料设计复选框。

复选框本身不保持任何状态。相反，当复选框的状态发生变化时，窗口小部件会调用onChanged回调。大多数使用复选框的小部件将侦听onChanged回调并使用新值重建复选框以更新复选框的可视外观。

如果tristate为true ，则复选框可以选择显示三个值 - true，false和null 。当value为null时，将显示破折号。默认情况下， 三态为false，复选框的值必须为true或false。

需要其中一个祖先成为Material小部件。''';

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends ExampleState<CheckBoxDemo> {
  CheckBoxSetting setting;

  @override
  void initState() {
    setting = CheckBoxSetting(
        value: boolValues[0],
        onChanged: Value(
            name: 'onChanged',
            value: (value) {
              setState(() {
                setting = setting.copyWith(value: boolValues[value ? 1 : 0]);
              });
            },
        label: '''(value) {
              setState(() {
                _value=value;
              });
            }'''),
    tristate: boolValues[0],); // TODO: implement initState
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''bool _value=false;
    Checkbox(
        value: _value,
        onChanged: ${setting.onChanged?.label??''},
        tristate: ${setting.tristate?.label??''},
        activeColor: ${setting.activeColor?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor,  (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
        });
      }),
      SwitchValueTitleWidget(
        value: setting.value,
        title: StringParams.kValue,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(value: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        value: setting.tristate,
        title: StringParams.kTristate,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(tristate: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'CheckBox';
  }

  @override
  Widget getWidget() {
    // TODO: implement getWidget
    return Center(
      child: Checkbox(
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        tristate: setting.tristate?.value,
        activeColor: setting.activeColor?.value,
      ),
    );
  }
}

class CheckBoxSetting {
  Value<bool> value;
  Value<bool> tristate;
  Value<ValueChanged<bool>> onChanged;
  Value<Color> activeColor;

  CheckBoxSetting({
    this.value,
    this.tristate,
    this.onChanged,
    this.activeColor,
  });

  CheckBoxSetting copyWith({
    Value<bool> value,
    Value<bool> tristate,
    Value<ValueChanged<bool>> onChanged,
    Value<Color> activeColor,
  }) {
    return CheckBoxSetting(
      value: value ?? this.value,
      tristate: tristate ?? this.tristate,
      onChanged: onChanged ?? this.onChanged,
      activeColor: activeColor ?? this.activeColor,
    );
  }
}
