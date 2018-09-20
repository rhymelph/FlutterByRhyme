import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RadioDemo extends StatefulWidget {
  static const String routeName='widgets/material/Radio';
  final String detail='''材料设计单选按钮。

用于在多个互斥值之间进行选择。当选择组中的一个单选按钮时，组中的其他单选按钮将不再被选中。值的类型T是Radio 类的类型参数。枚举通常用于此目的。

单选按钮本身不保持任何状态。相反，当单选按钮的状态发生变化时，小部件会调用onChanged回调。大多数使用单选按钮的小部件将侦听onChanged 回调并使用新的groupValue重建单选按钮以更新单选按钮的可视外观。

需要其中一个祖先成为Material小部件。''';

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends ExampleState<RadioDemo> {
  RadioSetting setting;

  @override
  void initState() {
    setting = RadioSetting(
      value: boolValues[0],
      groupValue: boolValues[0],
      onChanged: Value(
          name: 'onChanged',
          value: (value) {
            setState(() {
              setting = setting.copyWith(groupValue: boolValues[value ? 1 : 0]);
            });
          },
          label: '''(value) {
              setState(() {
                _groupValue=value;
              });
            }'''),
      ); // TODO: implement initState
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''bool _groupValue=false;
    //当groupValue==Value才会选中
    Radio<bool>(
        groupValue: _groupValue,
        value: ${setting.value?.label??''},
        onChanged: ${setting.onChanged?.label??''},
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
        value: setting.groupValue,
        title: StringParams.kGroupValue,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(groupValue: value);
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
      child: Radio<bool>(
        groupValue: setting.groupValue?.value,
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        activeColor: setting.activeColor?.value,
      ),
    );
  }
}

class RadioSetting {
  Value<bool> value;
  Value<bool> groupValue;

  Value<ValueChanged<bool>> onChanged;
  Value<Color> activeColor;

  RadioSetting({
    this.groupValue,
    this.value,
    this.onChanged,
    this.activeColor,
  });

  RadioSetting copyWith({
    Value<bool> value,
    Value<bool> groupValue,
    Value<ValueChanged<bool>> onChanged,
    Value<Color> activeColor,
  }) {
    return RadioSetting(
      value: value ?? this.value,
      groupValue: groupValue ?? this.groupValue,
      onChanged: onChanged ?? this.onChanged,
      activeColor: activeColor ?? this.activeColor,
    );
  }
}
