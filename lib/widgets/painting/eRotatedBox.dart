import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RotatedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/RotatedBox';
  final String detail = '''一个小部件，可以将其子项旋转整数个四分之一圈。

与在绘制之前应用变换的Transform不同，此对象在布局之前应用其旋转，这意味着整个旋转的框仅消耗旋转子项所需的空间。''';

  @override
  _RotatedBoxDemoState createState() => _RotatedBoxDemoState();
}

class _RotatedBoxDemoState extends ExampleState<RotatedBoxDemo> {
  RotatedBoxSetting setting;

  @override
  void initState() {
    setting = RotatedBoxSetting(
        child: Value(
          value: Image.asset('images/burgers.jpg'),
          label: "Image.asset('images/burgers.jpg')",
        ),
        quarterTurns: intMiniValues[1]);
    super.initState();
  }


  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''RotatedBox(
      child: ${setting.child?.label ?? ''},
      quarterTurns: ${setting.quarterTurns?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget<int>(
        title: StringParams.kQuarterTurns,
        selectList: intMiniValues,
        value: setting.quarterTurns,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(quarterTurns: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'RotatedBox';
  }

  @override
  Widget getWidget() {
    return pushWidget();
  }

  pushWidget(){
    return new RotatedBox(
      child: setting.child?.value,
      quarterTurns: setting.quarterTurns?.value,
    );
  }
}

class RotatedBoxSetting {
  final Value<int> quarterTurns;
  final Value<Widget> child;

  RotatedBoxSetting({
    this.quarterTurns,
    this.child,
  });

  RotatedBoxSetting copyWith({Value<int> quarterTurns}) {
    return RotatedBoxSetting(
      quarterTurns: quarterTurns ?? this.quarterTurns,
    );
  }
}
