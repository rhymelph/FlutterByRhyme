import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LinearProgressIndicatorDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/LinearProgressIndicator';
  final String detail = '''A material design linear progress indicator, also known as a progress bar.
A widget that shows progress along a line. There are two kinds of linear progress indicators:
Determinate. Determinate progress indicators have a specific value at each point in time, and the value should increase monotonically from 0.0 to 1.0, at which time the indicator is complete. To create a determinate progress indicator, use a non-null value between 0.0 and 1.0.
Indeterminate. Indeterminate progress indicators do not have a specific value at each point in time and instead indicate that progress is being made without indicating how much progress remains. To create an indeterminate progress indicator, use a null value.''';

  @override
  _LinearProgressIndicatorDemoState createState() =>
      _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState
    extends ExampleState<LinearProgressIndicatorDemo> {
  LinearProgressIndicatorSetting setting;

  @override
  void initState() {
    setting = LinearProgressIndicatorSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''LinearProgressIndicator(
      value: ${setting.value?.label??''},
      backgroundColor: ${setting.backgroundColor?.label??''},
      valueColor: ${setting.valueColor?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      DropDownValueTitleWidget(selectList: doubleOneValues, title: StringParams.kValue, value: setting.value,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(value: value);
        });
      },)
    ];
  }

  @override
  String getTitle() {
    return 'LinearProgressIndicator';
  }

  @override
  Widget getWidget() {
    return LinearProgressIndicator(
      value: setting.value?.value,
      backgroundColor: setting.backgroundColor?.value,
      valueColor: setting.valueColor?.value,
    );
  }
}

class LinearProgressIndicatorSetting {
  final Value<double> value;
  final Value<Color> backgroundColor;
  final Value<Animation<Color>> valueColor;

  LinearProgressIndicatorSetting(
      {this.value, this.backgroundColor, this.valueColor});

  LinearProgressIndicatorSetting copyWith({
    Value<double> value,
    Value<Color> backgroundColor,
    Value<Animation<Color>> valueColor,
  }) {
    return LinearProgressIndicatorSetting(
      value: value ?? this.value,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      valueColor: valueColor ?? this.valueColor,
    );
  }
}
