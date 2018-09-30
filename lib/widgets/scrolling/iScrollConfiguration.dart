import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ScrollConfigurationDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/ScrollConfiguration';
  final String detail = '''控制可滚动窗口小部件在子树中的行为方式。

滚动配置确定子项后代使用的ScrollPhysics和视口装饰。''';

  @override
  _ScrollConfigurationDemoState createState() =>
      _ScrollConfigurationDemoState();
}

class _ScrollConfigurationDemoState
    extends ExampleState<ScrollConfigurationDemo> {
  ScrollConfigurationSetting setting;

  @override
  void initState() {
    setting = ScrollConfigurationSetting(
      child: Value(
        value: ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text('ListTile:$position'),
            );
          },
          itemCount: 30,
        ),
        label: r'''ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text('ListTile:$position'),
              );
            },
            itemCount: 30,
          )''',
      ),
      behavior: Value(
        value: IdeaScrollBehavior(),
        label: 'IdeaScrollBehavior()',
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
    return '''ScrollConfiguration(
      behavior: ${setting.behavior?.label??''},
      child: ${setting.child?.value??''},
    )
    
class IdeaScrollBehavior extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    //构建视窗
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.grey[300],
      ),
      child: child,
    );
  }
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    //滚动物理
    return BouncingScrollPhysics();
  }
  @override
  TargetPlatform getPlatform(BuildContext context) {
    //默认平台
    return super.getPlatform(context);
  }
}
''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'ScrollConfiguration';
  }

  @override
  Widget getWidget() {
    return ScrollConfiguration(
      behavior: setting.behavior?.value,
      child: setting.child?.value,
    );
  }
}

class ScrollConfigurationSetting {
  final Value<ScrollBehavior> behavior;
  final Value<Widget> child;

  ScrollConfigurationSetting({
    this.behavior,
    this.child,
  });

  ScrollConfigurationSetting copyWith({
    Value<ScrollBehavior> behavior,
    Value<Widget> child,
  }) {
    return ScrollConfigurationSetting(
      behavior: behavior??this.behavior,
      child: child??this.child,
    );
  }
}

class IdeaScrollBehavior extends ScrollBehavior{
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    //构建视窗
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.grey[300],
      ),
      child: child,
    );
  }
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    //滚动物理
    return BouncingScrollPhysics();
  }
  @override
  TargetPlatform getPlatform(BuildContext context) {
    //默认平台
    return super.getPlatform(context);
  }
}
