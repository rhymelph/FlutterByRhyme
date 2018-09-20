import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SwitchDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Switch';
  final String detail = '''材料设计开关。

用于切换单个设置的开/关状态。

交换机本身不保持任何状态。相反，当交换机的状态发生变化时，小部件会调用onChanged回调。大多数使用交换机的小部件将侦听onChanged回调并使用新值重建交换机以更新交换机的可视外观。

需要其中一个祖先成为Material小部件。''';

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
