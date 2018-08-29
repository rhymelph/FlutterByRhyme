import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IntrinsicHeightDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IntrinsicHeight';
  final String detail = '''A widget that sizes its child to the child's intrinsic height.
This class is useful, for example, when unlimited height is available and you would like a child that would otherwise attempt to expand infinitely to instead size itself to a more reasonable height.
This class is relatively expensive, because it adds a speculative layout pass before the final layout phase. Avoid using it where possible. In the worst case, this widget can result in a layout that is O(N²) in the depth of the tree.
See also:
The catalog of layout widgets.''';

  @override
  _IntrinsicHeightDemoState createState() =>
      _IntrinsicHeightDemoState();
}

class _IntrinsicHeightDemoState extends ExampleState<IntrinsicHeightDemo> {
  IntrinsicHeightSetting setting;

  @override
  void initState() {
    setting = IntrinsicHeightSetting(
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
    return '''IntrinsicHeight(
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'IntrinsicHeight';
  }


  @override
  Widget getWidget() {
    return IntrinsicHeight(
      child: setting.child?.value,
    );
  }
}

class IntrinsicHeightSetting {
  final Value<Widget> child;

  IntrinsicHeightSetting({
    this.child,
  });

  IntrinsicHeightSetting copyWith({
    Value<Widget> child,
  }) {
    return IntrinsicHeightSetting(
      child: child ?? this.child,
    );
  }
}
