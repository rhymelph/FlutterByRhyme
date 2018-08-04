import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SliderDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Slider';
  final String detail = '';

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends ExampleState<SliderDemo> {
  SliderSetting setting;

  @override
  void initState() {
    setting = SliderSetting(
      onChanged: Value(
        name: 'onChanged',
        value: (value) {
          print(value);
          setState(() {
            setting = setting.copyWith(
                value: Value(
                  name: 'value',
                  value: value,
                  label: '_value',
                ),
                );
          });
        },
        label: '''(value) {
          setState(() {
          // todo 当值改变时调用
          _value=value;
          });
        }''',
      ),
      onChangeEnd: Value(
        name: 'onChangeEnd',
        value: (value) {
          //todo 当拖动完成手指离开时调用
          print('当拖动完成手指离开时调用:$value');
        },
        label: '''(value){
            //todo 当拖动完成手指离开时调用
        }''',
      ),
      onChangeStart: Value(
        name: 'onChangeStart',
        value: (value) {
          //todo 当手机接触滑块时调用
          print('当手机接触滑块时调用:$value');
        },
        label: '''(value){
            //todo 当拖动完成手指离开时调用
        }''',
      ),
      value: doubleMiniValues[0],
      min: doubleMiniValues[0],
      max: doubleMiniValues[2],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''double _value=0.0;
    Slider(
        divisions: ${setting.divisions?.label??''},
        value: ${setting.value?.label??''},
        onChanged: ${setting.onChanged?.label??''},
        min: ${setting.min?.label??''},
        max: ${setting.max?.label??''},
        onChangeEnd: ${setting.onChangeEnd?.label??''},
        onChangeStart: ${setting.onChangeStart?.label??''},
        label: ${setting.label?.label??''},
        activeColor: ${setting.activeColor?.label??''},
        inactiveColor: ${setting.inactiveColor?.label??''},
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      EditTextTitleWidget(StringParams.kLabelText, setting.label, (value){
        setState(() {
          setting=setting.copyWith(label: value);
        });
      }),
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor, (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kInActiveColor),
      ColorGroupWidget(setting.inactiveColor, (value) {
        setState(() {
          setting = setting.copyWith(inactiveColor: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: intLargeValues,
        title: StringParams.kDivisions,
        value: setting.divisions,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(divisions: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kMin,
        value: setting.min,
        onChanged: (value) {
          if (setting.max.value <= value.value) {
            exampleKey.currentState.showToast('最小值不能大于或等于最大值');
          } else if (value.value > setting.value.value) {
            setState(() {
              setting = setting.copyWith(value: value, min: value);
            });
          } else {
            setState(() {
              setting = setting.copyWith(min: value);
            });
          }
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kMax,
        value: setting.max,
        onChanged: (value) {
          if (setting.min.value >= value.value) {
            exampleKey.currentState.showToast('最大值不能小于或等于最小值');
          } else if (value.value < setting.value.value) {
            setState(() {
              setting = setting.copyWith(
                max: value,
                value: value,
              );
            });
          } else {
            setState(() {
              setting = setting.copyWith(max: value);
            });
          }
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Slider';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Slider(
        divisions: setting.divisions?.value,
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        min: setting.min?.value,
        max: setting.max?.value,
        onChangeEnd: setting.onChangeEnd?.value,
        onChangeStart: setting.onChangeStart?.value,
        label: setting.label?.value,
        activeColor: setting.activeColor?.value,
        inactiveColor: setting.inactiveColor?.value,
      ),
    );
  }
}

class SliderSetting {
  final Value<int> divisions;
  final Value<double> value;
  final Value<double> min;
  final Value<double> max;
  final Value<ValueChanged<double>> onChanged;
  final Value<ValueChanged<double>> onChangeStart;
  final Value<ValueChanged<double>> onChangeEnd;
  final Value<String> label;
  final Value<Color> activeColor;
  final Value<Color> inactiveColor;

  SliderSetting({
    this.divisions,
    this.value,
    this.min,
    this.max,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.label,
    this.activeColor,
    this.inactiveColor,
  });

  SliderSetting copyWith({
    Value<int> divisions,
    Value<double> value,
    Value<double> min,
    Value<double> max,
    Value<ValueChanged<double>> onChanged,
    Value<ValueChanged<double>> onChangeStart,
    Value<ValueChanged<double>> onChangeEnd,
    Value<String> label,
    Value<Color> activeColor,
    Value<Color> inactiveColor,
  }) {
    return SliderSetting(
      divisions: divisions ?? this.divisions,
      value: value ?? this.value,
      max: max ?? this.max,
      min: min ?? this.min,
      onChanged: onChanged ?? this.onChanged,
      onChangeStart: onChangeStart??this.onChangeStart,
      onChangeEnd: onChangeEnd??this.onChangeEnd,
      label: label??this.label,
      activeColor: activeColor??this.activeColor,
      inactiveColor: inactiveColor??this.inactiveColor,
    );
  }
}
