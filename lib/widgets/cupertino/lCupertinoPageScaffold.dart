import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoPageScaffoldDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoPageScaffold';
  final String detail = '''实现单个iOS应用程序页面的布局。

脚手架在顶部布置导航栏，在导航栏之间或之后布置内容。
''';

  @override
  _CupertinoPageScaffoldDemoState createState() =>
      _CupertinoPageScaffoldDemoState();
}

class _CupertinoPageScaffoldDemoState
    extends ExampleState<CupertinoPageScaffoldDemo> {
  CupertinoPageScaffoldSetting setting;

  @override
  void initState() {
    setting = CupertinoPageScaffoldSetting(
      child: Value(
        value: Center(child: Text('Body')),
        label: "Center(child: Text('Body'))",
      ) ,
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoPageScaffold(
      child: ${setting.child?.label??''},
      navigationBar: ${setting.navigationBar?.label??''},
      backgroundColor: ${setting.backgroundColor?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kNavigationBar,
        onPressed: () async {
          dynamic changeValue= await Navigator.pushNamed(context, 'widgets/cupertino/CupertinoNavigationBar');
          if(changeValue!=null){
            setState(() {
              setting=setting.copyWith(navigationBar: changeValue);
            });
          }
        },
      ),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoPageScaffold';
  }

  @override
  Widget getWidget() {
    return CupertinoPageScaffold(
      child: setting.child?.value,
      navigationBar: setting.navigationBar?.value,
      backgroundColor: setting.backgroundColor?.value,
    );
  }
}

class CupertinoPageScaffoldSetting {
  final Value<ObstructingPreferredSizeWidget> navigationBar;
  final Value<Color> backgroundColor;
  final Value<Widget> child;

  CupertinoPageScaffoldSetting({
    this.navigationBar,
    this.backgroundColor,
    this.child,
  });

  CupertinoPageScaffoldSetting copyWith({
    Value<ObstructingPreferredSizeWidget> navigationBar,
    Value<Color> backgroundColor,
    Value<Widget> child,
  }) {
    return CupertinoPageScaffoldSetting(
      navigationBar: navigationBar??this.navigationBar,
      backgroundColor: backgroundColor??this.backgroundColor,
      child: child??this.child,
    );
  }
}
