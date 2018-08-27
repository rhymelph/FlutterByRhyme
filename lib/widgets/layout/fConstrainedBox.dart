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
      child:  Value(
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
    return '''ConstrainedBox(
      constraints: ${setting.constraints?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('constraints'),
      RadioListTile(value: setting.constraints, groupValue: constraintValues, onChanged: (value){
        setState(() {
          setting=setting.copyWith(constraints: value);
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
  }) {
    return ConstrainedBoxSetting(
      constraints: constraints??this.constraints,
    );
  }
}
