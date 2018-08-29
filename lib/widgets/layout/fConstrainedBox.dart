import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class ConstrainedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/ConstrainedBox';
  final String detail = '''A widget that imposes additional constraints on its child.
For example, if you wanted child to have a minimum height of 50.0 logical pixels, you could use const BoxConstraints(minHeight: 50.0) as the constraints.
Sample code
This snippet makes the child widget (a Card with some Text) fill the parent, by applying BoxConstraints.expand constraints:''';

  @override
  _ConstrainedBoxDemoState createState() =>
      _ConstrainedBoxDemoState();
}

class _ConstrainedBoxDemoState
    extends ExampleState<ConstrainedBoxDemo> {
  ConstrainedBoxSetting setting;

  @override
  void initState() {
    setting = ConstrainedBoxSetting(
      constraints: constraintValues[0],
      child:  _formatValue(),
    );
    super.initState();
  }

  Widget _formatWidget(){
    return ConstrainedBox(
      constraints: setting?.constraints?.value??constraintValues[0].value,
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
    return '''ConstrainedBox(
      constraints: ${setting?.constraints?.label??constraintValues[0].label},
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
    return setting.child?.label;
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kConstraints),
      RadioGroupWidget(setting.constraints, constraintValues, (value) {
        setting = setting.copyWith(constraints: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ConstrainedBox';
  }


  @override
  Widget getWidget() {
    return ConstrainedBox(
      constraints: setting.constraints?.value,
      child: setting.child?.value,
    );
  }
}

class ConstrainedBoxSetting {
  final Value<BoxConstraints> constraints;
  final Value<Widget> child;
  ConstrainedBoxSetting({
    this.constraints,
    this.child,
  });
  ConstrainedBoxSetting copyWith({
    Value<BoxConstraints> constraints,
    Value<Widget> child,
  }) {
    return ConstrainedBoxSetting(
      constraints: constraints??this.constraints,
      child: child??this.child,
    );
  }
}
