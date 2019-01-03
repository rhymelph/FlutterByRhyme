import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class MaterialAppDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/MaterialApp';
  static const String detail = '''> 22个参数
- ceshi 
- cserw
- fdsfew

| 字段|类型| 
| - | - |
| navigatorKey（导航键） | GlobalKey<NavigatorState> | 
| home（主页） | Widget | 
| routes（路由） | Map<String, WidgetBuilder> | 
| initialRoute（初始路由） | String | 
| onGenerateRoute（生成路由）| RouteFactory | 
| onUnknownRoute（未知路由）| RouteFactory | 
| navigatorObservers（导航观察器） | List<NavigatorObserver> | 
| builder（建造者）| TransitionBuilder | 
| title（标题） | String | 
| onGenerateTitle（生成标题） | GenerateAppTitle | 
| color（颜色） | Color | 
| theme（主题） | ThemeData | 
| locale(地点) | Locale | 
| localizationsDelegates（本地化委托） | Iterable<LocalizationsDelegate<dynamic>> | 
| localeResolutionCallback（区域分辨回调） | LocaleResolutionCallback  | 
| supportedLocales（支持区域） | Iterable<Locale> | 
| debugShowMaterialGrid（调试显示材质网格） | bool | 
| showPerformanceOverlay（显示性能叠加） | bool | 
| checkerboardRasterCacheImages（棋盘格光栅缓存图像） | bool | 
| checkerboardOffscreenLayers（棋盘格层） | bool | 
| showSemanticsDebugger（显示语义调试器） | bool | 
| debugShowCheckedModeBanner（调试显示检查模式横幅） | bool | 

## 1. navigatorKey
> navigatorKey.currentState
> 相当于
> Navigator.of(context)
### 使用
```dart
  GlobalKey<NavigatorState> _navigatorKey=new GlobalKey();

  new MaterialApp(
      navigatorKey: _navigatorKey,
    );
```
## 2. home
> 进入程序后显示的第一个页面,传入的是一个Widget，但实际上这个Widget需要包裹一个Scaffold以显示该程序使用Material Design风格
### 使用
```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}
//这是一个可改变的Widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
```
## 3. routes
> 声明程序中有哪个通过Navigation.of(context).pushNamed跳转的路由
> 参数以键值对的形式传递 
> key:路由名字
> value:对应的Widget
### 使用
```dart
new MaterialApp(
      routes: {
       '/home':(BuildContext context) => HomePage(),
       '/home/one':(BuildContext context) => OnePage(),
       //....
      },
    );
```
## 4. initialRoute
> 初始路由，当用户进入程序时，自动打开对应的路由。
> (home还是位于一级)
> 传入的是上面routes的key
> 跳转的是对应的Widget（如果该Widget有Scaffold.AppBar,并不做任何修改，左上角有返回键）
### 使用
```dart
new MaterialApp(
      routes: {
       '/home':(BuildContext context) => HomePage(),
       '/home/one':(BuildContext context) => OnePage(),
       //....
      },
      initialRoute: '/home/one',
    );
```
## 5. onGenerateRoute
> 当通过Navigation.of(context).pushNamed跳转路由时，
> 在routes查找不到时，会调用该方法
### 使用
```dart
new MaterialApp(
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
## 6. onUnknownRoute
> 效果跟onGenerateRoute一样
> 调用顺序为onGenerateRoute ==> onUnknownRoute
## 7. navigatorObservers
> 路由观察器，当调用Navigator的相关方法时，会回调相关的操作
### 使用
```dart
new MaterialApp(
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
## 8. builder
> 当构建一个Widget前调用
> 一般做字体大小，方向，主题颜色等配置
### 使用
```dart
new MaterialApp(
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            //字体大小
                textScaleFactor: 1.4,
              ),
          child: child,
        );
      },
    );
```
## 9. title
> 该标题出现在
> Android：任务管理器的程序快照之上
> IOS: 程序切换管理器中
### 使用
```dart
new MaterialApp(
      title: 'Flutter应用',
    );
```
## 10. onGenerateTitle
> 跟上面的tiitle一样，但含有一个context参数
> 用于做本地化
```dart
new MaterialApp(
      onGenerateTitle: (context){
        return 'Flutter应用';
      },
    );
```
## 11. color
> 该颜色为Android中程序切换中应用图标背景的颜色，当应用图标背景为透明时
### 使用
```dart
new MaterialApp(
      color: Colors.blue,
    )
```
## 12. theme
> 应用程序的主题，各种的定制颜色都可以设置，用于程序主题切换
### 使用
```dart
new MaterialApp(
      theme: new ThemeData(
       //主题色
        primarySwatch: Colors.blue,
      ),
    );
```
## 13. locale
> 当前区域，如果为null则使用系统区域
> 一般用于语言切换
### 使用
```dart
//传入两个参数，语言代码，国家代码
new MaterialApp(
      locale: Locale('zh','cn'),
    );
//源码纠正，一些曾经用过的代码（注释后面的日期为不再使用的日期），源码会自动纠正
//来看一下源码
//languageCode 第一个参数
switch (languageCode) {
      case 'in': return 'id'; // Indonesian; deprecated 1989-01-01
      case 'iw': return 'he'; // Hebrew; deprecated 1989-01-01
      case 'ji': return 'yi'; // Yiddish; deprecated 1989-01-01
      case 'jw': return 'jv'; // Javanese; deprecated 2001-08-13
      case 'mo': return 'ro'; // Moldavian, Moldovan; deprecated 2008-11-22
      case 'aam': return 'aas'; // Aramanik; deprecated 2015-02-12
      case 'adp': return 'dz'; // Adap; deprecated 2015-02-12
      case 'aue': return 'ktz'; // =/Kx'au//'ein; deprecated 2015-02-12
      case 'ayx': return 'nun'; // Ayi (China); deprecated 2011-08-16
      case 'bgm': return 'bcg'; // Baga Mboteni; deprecated 2016-05-30
      case 'bjd': return 'drl'; // Bandjigali; deprecated 2012-08-12
      case 'ccq': return 'rki'; // Chaungtha; deprecated 2012-08-12
      case 'cjr': return 'mom'; // Chorotega; deprecated 2010-03-11
      case 'cka': return 'cmr'; // Khumi Awa Chin; deprecated 2012-08-12
      case 'cmk': return 'xch'; // Chimakum; deprecated 2010-03-11
      case 'coy': return 'pij'; // Coyaima; deprecated 2016-05-30
      case 'cqu': return 'quh'; // Chilean Quechua; deprecated 2016-05-30
      case 'drh': return 'khk'; // Darkhat; deprecated 2010-03-11
      case 'drw': return 'prs'; // Darwazi; deprecated 2010-03-11
      case 'gav': return 'dev'; // Gabutamon; deprecated 2010-03-11
      case 'gfx': return 'vaj'; // Mangetti Dune !Xung; deprecated 2015-02-12
      case 'ggn': return 'gvr'; // Eastern Gurung; deprecated 2016-05-30
      case 'gti': return 'nyc'; // Gbati-ri; deprecated 2015-02-12
      case 'guv': return 'duz'; // Gey; deprecated 2016-05-30
      case 'hrr': return 'jal'; // Horuru; deprecated 2012-08-12
      case 'ibi': return 'opa'; // Ibilo; deprecated 2012-08-12
      case 'ilw': return 'gal'; // Talur; deprecated 2013-09-10
      case 'jeg': return 'oyb'; // Jeng; deprecated 2017-02-23
      case 'kgc': return 'tdf'; // Kasseng; deprecated 2016-05-30
      case 'kgh': return 'kml'; // Upper Tanudan Kalinga; deprecated 2012-08-12
      case 'koj': return 'kwv'; // Sara Dunjo; deprecated 2015-02-12
      case 'krm': return 'bmf'; // Krim; deprecated 2017-02-23
      case 'ktr': return 'dtp'; // Kota Marudu Tinagas; deprecated 2016-05-30
      case 'kvs': return 'gdj'; // Kunggara; deprecated 2016-05-30
      case 'kwq': return 'yam'; // Kwak; deprecated 2015-02-12
      case 'kxe': return 'tvd'; // Kakihum; deprecated 2015-02-12
      case 'kzj': return 'dtp'; // Coastal Kadazan; deprecated 2016-05-30
      case 'kzt': return 'dtp'; // Tambunan Dusun; deprecated 2016-05-30
      case 'lii': return 'raq'; // Lingkhim; deprecated 2015-02-12
      case 'lmm': return 'rmx'; // Lamam; deprecated 2014-02-28
      case 'meg': return 'cir'; // Mea; deprecated 2013-09-10
      case 'mst': return 'mry'; // Cataelano Mandaya; deprecated 2010-03-11
      case 'mwj': return 'vaj'; // Maligo; deprecated 2015-02-12
      case 'myt': return 'mry'; // Sangab Mandaya; deprecated 2010-03-11
      case 'nad': return 'xny'; // Nijadali; deprecated 2016-05-30
      case 'nnx': return 'ngv'; // Ngong; deprecated 2015-02-12
      case 'nts': return 'pij'; // Natagaimas; deprecated 2016-05-30
      case 'oun': return 'vaj'; // !O!ung; deprecated 2015-02-12
      case 'pcr': return 'adx'; // Panang; deprecated 2013-09-10
      case 'pmc': return 'huw'; // Palumata; deprecated 2016-05-30
      case 'pmu': return 'phr'; // Mirpur Panjabi; deprecated 2015-02-12
      case 'ppa': return 'bfy'; // Pao; deprecated 2016-05-30
      case 'ppr': return 'lcq'; // Piru; deprecated 2013-09-10
      case 'pry': return 'prt'; // Pray 3; deprecated 2016-05-30
      case 'puz': return 'pub'; // Purum Naga; deprecated 2014-02-28
      case 'sca': return 'hle'; // Sansu; deprecated 2012-08-12
      case 'skk': return 'oyb'; // Sok; deprecated 2017-02-23
      case 'tdu': return 'dtp'; // Tempasuk Dusun; deprecated 2016-05-30
      case 'thc': return 'tpo'; // Tai Hang Tong; deprecated 2016-05-30
      case 'thx': return 'oyb'; // The; deprecated 2015-02-12
      case 'tie': return 'ras'; // Tingal; deprecated 2011-08-16
      case 'tkk': return 'twm'; // Takpa; deprecated 2011-08-16
      case 'tlw': return 'weo'; // South Wemale; deprecated 2012-08-12
      case 'tmp': return 'tyj'; // Tai Mène; deprecated 2016-05-30
      case 'tne': return 'kak'; // Tinoc Kallahan; deprecated 2016-05-30
      case 'tnf': return 'prs'; // Tangshewi; deprecated 2010-03-11
      case 'tsf': return 'taj'; // Southwestern Tamang; deprecated 2015-02-12
      case 'uok': return 'ema'; // Uokha; deprecated 2015-02-12
      case 'xba': return 'cax'; // Kamba (Brazil); deprecated 2016-05-30
      case 'xia': return 'acn'; // Xiandao; deprecated 2013-09-10
      case 'xkh': return 'waw'; // Karahawyana; deprecated 2016-05-30
      case 'xsj': return 'suj'; // Subi; deprecated 2015-02-12
      case 'ybd': return 'rki'; // Yangbye; deprecated 2012-08-12
      case 'yma': return 'lrr'; // Yamphe; deprecated 2012-08-12
      case 'ymt': return 'mtm'; // Mator-Taygi-Karagas; deprecated 2015-02-12
      case 'yos': return 'zom'; // Yos; deprecated 2013-09-10
      case 'yuu': return 'yug'; // Yugh; deprecated 2014-02-28
      default: return languageCode;
    }

//_countryCode 第二个参数
switch (_countryCode) {
      case 'BU': return 'MM'; // Burma; deprecated 1989-12-05
      case 'DD': return 'DE'; // German Democratic Republic; deprecated 1990-10-30
      case 'FX': return 'FR'; // Metropolitan France; deprecated 1997-07-14
      case 'TP': return 'TL'; // East Timor; deprecated 2002-05-20
      case 'YD': return 'YE'; // Democratic Yemen; deprecated 1990-08-14
      case 'ZR': return 'CD'; // Zaire; deprecated 1997-07-14
      default: return regionCode;
    }
```
## 14. localizationsDelegates
> 本地化委托，用于更改Flutter Widget默认的提示语，按钮text等
### 使用
```dart
new MaterialApp(
      localizationsDelegates: [
          MyLocalizationsDelegates(),
      ],
      locale: Locale('zh','cn'),
    );

class MyLocalizationsDelegates extends LocalizationsDelegate
<MaterialLocalizations>{
  @override
  bool isSupported(Locale locale) {
//是否支持该locale，如果不支持会报异常
    if(locale == const Locale('zh','cn')){
      return true;
    }
    return false;
  }
  @override//是否需要重载
  bool shouldReload(LocalizationsDelegate old)  => false;

  @override
  Future<MaterialLocalizations> load(Locale locale) {
//加载本地化
    return new SynchronousFuture(new MyLocalizations(locale));
  }
}
//本地化实现，继承DefaultMaterialLocalizations
class MyLocalizations extends DefaultMaterialLocalizations{
  final Locale locale;
  MyLocalizations(this.locale, );
  @override
  String get okButtonLabel {
    if(locale == const Locale('zh','cn')){
      return '好的';
    }else{
      return super.okButtonLabel;
    }
  }
  @override
  String get backButtonTooltip {
    if(locale == const Locale('zh','cn')){
      return '返回';
    }else{
      return super.okButtonLabel;
    }
  }
}
```
## 15. localeResolutionCallback
> 当传入的是不支持的语种，可以根据这个回调，返回相近,并且支持的语种
### 使用
```dart
new MaterialApp(
      localeResolutionCallback: (local,support){
        if(support.contains(support)){
          print('support');
          return local;
        }
        print('no_support');
        return const Locale('us','uk');
      },
//这个代码是随便填的，有可能出错
      locale: Locale('ze','cn'),
    );
```
## 16. supportedLocales
> 传入支持的语种数组
```dart
new MaterialApp(
      supportedLocales: [
        const Locale('uok'),
        const Locale('meg'),
      ],
    );
```
## 17. debugShowMaterialGrid
> debug模式下是否显示材质网格，传入bool类型，使用就不写了
## 18. showPerformanceOverlay
> 当为true时应用程序顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
## 19. checkerboardRasterCacheImages
> 当为true时，打开光栅缓存图像的棋盘格
## 20. checkerboardOffscreenLayers
> 当为true时，打开呈现到屏幕位图的层的棋盘格
## 21. showSemanticsDebugger
> 当为true时，打开Widget边框，类似Android开发者模式中显示布局边界
## 22. debugShowCheckedModeBanner
> 当为true时，在debug模式下显示右上角的debug字样的横幅，false即为不显示
''';

  @override
  _MaterialAppDemoState createState() => _MaterialAppDemoState();
}

class _MaterialAppDemoState extends MarkdownState<MaterialAppDemo> {
  @override
  String getMarkdownSource() {
    return MaterialAppDemo.detail;
  }

  @override
  String getTitle() {
    return "MaterialApp";
  }
}
