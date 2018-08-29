import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class OffstageDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Offstage';
  final String detail = '''A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.
Animations continue to run in offstage children, and therefore use battery and CPU time, regardless of whether the animations end up being visible.
Offstage can be used to measure the dimensions of a widget without bringing it on screen (yet). To hide a widget from view while it is not needed, prefer removing the widget from the tree entirely rather than keeping it alive in an Offstage subtree.
See also:
Visibility, which can hide a child more efficiently (albeit less subtly).
TickerMode, which can be used to disable animations in a subtree.
The catalog of layout widgets.''';

  @override
  _OffstageDemoState createState() =>
      _OffstageDemoState();
}

class _OffstageDemoState
    extends ExampleState<OffstageDemo> {
  OffstageSetting setting;

  @override
  void initState() {
    setting = OffstageSetting(
      offstage: boolValues[0],
      child: Value(
        value: SizedBox.fromSize(
          size: Size(35.0, 35.0),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        label: '''SizedBox.fromSize(
          size: Size(35.0, 35.0),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
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
    return '''Offstage(
        offstage: ${setting.offstage.label??''},
        child: ${setting.child.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(title: StringParams.kOffstage, value: setting.offstage, onChanged: (value){
        setState(() {
          setting=setting.copyWith(offstage: value);
        });
      })
    ];
  }

  @override
  String getTitle() {
    return 'Offstage';
  }


  @override
  Widget getWidget() {
    return Center(
      child: Offstage(
        offstage: setting.offstage.value,
        child: setting.child.value,
      ),
    );
  }
}

class OffstageSetting {
  final Value<bool> offstage;
  final Value<Widget> child;

  OffstageSetting({
    this.child,
    this.offstage,
  });

  OffstageSetting copyWith({
    Value<bool> offstage,
    Value<Widget> child,
  }) {
    return OffstageSetting(
      offstage: offstage??this.offstage,
      child: child??this.child,
    );
  }
}
