import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SwitchDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Switch';
  final String detail = '''A material design switch.
Used to toggle the on/off state of a single setting.
The switch itself does not maintain any state. Instead, when the state of the switch changes, the widget calls the onChanged callback. Most widgets that use a switch will listen for the onChanged callback and rebuild the switch with a new value to update the visual appearance of the switch.
Requires one of its ancestors to be a Material widget.
See also:
SwitchListTile, which combines this widget with a ListTile so that you can give the switch a label.
Checkbox, another widget with similar semantics.
Radio, for selecting among a set of explicit values.
Slider, for selecting a value in a range.
material.google.com/components/selection-controls.html#selection-controls-switch''';

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends ExampleState<SwitchDemo> {
  SwitchSetting setting;

  @override
  void initState() {
    setting = SwitchSetting(
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
    );

    super.initState();
  }

  @override
  String getDetail() {
    // TODO: implement getDetail
    return widget.detail;
  }

  @override
  String getExampleCode() {
    // TODO: implement getExampleCode
    return '''bool _value=false;
    Switch(
        value: _value,
        onChanged: ${setting.onChanged?.label??''},
        activeColor: ${setting.activeColor?.label??''},
        activeTrackColor: ${setting.activeTrackColor?.label??''},
        activeThumbImage: ${setting.activeThumbImage?.label??''},
        inactiveThumbColor: ${setting.inactiveThumbColor?.label??''},
        inactiveTrackColor: ${setting.inactiveTrackColor?.label??''},
        inactiveThumbImage: ${setting.inactiveThumbImage?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    // TODO: implement getSetting
    return [
      ValueTitleWidget(StringParams.kActiveThumbImage),
      RadioGroupWidget(setting.activeThumbImage, imageValues, (value) {
        setState(() {
          setting = setting.copyWith(activeThumbImage: value);
        });
      }),
      ValueTitleWidget(StringParams.kInActiveThumbImage),
      RadioGroupWidget(setting.inactiveThumbImage, imageValues, (value) {
        setState(() {
          setting = setting.copyWith(inactiveThumbImage: value);
        });
      }),
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor, (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kActiveTrackColor),
      ColorGroupWidget(setting.activeTrackColor, (value) {
        setState(() {
          setting = setting.copyWith(activeTrackColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kInActiveThumbColor),
      ColorGroupWidget(setting.inactiveThumbColor, (value) {
        setState(() {
          setting = setting.copyWith(inactiveThumbColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kInActiveTrackColor),
      ColorGroupWidget(setting.inactiveTrackColor, (value) {
        setState(() {
          setting = setting.copyWith(inactiveTrackColor: value);
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
    ];
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return 'Switch';
  }

  @override
  Widget getWidget() {
    // TODO: implement getWidget
    return Center(
      child: Switch(
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        activeColor: setting.activeColor?.value,
        activeTrackColor: setting.activeTrackColor?.value,
        activeThumbImage: setting.activeThumbImage?.value,
        inactiveThumbColor: setting.inactiveThumbColor?.value,
        inactiveTrackColor: setting.inactiveTrackColor?.value,
        inactiveThumbImage: setting.inactiveThumbImage?.value,
      ),
    );
  }
}

class SwitchSetting {
  final Value<bool> value;
  final Value<ValueChanged<bool>> onChanged;
  final Value<Color> activeColor;
  final Value<Color> activeTrackColor;
  final Value<Color> inactiveThumbColor;
  final Value<Color> inactiveTrackColor;
  final Value<ImageProvider> activeThumbImage;
  final Value<ImageProvider> inactiveThumbImage;

  SwitchSetting({
    this.value,
    this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
  });

  SwitchSetting copyWith({
    Value<bool> value,
    Value<ValueChanged<bool>> onChanged,
    Value<Color> activeColor,
    Value<Color> activeTrackColor,
    Value<Color> inactiveThumbColor,
    Value<Color> inactiveTrackColor,
    Value<ImageProvider> activeThumbImage,
    Value<ImageProvider> inactiveThumbImage,
  }) {
    return SwitchSetting(
      value: value ?? this.value,
      onChanged: onChanged ?? this.onChanged,
      activeColor: activeColor ?? this.activeColor,
      activeTrackColor: activeTrackColor ?? this.activeTrackColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      activeThumbImage: activeThumbImage ?? this.activeThumbImage,
      inactiveThumbImage: inactiveThumbImage ?? this.inactiveThumbImage,
    );
  }
}
