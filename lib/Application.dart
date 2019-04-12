import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutterbyrhyme/common/Constant.dart';
import 'dart:async';

import 'package:flutterbyrhyme/home/home.dart';
import 'package:flutterbyrhyme/options/local.dart';

import 'package:flutterbyrhyme/options/options.dart';
import 'package:flutterbyrhyme/options/theme.dart';
import 'package:flutterbyrhyme/options/scales.dart';

import 'package:flutterbyrhyme/pages.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  MyOptions _options;
  Timer _timeDilationTimer;

  @override
  void initState() {
    super.initState();
    _initOptions();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: constant.app_name,
      debugShowCheckedModeBanner: false,
      theme: _options.theme.data.copyWith(platform: _options.platform),
      color: _options.theme.data.primaryColor,
      routes: _buildRoutes(),
      builder: (BuildContext context, Widget child) {
        return OptionContext(
          child: Directionality(
            textDirection: _options.textDirection,
            child: _applyTextScaleFactor(child),
          ),
          options: _options,
        );
      },
      localizationsDelegates: [
        //设置搜索输入框提示语
        MyLocalizationsDelegates(),
      ],
      home: HomePage(
        optionPage: OptionsPage(//配置页面
          onOptionsChanged: _changedOptions,
        ),
        colorChange: _changeColor,
      ),
    );
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }

  //初始化主题
  void _initOptions() {
    _options = MyOptions(
      theme: kLightTheme,
      textScale: kAllMyTextValue[0],
      timeDilation: timeDilation,
      platform: defaultTargetPlatform,
      listStyle: kAllListStyleValue[0],
    );
    MyOptions.initOption().then((value) {
      if (mounted) {
        _changedOptions(value);
      }
    });
  }

  //更换主题
  void _changedOptions(MyOptions newOptions) {
    setState(() {
      if (_options?.timeDilation != newOptions.timeDilation) {
        _timeDilationTimer?.cancel();
        _timeDilationTimer = null;
        if (newOptions.timeDilation > 1.0) {
          _timeDilationTimer = new Timer(const Duration(milliseconds: 300), () {
            timeDilation = newOptions.timeDilation;
          });
        } else {
          timeDilation = newOptions.timeDilation;
        }
      }
      _options = newOptions;
    });
  }

  //更改颜色
  void _changeColor(BottomItem item) {
    setState(() {
      kDarkTheme = kDarkTheme.copyWith(
          data: kDarkTheme.data.copyWith(
              primaryColor: item.darkColor,
              buttonColor: item.darkColor,
              accentColor: item.lightColor));
      kLightTheme = kLightTheme.copyWith(
          data: kLightTheme.data.copyWith(
              primaryColor: item.lightColor,
              buttonColor: item.lightColor,
              accentColor: item.darkColor));
      if (_options.theme.name == kDarkTheme.name) {
        _changedOptions(_options.copyWith(theme: kDarkTheme));
      } else {
        _changedOptions(_options.copyWith(theme: kLightTheme));
      }
    });
  }

  //配置应用字体
  Widget _applyTextScaleFactor(Widget child) {
    return Builder(builder: (BuildContext context) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: _options.textScale.scale,
          ),
          child: child);
    });
  }

  //构建路由
  Map<String, WidgetBuilder> _buildRoutes() {
    return new Map<String, WidgetBuilder>.fromIterable(
      kAllPages,
      key: (dynamic page) => '${page.routeName}',
      value: (dynamic page) => page.buildRoute,
    );
  }
}
