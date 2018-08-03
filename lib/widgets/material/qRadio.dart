import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RadioDemo extends StatefulWidget {
  static const String routeName='widgets/material/Radio';
  final String detail='''A material design radio button.
Used to select between a number of mutually exclusive values. When one radio button in a group is selected, the other radio buttons in the group cease to be selected. The values are of type T, the type parameter of the Radio class. Enums are commonly used for this purpose.
The radio button itself does not maintain any state. Instead, when the state of the radio button changes, the widget calls the onChanged callback. Most widget that use a radio button will listen for the onChanged callback and rebuild the radio button with a new groupValue to update the visual appearance of the radio button.
Requires one of its ancestors to be a Material widget.
See also:
RadioListTile, which combines this widget with a ListTile so that you can give the radio button a label.
Slider, for selecting a value in a range.
Checkbox and Switch, for toggling a particular value on or off.
material.google.com/components/selection-controls.html#selection-controls-radio-button''';

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
