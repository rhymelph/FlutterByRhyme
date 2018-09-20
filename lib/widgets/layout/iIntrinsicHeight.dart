import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IntrinsicHeightDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IntrinsicHeight';
  final String detail = '''一个小部件，可以将其子级调整为子级的内在高度。

这个类非常有用，例如，当无限高度可用时，你想要一个孩子，否则他们会尝试无限扩展，而不是将自己的大小调整到更合理的高度。

这个类相对昂贵，因为它在最终布局阶段之前添加了一个推测布局传递。尽可能避免使用它。在最坏的情况下，这个小部件可以导致树的深度为O（N²）的布局。''';

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
