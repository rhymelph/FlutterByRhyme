import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class WrapDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Wrap';
  final String detail =
      '''一个小部件，以多个水平或垂直运行方式显示其子项。

A Wrap布置每个孩子并尝试将孩子放在主轴上与前一个孩子相邻，由方向给定， 在两者之间留出间隔空间。如果没有足够的空间来容纳孩子，Wrap 会在横轴上的现有子项旁边创建一个新的运行。

在将所有子项分配给运行后，运行中的子项将根据主轴中的对齐方式并根据横轴中的crossAxisAlignment进行定位。

然后根据runSpacing和runAlignment将运行本身定位在十字轴上 。''';

  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends ExampleState<WrapDemo> {
  WrapSetting setting;

  @override
  void initState() {
    setting = WrapSetting(
        direction: axisValues[0],
        alignment: wrapAlignmentValues[0],
        spacing: doubleXlargeValues[0],
        runAlignment: wrapAlignmentValues[0],
        runSpacing: doubleXlargeValues[0],
        crossAxisAlignment: wrapCrossAlignmentValues[0],
        verticalDirection: verticalDirectionValues[0],
        children: Value(
          value: <Widget>[
            Chip(
              label: Text('Chip1'),
              avatar: Icon(Icons.textsms),
            ),
            Chip(
              label: Text('Chip2'),
              avatar: Icon(Icons.textsms),
            ),
            Chip(
              label: Text('Chip3'),
              avatar: Icon(Icons.textsms),
            ),
            Chip(
              label: Text('Chip4'),
              avatar: Icon(Icons.textsms),
            ),
            Chip(
              label: Text('Chip5'),
              avatar: Icon(Icons.textsms),
            ),
            Chip(
              label: Text('Chip6'),
              avatar: Icon(Icons.textsms),
            ),
          ],
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Wrap(
      direction: ${setting.direction?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
      spacing: ${setting.spacing?.label ?? ''},
      runAlignment: ${setting.runAlignment?.label ?? ''},
      runSpacing: ${setting.runSpacing?.label ?? ''},
      crossAxisAlignment: ${setting.crossAxisAlignment?.label ?? ''},
      textDirection: ${setting.textDirection?.label ?? ''},
      verticalDirection: ${setting.verticalDirection?.label ?? ''},
      children: ${setting.children?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDirection),
      RadioGroupWidget(setting.direction, axisValues, (value) {
        setState(() {
          setting = setting.copyWith(direction: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, wrapAlignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kRunAlignment),
      RadioGroupWidget(setting.runAlignment, wrapAlignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(runAlignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kCrossAxisAlignment),
      RadioGroupWidget(setting.crossAxisAlignment, wrapCrossAlignmentValues,
          (value) {
        setState(() {
          setting = setting.copyWith(crossAxisAlignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues,
              (value) {
            setState(() {
              setting = setting.copyWith(textDirection: value);
            });
          }),
      ValueTitleWidget(StringParams.kVerticalDirection),
      RadioGroupWidget(setting.verticalDirection, verticalDirectionValues,
              (value) {
            setState(() {
              setting = setting.copyWith(verticalDirection: value);
            });
          }),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kRunSpacing,
        value: setting.runSpacing,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(runSpacing: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kSpecing,
        value: setting.spacing,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(spacing: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Wrap';
  }

  @override
  Widget getWidget() {
    return Wrap(
      direction: setting.direction?.value,
      alignment: setting.alignment?.value,
      spacing: setting.spacing?.value,
      runAlignment: setting.runAlignment?.value,
      runSpacing: setting.runSpacing?.value,
      crossAxisAlignment: setting.crossAxisAlignment?.value,
      textDirection: setting.textDirection?.value,
      verticalDirection: setting.verticalDirection?.value,
      children: setting.children?.value,
    );
  }
}

class WrapSetting {
  final Value<Axis> direction;
  final Value<WrapAlignment> alignment;
  final Value<double> spacing;
  final Value<WrapAlignment> runAlignment;
  final Value<double> runSpacing;
  final Value<WrapCrossAlignment> crossAxisAlignment;
  final Value<TextDirection> textDirection;
  final Value<VerticalDirection> verticalDirection;
  final Value<List<Widget>> children;

  WrapSetting({
    this.direction,
    this.alignment,
    this.spacing,
    this.runAlignment,
    this.runSpacing,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.children,
  });

  WrapSetting copyWith({
    Value<Axis> direction,
    Value<WrapAlignment> alignment,
    Value<double> spacing,
    Value<WrapAlignment> runAlignment,
    Value<double> runSpacing,
    Value<WrapCrossAlignment> crossAxisAlignment,
    Value<TextDirection> textDirection,
    Value<VerticalDirection> verticalDirection,
    Value<List<Widget>> children,
  }) {
    return WrapSetting(
      direction: direction ?? this.direction,
      alignment: alignment ?? this.alignment,
      spacing: spacing ?? this.spacing,
      runAlignment: runAlignment ?? this.runAlignment,
      runSpacing: runSpacing ?? this.runSpacing,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      textDirection: textDirection ?? this.textDirection,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      children: children ?? this.children,
    );
  }
}
