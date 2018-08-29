import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SizedOverflowBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/SizedOverflowBox';
  final String detail =
      '''使用暂未名，一添加child就报错！
A widget that is a specific size but passes its original constraints through to its child, which may then overflow.
See also:
OverflowBox, A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.
ConstrainedBox, a widget that imposes additional constraints on its child.
UnconstrainedBox, a container that tries to let its child draw without constraints.
The catalog of layout widgets.''';

  @override
  _SizedOverflowBoxDemoState createState() => _SizedOverflowBoxDemoState();
}

class _SizedOverflowBoxDemoState extends ExampleState<SizedOverflowBoxDemo> {
  SizedOverflowBoxSetting setting;

  @override
  void initState() {
    setting = SizedOverflowBoxSetting(
      width: doubleXlargeValues[0],
      height: doubleXlargeValues[0],
      alignment: alignmentValues[0],
      size: Value(
        value: Size(doubleXlargeValues[0].value, doubleXlargeValues[0].value),
        label:
            'Size(${doubleXlargeValues[0].label}, ${doubleXlargeValues[0].label})',
      ),
      child: Value(
        value: SizedBox(
          width: 30.0,
          height: 30.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        label: '''SizedBox(
          width: 20.0,
          height: 30.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
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
    return '''SizedOverflowBox(
      size: ${setting.size?.label ?? ''},
      child: ${setting.child?.label ?? ''},
      alignment: ${setting.alignment?.label ?? ''},
    )''';
  }

  _getSize() {
    return Value(
      value: Size(
        setting.width?.value,
        setting.height.value,
      ),
      label:
          'Size(${setting.width?.label ?? 0}, ${setting.height.label ?? 0},)',
    );
  }

  bool isExpanded = false;

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
          isExpanded: isExpanded,
          titleWidget: ValueTitleWidget(StringParams.kSize),
          hintWidget: Column(
            children: <Widget>[
              DropDownValueTitleWidget(
                selectList: doubleXlargeValues,
                title: StringParams.kWidth,
                value: setting.width,
                onChanged: (value) {
                  setting = setting.copyWith(width: value);
                  setState(() {
                    setting = setting.copyWith(size: _getSize());
                  });
                },
              ),
              DropDownValueTitleWidget(
                selectList: doubleXlargeValues,
                title: StringParams.kHeight,
                value: setting.height,
                onChanged: (value) {
                  setting = setting.copyWith(height: value);
                  setState(() {
                    setting = setting.copyWith(size: _getSize());
                  });
                },
              ),
            ],
          ),
          onChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'SizedOverflowBox';
  }

  @override
  Widget getWidget() {
    return SizedOverflowBox(
      size: setting.size?.value,
      child: setting.child?.value,
      alignment: setting.alignment?.value,
    );
  }
}

class SizedOverflowBoxSetting {
  final Value<double> width;
  final Value<double> height;
  final Value<Size> size;
  final Value<Widget> child;
  final Value<AlignmentGeometry> alignment;

  SizedOverflowBoxSetting({
    this.width,
    this.height,
    this.size,
    this.child,
    this.alignment,
  });

  SizedOverflowBoxSetting copyWith({
    Value<double> width,
    Value<double> height,
    Value<Size> size,
    Value<Widget> child,
    Value<AlignmentGeometry> alignment,
  }) {
    return SizedOverflowBoxSetting(
      width: width ?? this.width,
      height: height ?? this.height,
      size: size ?? this.size,
      child: child ?? this.child,
      alignment: alignment ?? this.alignment,
    );
  }
}
