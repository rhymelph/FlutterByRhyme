import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BaselineDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Baseline';
  final String detail =
      '''根据孩子的基线定位孩子的小部件。

此窗口小部件将子项向下移动，使子项的基线（或子项的底部，如果子项没有基线）是 此框顶部下方的基线逻辑像素，然后调整此框的大小以包含子项。如果基线小于从孩子的顶部到孩子的基线的距离，则孩子是顶部对齐的。''';

  @override
  _BaselineDemoState createState() => _BaselineDemoState();
}

class _BaselineDemoState extends ExampleState<BaselineDemo> {
  BaselineSetting setting;

  @override
  void initState() {
    setting = BaselineSetting(
      baseline: doubleXlargeValues[0],
      baselineType: TextBaselineValues[0],
      child: Value(
        value: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        label: '''SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        )''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Baseline(
      baselineType: ${setting.baselineType.label ?? ''},
      baseline: ${setting.baseline?.label ?? ''},
      child: ${setting.child?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTextBaseline),
      RadioGroupWidget(setting.baselineType, TextBaselineValues, (value) {
        setState(() {
          setting = setting.copyWith(baselineType: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kBaseline,
        value: setting.baseline,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(baseline: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Baseline';
  }

  @override
  Widget getWidget() {
    return Baseline(
      baselineType: setting.baselineType.value,
      baseline: setting.baseline?.value,
      child: setting.child?.value,
    );
  }
}

class BaselineSetting {
  final Value<Widget> child;
  final Value<TextBaseline> baselineType;
  final Value<double> baseline;

  BaselineSetting(
      {@required this.baseline, @required this.baselineType, this.child});

  BaselineSetting copyWith({
    Value<Widget> child,
    Value<TextBaseline> baselineType,
    Value<double> baseline,
  }) {
    return BaselineSetting(
      child: child ?? this.child,
      baseline: baseline ?? this.baseline,
      baselineType: baselineType ?? this.baselineType,
    );
  }
}
