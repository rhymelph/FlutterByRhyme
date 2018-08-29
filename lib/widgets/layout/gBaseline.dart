import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BaselineDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Baseline';
  final String detail =
      '''A widget that positions its child according to the child's baseline.
This widget shifts the child down such that the child's baseline (or the bottom of the child, if the child has no baseline) is baseline logical pixels below the top of this box, then sizes this box to contain the child. If baseline is less than the distance from the top of the child to the baseline of the child, then the child is top-aligned instead.
See also:
Align, a widget that aligns its child within itself and optionally sizes itself based on the child's size.
Center, a widget that centers its child within itself.
The catalog of layout widgets.''';

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
