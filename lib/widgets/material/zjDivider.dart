import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DividerDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Divider';
  final String detail = '''一个设备像素厚的水平线，两侧有填充。

在材料设计语言中，这代表一个分隔符。

分隔符可以在列表，抽屉和其他地方使用，以垂直分隔内容。要在列表中的项之间创建一个像素的分隔符，请考虑使用ListTile.divideTiles，它针对此情况进行了优化。

盒子的总高度由高度控制。从高度自动计算适当的填充。''';

  @override
  _DividerDemoState createState() => _DividerDemoState();
}

class _DividerDemoState extends ExampleState<DividerDemo> {
  DividerSetting setting;

  @override
  void initState() {
    setting = DividerSetting(
      height: doubleXlargeValues[0],
      indent: doubleMiniValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Divider(
        height: ${setting.height?.label??''},
        indent: ${setting.indent?.label??''},
        color: ${setting.color?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(selectList: doubleXlargeValues, title: StringParams.kHeight, value: setting.height,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(height: value);
        });
      },),
      DropDownValueTitleWidget(selectList: doubleMiniValues, title: StringParams.kIndent, value: setting.indent,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(indent: value);
          });
        },),
    ];
  }

  @override
  String getTitle() {
    return 'Divider';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Divider(
        height: setting.height?.value,
        indent: setting.indent?.value,
        color: setting.color?.value,
      ),
    );
  }
}

class DividerSetting {
  final Value<double> height;
  final Value<double> indent;
  final Value<Color> color;

  DividerSetting({this.height, this.indent, this.color});

  DividerSetting copyWith({
    Value<double> height,
    Value<double> indent,
    Value<Color> color,
  }) {
    return DividerSetting(
      height: height ?? this.height,
      indent: indent ?? this.indent,
      color: color ?? this.color,
    );
  }
}
