import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IntrinsicHeightDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IntrinsicHeight';
  final String detail = '''''';

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
