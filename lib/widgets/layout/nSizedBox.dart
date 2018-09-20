import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';


class SizedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/SizedBox';
  final String detail = '''具有指定大小的框。

如果给孩子，这个小部件会强制其子项具有特定的宽度和/或高度（假设此小部件的父级允许值）。如果宽度或高度为null，则此窗口小部件将自行调整大小以匹配该维度中子项的大小。

如果没有给孩子，这个小部件将自己调整到给定的宽度和高度，将空值视为零。

该新SizedBox.expand构造可以用来制造SizedBox该尺寸本身，以适应父。它相当于将宽度和 高度设置为double.infinity。''';

  @override
  _SizedBoxDemoState createState() =>
      _SizedBoxDemoState();
}

class _SizedBoxDemoState
    extends ExampleState<SizedBoxDemo> {
  SizedBoxSetting setting;

  @override
  void initState() {
    setting = SizedBoxSetting(
      width: doubleXlargeValues[0],
      height:  doubleXlargeValues[0],
      child: Value(
        value: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        label: '''DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          )''',
      )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''SizedBox(
      width: ${setting.width?.label??''},
      height: ${setting.height?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kWidth,
        value: setting.width,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(width: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kHeight,
        value: setting.height,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(height: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'SizedBox';
  }

  @override
  Widget getWidget() {
    return Center(
      child: SizedBox(
        width: setting.width?.value,
        height: setting.height?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class SizedBoxSetting {
  final Value<double> width;
  final Value<double> height;
  final Value<Widget> child;
  SizedBoxSetting({
    this.width,
    this.height,
    this.child,
  });

  SizedBoxSetting copyWith({
    Value<double> width,
    Value<double> height,
    Value<Widget> child,
  }) {
    return SizedBoxSetting(
      width: width??this.width,
      height: height??this.height,
      child: child??this.child,
    );
  }
}
