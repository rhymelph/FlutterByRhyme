import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FractionallySizedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/FractionallySizedBox';
  final String detail =
      '''A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.
See also:
Align, which sizes itself based on its child's size and positions the child according to an Alignment value.
OverflowBox, a widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.
The catalog of layout widgets.''';

  @override
  _FractionallySizedBoxDemoState createState() =>
      _FractionallySizedBoxDemoState();
}

class _FractionallySizedBoxDemoState
    extends ExampleState<FractionallySizedBoxDemo> {
  FractionallySizedBoxSetting setting;

  @override
  void initState() {
    setting = FractionallySizedBoxSetting(
      widthFactor: doubleOneValues[0],
      heightFactor: doubleOneValues[0],
      alignment: alignmentValues[0],
      child: Value(
        value: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
    return '''FractionallySizedBox(
      widthFactor: ${setting.widthFactor?.label ?? ''},
      heightFactor: ${setting.heightFactor?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleOneValues,
        title: StringParams.kWidthFactor,
        value: setting.widthFactor,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(widthFactor: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleOneValues,
        title: StringParams.kHeightFactor,
        value: setting.heightFactor,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(heightFactor: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'FractionallySizedBox';
  }

  @override
  Widget getWidget() {
    return FractionallySizedBox(
      widthFactor: setting.widthFactor?.value,
      heightFactor: setting.heightFactor?.value,
      alignment: setting.alignment?.value,
    );
  }
}

class FractionallySizedBoxSetting {
  final Value<double> widthFactor;
  final Value<double> heightFactor;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;

  FractionallySizedBoxSetting({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
    this.child,
  });

  FractionallySizedBoxSetting copyWith({
    Value<double> widthFactor,
    Value<double> heightFactor,
    Value<AlignmentGeometry> alignment,
  }) {
    return FractionallySizedBoxSetting(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
    );
  }
}
