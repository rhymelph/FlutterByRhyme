import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';


class SizedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/SizedBox';
  final String detail = '''A box with a specified size.
If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget's parent). If either the width or height is null, this widget will size itself to match the child's size in that dimension.
If not given a child, this widget will size itself to the given width and height, treating nulls as zero.
The new SizedBox.expand constructor can be used to make a SizedBox that sizes itself to fit the parent. It is equivalent to setting width and height to double.infinity.''';

  @override
  _SizedBoxDemoState createState() =>
      _SizedBoxDemoState();
}

class _SizedBoxDemoState
    extends ExampleState<SizedBoxDemo> {
  SizedBoxSetting setting;

  @override
  void initState() {
    setting = SizedBoxSetting(
      width: doubleXlargeValues[0],
      height:  doubleXlargeValues[0],
      child: Value(
        value: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        label: '''DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          )''',
      )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''SizedBox(
      width: ${setting.width?.label??''},
      height: ${setting.height?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kWidth,
        value: setting.width,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(width: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kHeight,
        value: setting.height,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(height: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'SizedBox';
  }

  @override
  Widget getWidget() {
    return Center(
      child: SizedBox(
        width: setting.width?.value,
        height: setting.height?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class SizedBoxSetting {
  final Value<double> width;
  final Value<double> height;
  final Value<Widget> child;
  SizedBoxSetting({
    this.width,
    this.height,
    this.child,
  });

  SizedBoxSetting copyWith({
    Value<double> width,
    Value<double> height,
    Value<Widget> child,
  }) {
    return SizedBoxSetting(
      width: width??this.width,
      height: height??this.height,
      child: child??this.child,
    );
  }
}
