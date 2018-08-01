import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/markdown_dart_code.dart';
class WidgetsAppDemo extends StatelessWidget {
  static const String routeName='widgets/material/WidgetsApp';
  static const String detail='''> 未经过改装的MaterialApp,
> 可以说MaterialApp基于WidgetsApp

## 与MaterialApp相比
> 18个相同字段:

| 字段|类型| 
| - | - |
| navigatorKey（导航键） | GlobalKey<NavigatorState> | 
| onGenerateRoute（生成路由）| RouteFactory | 
| onUnknownRoute（未知路由）| RouteFactory | 
| navigatorObservers（导航观察器） | List<NavigatorObserver> | 
| initialRoute（初始路由） | String | 
| builder（建造者）| TransitionBuilder | 
| title（标题） | String | 
| onGenerateTitle（生成标题） | GenerateAppTitle | 
| color（颜色） | Color | 
| locale(地点) | Locale | 
| localizationsDelegates（本地化委托） | Iterable<LocalizationsDelegate<dynamic>> | 
| localeResolutionCallback（区域分辨回调） | LocaleResolutionCallback  | 
| supportedLocales（支持区域） | Iterable<Locale> | 
| showPerformanceOverlay（显示性能叠加） | bool | 
| checkerboardRasterCacheImages（棋盘格光栅缓存图像） | bool | 
| checkerboardOffscreenLayers（棋盘格层） | bool | 
| showSemanticsDebugger（显示语义调试器） | bool | 
| debugShowCheckedModeBanner（调试显示检查模式横幅） | bool | 

> WidgetsApp特有的字段：

| 字段|类型| 
| - | - |
| textStyle（文字样式） | TextStyle | 
| debugShowWidgetInspector（调试小部件检测） | bool | 
| inspectorSelectButtonBuilder（审查员选择按钮生成器） | InspectorSelectButtonBuilder | 

> MaterialApp特有的字段：

| 字段|类型| 
| - | - |
| home（主页） | Widget | 
| routes（路由） | Map<String, WidgetBuilder> | 
| theme（主题） | ThemeData | 
| debugShowMaterialGrid（调试显示材质网格） | bool | 

> 先来介绍WidgetsApp特有的字段吧！
## 1. textStyle
> 为应用中的文本使用的默认样式
### 使用
```dart
//该段代码源自flutter/material/app.dart
//因为MaterialApp都是使用Theme里面的主题色，并且一般部件使用的是MaterialApp部件，所以该textStyle为报错文字的颜色
const TextStyle _errorTextStyle= const TextStyle(
  color: const Color(0xD0FF0000),
  fontFamily: 'monospace',
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  decoration: TextDecoration.underline,
  decorationColor: const Color(0xFFFFFF00),
  decorationStyle: TextDecorationStyle.double,
  debugLabel: 'fallback style; consider putting your text in a Material',
);
new WidgetsApp(
      color: Colors.grey,
      textStyle: _myTextStyle ,
    );
```

## 2. debugShowWidgetInspector
> 当为true时，打开检查覆盖，该字段只能在检查模式下可用

## 3. inspectorSelectButtonBuilder
> 构建一个视图与视图切换的小部件，可以通过该小部件或按钮切换到检查模式（debugShowWidgetInspector==true时才有效，点击该按钮之后再点击你要检查的视图）
```dart
new WidgetsApp(
      debugShowWidgetInspector: true,
      inspectorSelectButtonBuilder: (BuildContext context, VoidCallback onPressed) {
          return new FloatingActionButton(
            child: const Icon(Icons.search),
            onPressed: onPressed,
            mini: true,
          );
        },
    );
```
> 现在介绍一下MaterialApp特有的字段究竟对WidgetsApp做了什么？

## 4. home
> 该字段在MaterialApp中调用的是WidgetsApp的onGenerateRoute
> 当参数setting.name为Navigator.defaultRouteName(即"/")时返回home的Widget
> 所以可以推测当程序启动时，会调用一个以"/"为路由名的Widget
> 下面来看一段源码
```dart
  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    WidgetBuilder builder;
//判断当前home字段不为空，而且name为Navigator.defaultRouteName
//返回home字段的Widget
    if (name == Navigator.defaultRouteName && widget.home != null) {
      builder = (BuildContext context) => widget.home;
    } else {
//这里查找路由对应的Widget，即为routes字段传入的map
      builder = widget.routes[name];
    }
    if (builder != null) {
//可以看到默认是使用MaterialPageRoute的切换界面动画
      return new MaterialPageRoute<dynamic>(
        builder: builder,
        settings: settings,
      );
    }
    if (widget.onGenerateRoute != null)
      return widget.onGenerateRoute(settings);
    return null;
  }
//下面这里有部分省略
    new WidgetsApp(
        onGenerateRoute: _haveNavigator ? _onGenerateRoute : null,
      )
```

## 5. routes
> 这个字段上面源码已经解释的很清楚
> 就是在 _onGenerateRoute方法里面查找合适的路由
> 查找不到才在自身字段onGenerateRoute里面查找

## 6. theme
> 该主题主要传入到AnimatedTheme这个部件中，最终传入Theme
> 用于作为MaterialAPP里面的Widget的主题
> 一般使用BottomNavigationBar、AppBar这些部件，会应用到这个主题
```dart
//如果为空使用默认光亮主题
final ThemeData theme = widget.theme ?? new ThemeData.fallback();
//factory ThemeData.fallback() => new ThemeData.light();
    Widget result = new AnimatedTheme(
      data: theme,
      isMaterialAppTheme: true,
      child: new WidgetsApp(
        key: new GlobalObjectKey(this),
      //..........
      )
    );
```

## 7. debugShowMaterialGrid
> 该字段开启后，会在WidgetsApp外层包裹GridPaper，这个部件主要显示网格
```dart
 assert(() {
      if (widget.debugShowMaterialGrid) {
        result = new GridPaper(
          color: const Color(0xE0F9BBE0),
          interval: 8.0,
          divisions: 2,
          subdivisions: 1,
          child: result,
        );
      }
      return true;
    }());
```
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WidgetsApp'),
      ),
      body: SingleChildScrollView(
        child: DartMarkDown(WidgetsAppDemo.detail),
      ),
    );;

  }
}
