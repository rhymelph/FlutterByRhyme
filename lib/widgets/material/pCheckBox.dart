import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CheckBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/CheckBox';
  final String detail = '''A material design checkbox.
The checkbox itself does not maintain any state. Instead, when the state of the checkbox changes, the widget calls the onChanged callback. Most widgets that use a checkbox will listen for the onChanged callback and rebuild the checkbox with a new value to update the visual appearance of the checkbox.
The checkbox can optionally display three values - true, false, and null - if tristate is true. When value is null a dash is displayed. By default tristate is false and the checkbox's value must be true or false.
Requires one of its ancestors to be a Material widget.
See also:
CheckboxListTile, which combines this widget with a ListTile so that you can give the checkbox a label.
Switch, a widget with semantics similar to Checkbox.
Radio, for selecting among a set of explicit values.
Slider, for selecting a value in a range.
material.google.com/components/selection-controls.html#selection-controls-checkbox
material.google.com/components/lists-controls.html#lists-controls-types-of-list-controls''';

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
