import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ScrollbarDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/Scrollbar';
  final String detail = '''材质设计滚动条。

滚动条指示Scrollable小部件的哪个部分实际可见。

动态更改为iOS平台上类似CupertinoScrollbar的iOS样式滚动条 。

要将滚动条添加到ScrollView，只需将滚动视图窗口小部件包装在Scrollbar小部件中。''';

  @override
  _ScrollbarDemoState createState() => _ScrollbarDemoState();
}
class _ScrollbarDemoState extends ExampleState<ScrollbarDemo> {
  ScrollbarSetting setting;

  @override
  void initState() {
    setting = ScrollbarSetting(
      child: Value(
        value: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Text('F'),
              ),
              title: Text('Flutter'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('D'),
              ),
              title: Text('Dart'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('A'),
              ),
              title: Text('Android'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('I'),
              ),
              title: Text('IOS'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('K'),
              ),
              title: Text('Kotlin'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('O'),
              ),
              title: Text('Object-C'),
            ),
          ],
        ),

        label: '''ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text('F'),
                ),
                title: Text('Flutter'),
              ),
              //...
            ],
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
    return '''Scrollbar(
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'Scrollbar';
  }

  @override
  Widget getWidget() {
    return Scrollbar(
      child: setting.child?.value,
    );
  }
}

class ScrollbarSetting {
  final Value<Widget> child;

  ScrollbarSetting({
    this.child,
  });

  ScrollbarSetting copyWith({
    Value<Widget> child,
  }) {
    return ScrollbarSetting(
      child: child ?? this.child,
    );
  }
}
