import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class NavigatorDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/Navigator';
  final String detail = '''一个小部件，用于管理具有堆栈规则的一组子小部件。

许多应用程序在其窗口小部件层次结构的顶部附近有一个导航器，以便使用叠加显示其逻辑历史记录，最近访问过的页面可视化地显示在旧页面之上。使用此模式，导航器可以通过在叠加层中移动小部件来直观地从一个页面转换到另一个页面。类似地，导航器可用于通过将对话框窗口小部件放置在当前页面上方来显示对话框。''';

  @override
  _NavigatorDemoState createState() => _NavigatorDemoState();
}

class _NavigatorDemoState extends ExampleState<NavigatorDemo> {
  NavigatorSetting setting;

  @override
  void initState() {
    setting = NavigatorSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return r'''Navigator(
      initialRoute: 'signup/choose_credentials',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'signup/personal_info':
            builder = (BuildContext _) => new CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
            builder = (BuildContext _) => new ChooseCredentialsPage();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    )
    
class ChooseCredentialsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(onTap:(){Navigator.of(context).pushNamed('signup/personal_info');},child: Text('signup/choose_credentials')),
      ),
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: GestureDetector(onTap:(){Navigator.of(context).pushNamed('signup/choose_credentials');},child: Text('signup/personal_info')),
        ));
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'Navigator';
  }

  @override
  Widget getWidget() {
    return Navigator(
      initialRoute: 'signup/choose_credentials',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'signup/personal_info':
            builder = (BuildContext _) => new CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
            builder = (BuildContext _) => new ChooseCredentialsPage();
            break;
          default:
            throw new Exception('Invalid route: ${settings.name}');
        }
        return new MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('signup/personal_info');
            },
            child: Text('signup/choose_credentials')),
      ),
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('signup/choose_credentials');
              },
              child: Text('signup/personal_info')),
        ));
  }
}

class NavigatorSetting {
//    NavigatorSetting({});
//
//    NavigatorSetting copyWith({}){
//    return NavigatorSetting();
//    }
}
