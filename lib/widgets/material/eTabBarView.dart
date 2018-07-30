import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TabBarViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TabBarView';
  final String detail = '''A page view that displays the widget which corresponds to the currently selected tab. Typically used in conjunction with a TabBar.
If a TabController is not provided, then there must be a DefaultTabController ancestor.''';
  @override
  _TabBarViewDemoState createState() => _TabBarViewDemoState();
}

class _TabBarViewDemoState extends ExampleState<TabBarViewDemo>
    with SingleTickerProviderStateMixin {
  TabController controller;

  TabBarViewSetting setting;

  @override
  void initState() {
    controller = TabController(
      length: tabValues[0].value.length,
      vsync: this,
    );
    setting = TabBarViewSetting();

    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''class MyTabBarView extends StatefulWidget {
  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(
      length: 1,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: controller,
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.green,
        tabs: [
          Tab(text: '1'),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Text('1'),
        ],
        physics: ${setting.physics?.label??''},
      ),
    );
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kPhysics),
      RadioGroupWidget<ScrollPhysics>(setting.physics, physicsValues, (value) {
        setState(() {
          setting = setting.copyWith(physics: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'TabBarView';
  }

  _getChildren() {
    int i = 0;
    return tabValues[0].value.map((v) {
      Widget w = Container(
        alignment: Alignment.center,
        color: colorValues[i].value,
        child: Text('Page${i + 1}'),
      );
      i++;
      return w;
    }).toList();
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: TabBar(
        controller: controller,
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.green,
        tabs: tabValues[0].value,
      ),
      body: TabBarView(
        controller: controller,
        children: _getChildren(),
        physics: setting.physics?.value,
      ),
    );
  }
}

class TabBarViewSetting {
  final Value<ScrollPhysics> physics;

  TabBarViewSetting({this.physics});

  TabBarViewSetting copyWith({
    Value<List<Widget>> children,
    Value<ScrollPhysics> physics,
  }) {
    return TabBarViewSetting(
      physics: physics ?? this.physics,
    );
  }
}

