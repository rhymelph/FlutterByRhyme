import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTabScaffoldDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabScaffold';
  final String detail = '';

  @override
  _CupertinoTabScaffoldDemoState createState() =>
      _CupertinoTabScaffoldDemoState();
}

class _CupertinoTabScaffoldDemoState
    extends ExampleState<CupertinoTabScaffoldDemo> {
  CupertinoTabScaffoldSetting setting;

  @override
  void initState() {
    setting = CupertinoTabScaffoldSetting(
        tabBar: Value(
            value: CupertinoTabBar(
              items: bottomNavigationBarItemValues[0].value,
              currentIndex: 0,
            ),
            label: '''CupertinoTabBar(
              items: bottomNavigationBarItemValues[0].value,
              currentIndex: 0,
            )'''),
        tabBuilder: Value(
          value: (BuildContext context, int index) {
            return Center(
              child: Text('Tab No. $index'),
            );
          },
          label: '''(BuildContext context, int index) {
            return Center(
              child: Text('Tab No. \$index'),
            );
          }''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoTabScaffold(
      tabBuilder: ${setting.tabBuilder?.label??''},
      tabBar: ${setting.tabBar?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      Center(child: Text('无参数选，请看示例代码！')),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoTabScaffold';
  }

  @override
  Widget getWidget() {
    return CupertinoTabScaffold(
      tabBuilder: setting.tabBuilder?.value,
      tabBar: setting.tabBar?.value,
    );
  }
}

class CupertinoTabScaffoldSetting {
  final Value<CupertinoTabBar> tabBar;
  final Value<IndexedWidgetBuilder> tabBuilder;

  CupertinoTabScaffoldSetting({
    this.tabBar,
    this.tabBuilder,
  });

  CupertinoTabScaffoldSetting copyWith({
    Value<CupertinoTabBar> tabBar,
    Value<IndexedWidgetBuilder> tabBuilder,
  }) {
    return CupertinoTabScaffoldSetting(
      tabBar: tabBar ?? this.tabBar,
      tabBuilder: tabBuilder ?? this.tabBuilder,
    );
  }
}
