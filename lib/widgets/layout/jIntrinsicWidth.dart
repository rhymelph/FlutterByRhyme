import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IntrinsicWidthDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IntrinsicWidth';
  final String detail = '''A widget that sizes its child to the child's intrinsic width.
Sizes its child's width to the child's maximum intrinsic width. If stepWidth is non-null, the child's width will be snapped to a multiple of the stepWidth. Similarly, if stepHeight is non-null, the child's height will be snapped to a multiple of the stepHeight.
This class is useful, for example, when unlimited width is available and you would like a child that would otherwise attempt to expand infinitely to instead size itself to a more reasonable width.
This class is relatively expensive, because it adds a speculative layout pass before the final layout phase. Avoid using it where possible. In the worst case, this widget can result in a layout that is O(N²) in the depth of the tree.
See also:
The catalog of layout widgets.''';

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
