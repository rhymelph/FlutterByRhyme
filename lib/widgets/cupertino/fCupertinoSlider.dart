import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoSliderDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoSlider';
  final String detail = '''iOS风格的滑块。

用于从一系列值中进行选择。

滑块可用于从连续或离散值集中进行选择。默认值是使用从最小值到最大值的连续值范围。要使用离散值，请使用非空值进行分割，这表示离散间隔的数量。例如，如果min为0.0且 max为50.0且除数为5，则滑块可以采用离散值0.0,10.0,20.0,30.0,40.0和50.0的值。

滑块本身不保持任何状态。相反，当滑块状态发生变化时，窗口小部件会调用onChanged回调。大多数使用滑块的小部件将侦听onChanged回调并使用新值重建滑块以更新滑块的视觉外观。''';

  @override
  _CupertinoSliderDemoState createState() =>
      _CupertinoSliderDemoState();
}

class _CupertinoSliderDemoState
    extends ExampleState<CupertinoSliderDemo> {
  CupertinoSliderSetting setting;

  @override
  void initState() {
    setting = CupertinoSliderSetting(
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
CupertinoSlider(
        value: ${setting.value?.label??''},
        onChanged: ${setting.onChanged?.label??''},
        divisions: ${setting.divisions?.label??''},
        min: ${setting.min?.label??''},
        max: ${setting.max?.label??''},
        onChangeStart: ${setting.onChangeStart?.label??''},
        onChangeEnd: ${setting.onChangeEnd?.label??''},
        activeColor: ${setting.activeColor?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor, (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
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
    return 'CupertinoSlider';
  }


  @override
  Widget getWidget() {
    return Center(
      child: CupertinoSlider(
        value: setting.value?.value,
        onChanged: setting.onChanged?.value,
        divisions: setting.divisions?.value,
        min: setting.min?.value,
        max: setting.max?.value,
        onChangeStart: setting.onChangeStart?.value,
        onChangeEnd: setting.onChangeEnd?.value,
        activeColor: setting.activeColor?.value,
      ),
    );
  }
}

class CupertinoSliderSetting {
  final Value<double> value;
  final Value<ValueChanged<double>> onChanged;
  final Value<int> divisions;
  final Value<double> min;
  final Value<double> max;
  final Value<ValueChanged<double>> onChangeStart;
  final Value<ValueChanged<double>> onChangeEnd;
  final Value<Color> activeColor;
  CupertinoSliderSetting({
    @required this.value,
    @required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min,
    this.max,
    this.divisions,
    this.activeColor,
  });

  CupertinoSliderSetting copyWith({
    Value<double> value,
    Value<ValueChanged<double>> onChanged,
    Value<int> divisions,
    Value<double> min,
    Value<double> max,
    Value<ValueChanged<double>> onChangeStart,
    Value<ValueChanged<double>> onChangeEnd,
    Value<Color> activeColor,
  }) {
    return CupertinoSliderSetting(
      value: value??this.value,
      onChanged: onChanged??this.onChanged,
      divisions: divisions??this.divisions,
      min: min??this.min,
      max: max??this.max,
      onChangeStart: onChangeStart??this.onChangeStart,
      onChangeEnd: onChangeEnd??this.onChangeEnd,
      activeColor: activeColor??this.activeColor,
    );
  }
}
