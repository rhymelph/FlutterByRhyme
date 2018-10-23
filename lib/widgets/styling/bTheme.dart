import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ThemeDemo extends StatefulWidget {
  static const String routeName = 'widgets/styling/Theme';
  final String detail = '''
## 简述
将主题应用于后代窗口小部件。
主题描述应用程序的颜色和印刷选择。
后代小部件使用Theme.of获取当前主题的ThemeData对象 。当窗口小部件使用Theme.of时，如果主题稍后更改，它将自动重建，以便可以应用更改。
的主题插件意味着一个IconTheme插件，设置为的值 ThemeData.iconTheme所述的数据为主题。

## 43个参数

|参数|介绍|
|-|-|
|brightness|亮度(dark,light)|
|primaryColor|应用程序的主要部分（工具栏，标签栏等）的背景颜色|
|primarySwatch|用于颜色缺省|
|primaryColorBrightness|primaryColor的亮度。用于确定文本的颜色和放置在主颜色顶部的图标（例如工具栏文本）|
|primaryColorLight|primaryColor的明亮版|
|primaryColorDark|primaryColor的黑暗版|
|accentColor|小部件的前景颜色（旋钮、文本、过卷边沿效果等）|
|accentColorBrightness|accentColor的亮度。用于确定文本的颜色和图标放在重音颜色的顶部（例如浮动的图标）动作按钮|
|canvasColor|材质类型画布的默认颜色|
|scaffoldBackgroundColor|Scaffold的默认背景颜色|
|bottomAppBarColor|BottomAppBar的默认背景颜色|
|cardColor|Card的默认背景颜色|
|dividerColor|Divider的默认背景颜色|
|highlightColor|水波纹后和选中的颜色|
|splashColor|InkWell水波纹的颜色|
|splashFactory|定义点击扩散|
|selectedRowColor|用于突出显示选定行的颜色|
|unselectedWidgetColor|用于点击前，选中前的部件颜色,但可用|
|disabledColor|用于不可用的部件颜色|
|buttonColor|按钮默认填充颜色|
|toggleableActiveColor|Switch、Radio、Checkbox选中的颜色|
|fontFamily|默认字体|
|buttonTheme|定义按钮控件的默认配置|
|secondaryHeaderColor|PaginatedDataTable当选择行时的标题颜色|
|textSelectionColor|文本字段中文本选择的颜色|
|cursorColor|光标颜色|
|textSelectionHandleColor|当前用于选择文本的哪个部分的句柄的颜色|
|backgroundColor|与原始颜色形成对比的颜色，例如用作进度条的剩余部分|
|dialogBackgroundColor|Dialog的默认背景颜色|
|indicatorColor|TabBar中选定的选项卡指示器的颜色|
|hintColor|用于提示文本或占位符文本的颜色|
|errorColor|用于输入验证错误的颜色|
|textTheme|颜色与卡片和画布颜色对比的文本主题|
|primaryTextTheme|与原色对比的文本主题|
|accentTextTheme|与accent颜色形成鲜明对比的文本主题|
|inputDecorationTheme|默认输入装饰主题|
|iconTheme|与卡片和画布颜色形成鲜明对比的图标主题|
|primaryIconTheme|与原色对比的图标主题|
|accentIconTheme|与accent颜色形成鲜明对比的图标主题|
|sliderTheme|Slider的默认主题|
|chipTheme|Chip的默认主题|
|platform|默认平台|
|materialTapTargetSize|材质尺寸（padded）内边距，（shrinkWrap）最小值|

## 主题切换

先定义一个实体类
```dart
class MyTheme {
  final String name;
  final ThemeData data;

  const MyTheme._(this.name, this.data);
  @override
  bool operator ==(other) {
    if(identical(this, other)){
      return true;
    }
    if(runtimeType!=other.runtimeType){
      return false;
    }
    MyTheme typeOther=other;
    return name==typeOther.name;
  }
  @override
  int get hashCode => hashValues(name, data);
}
```

定义两个主题

```dart
final MyTheme kDarkTheme = MyTheme._('Dark', _buildDarkTheme());
final MyTheme kLightTheme = MyTheme._('Light', _buildLightTheme());

ThemeData _buildDarkTheme() {
  const Color primaryColor = const Color(0xFF002D75);
  final ThemeData base = new ThemeData.dark();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    accentColor: const Color(0xFF13B9FD),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = Colors.blue;
  final ThemeData base = new ThemeData.light();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: const Color(0xFF002D75),
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
```

主题之间进行切换

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyTheme _current=kLightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _current.data,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Theme'),
        ),
        body: Center(
          child: Switch(value: _current==kLightTheme, onChanged: (value){
            setState(() {
              _current=value?kLightTheme:kDarkTheme;
            });
          }),
        ),
      ),
    );
  }
}
```''';

  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends MarkdownState<ThemeDemo> {

  @override
  String getMarkdownSource() {
    return widget.detail;
  }

  @override
  String getTitle() {
    return 'Theme';
  }
}



