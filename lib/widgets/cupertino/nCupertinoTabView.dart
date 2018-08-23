import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/markdown_dart_code.dart';
class CupertinoTabViewDemo extends StatelessWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabView';
  static const String detail='''> 5个参数

| 字段|类型| 
| - | - |
| routes（路由） | Map<String, WidgetBuilder> | 
| onGenerateRoute（生成路由）| RouteFactory | 
| onUnknownRoute（未知路由）| RouteFactory | 
| navigatorObservers（导航观察器） | List<NavigatorObserver> | 
| builder（建造者）| TransitionBuilder | 

## 1. routes
> 声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由
> 参数以键值对的形式传递 
> key:路由名字
> value:对应的Widget
### 使用
```dart
new CupertinoTabView(
      routes: {
       '/home':(BuildContext context) => HomePage(),
       '/home/one':(BuildContext context) => OnePage(),
       //....
      },
    );
```
## 2. onGenerateRoute
> 当通过Navigation.of(context).pushNamed跳转路由时，
> 在routes查找不到时，会调用该方法
### 使用
```dart
new CupertinoTabView(
      routes: {
       '/home':(BuildContext context) => HomePage(),
       '/home/one':(BuildContext context) => OnePage(),
       //....
      },
      onGenerateRoute: (setting){
        //setting.isInitialRoute; bool类型 是否初始路由
        //setting.name; 要跳转的路由名key
        return new PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
        //这里为返回的Widget
              return HomePage();
            },
            opaque: false,
        //跳转动画
            transitionDuration: new Duration(milliseconds: 200),
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new ScaleTransition(
                  scale: new Tween<double>(begin: 0.5, end: 1.0)
                      .animate(animation),
                  child: child,
                ),
              );
            });
      }
    );
```
## 3. onUnknownRoute
> 效果跟onGenerateRoute一样
> 调用顺序为onGenerateRoute ==> onUnknownRoute
## 4. navigatorObservers
> 路由观察器，当调用Navigator的相关方法时，会回调相关的操作
### 使用
```dart
new CupertinoTabView(
      navigatorObservers: [
        MyObserver(),
      ],
    );
//继承NavigatorObserver
class MyObserver extends NavigatorObserver{
  @override
  void didPush(Route route, Route previousRoute) {
    // 当调用Navigator.push时回调
    super.didPush(route, previousRoute);
    //可通过route.settings获取路由相关内容
    //route.currentResult获取返回内容
    //....等等
    print(route.settings.name);
  }
}
```
## 5. builder
> 构建一个Widget
### 使用
```dart
new CupertinoTabView(
      builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            //字体大小
                textScaleFactor: 1.4,
              ),
          child: Text('Body'),
        );
      },
    );
```

## 6.最后
> 该部件主要与CupertinoTabScaffold和CupertinoPageScaffold配合使用，一般只有builder参数用上，暂时其它参数用不上，使用如下

```dart
new CupertinoTabScaffold(tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
//      BottomItems

    ]), tabBuilder: (BuildContext context,int index){
      return CupertinoTabView(
        builder: (BuildContext context){
          return CupertinoPageScaffold(
            child: Center(
              child: Text('Body \$index'),
            ),
          );
        },
      );
    })
```

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CupertinoTabView'),
      ),
      body: SingleChildScrollView(
        child: DartMarkDown(CupertinoTabViewDemo.detail),
      ),
    );
  }
}