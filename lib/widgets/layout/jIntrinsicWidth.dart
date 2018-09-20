import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IntrinsicWidthDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IntrinsicWidth';
  final String detail = '''一个小部件，可以将其子级调整为子级的内部宽度。

将孩子的宽度调整为孩子的最大内在宽度。如果 stepWidth为非null，则子项的宽度将捕捉到stepWidth的倍数。同样，如果stepHeight为非null，则子项的高度将捕捉到stepHeight的倍数。

这个类很有用，例如，当无限宽度可用时，你想要一个孩子，否则他们会尝试无限扩展，而不是将自己的大小调整到更合理的宽度。

这个类相对昂贵，因为它在最终布局阶段之前添加了一个推测布局传递。尽可能避免使用它。在最坏的情况下，这个小部件可以导致树的深度为O（N²）的布局。''';

  @override
  _IntrinsicWidthDemoState createState() =>
      _IntrinsicWidthDemoState();
}

class _IntrinsicWidthDemoState extends ExampleState<IntrinsicWidthDemo> {
  IntrinsicWidthSetting setting;

  @override
  void initState() {
    setting = IntrinsicWidthSetting(
      stepWidth: doubleXlargeValues[0],
      stepHeight: doubleXlargeValues[0],
      child: _formatValue(),
    );
    super.initState();
  }

  Widget _formatWidget(){
    return IntrinsicWidth(
      stepHeight: setting?.stepHeight?.value??doubleXlargeValues[0].value,
      stepWidth: setting?.stepWidth?.value??doubleXlargeValues[0].value,
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    );
  }

  String _formatLabel(){
    return '''IntrinsicWidth(
      stepWidth: ${setting?.stepWidth?.label??doubleXlargeValues[0].label},
      stepHeight: ${setting?.stepHeight?.label??doubleXlargeValues[0].label},
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    )''';
  }

  Value<Widget> _formatValue(){
    return Value(
      value: _formatWidget(),
      label: _formatLabel(),
    );
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return setting?.child?.label;
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kStepWidth,
        value: setting.stepWidth,
        onChanged: (value) {
          setting = setting.copyWith(stepWidth: value);
          setState(() {
            setting=setting.copyWith(child: _formatValue());
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kStepHeight,
        value: setting.stepHeight,
        onChanged: (value) {
          setting = setting.copyWith(stepHeight: value);
          setState(() {
            setting=setting.copyWith(child: _formatValue());
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'IntrinsicWidth';
  }

  @override
  Widget getWidget() {
    return setting.child?.value;
  }
}

class IntrinsicWidthSetting {
  final Value<double> stepHeight;
  final Value<double> stepWidth;

  final Value<Widget> child;

  IntrinsicWidthSetting({
    this.child,
    this.stepWidth,
    this.stepHeight,
  });

  IntrinsicWidthSetting copyWith({
    Value<double> stepHeight,
    Value<double> stepWidth,
     Value<Widget> child,

  }){
    return IntrinsicWidthSetting(
      stepHeight: stepHeight??this.stepHeight,
      stepWidth: stepWidth??this.stepWidth,
      child: child??this.child,
    );
  }
}
