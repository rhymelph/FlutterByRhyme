import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LinearProgressIndicatorDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/LinearProgressIndicator';
  final String detail = '''材料设计线性进度指示器，也称为进度条。

一个小部件，显示沿线的进度。有两种线性进度指标：

确定。确定进度指标在每个时间点都有一个特定的值，并且该值应该从0.0单调增加到1.0，此时指标就完成了。要创建确定的进度指示器，请使用介于0.0和1.0之间的非空值。
不确定。不确定的进度指标在每个时间点都没有特定的值，而是表明正在取得进展而没有指出仍有多少进展。要创建不确定的进度指示器，请使用空值。''';

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
