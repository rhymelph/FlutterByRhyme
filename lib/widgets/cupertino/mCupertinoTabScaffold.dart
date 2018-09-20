import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTabScaffoldDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabScaffold';
  final String detail = '''实现选项卡式iOS应用程序的根布局和行为结构。

支架布置底部的标签栏和标签栏之间或之后的内容。

需要tabBar和tabBuilder。该CupertinoTabScaffold 会自动监听提供CupertinoTabBar的自来水回调更改活动标签。

选项卡的内容是使用活动选项卡索引处提供的tabBuilder构建的。该tabBuilder必须能够建立相同数量的网页，因为有tabBar.items。非活动选项卡将移至Offstage， 并禁用其动画。

使用CupertinoTabView作为每个选项卡的内容，以支持具有并行导航状态和历史记录的选项卡。''';

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
