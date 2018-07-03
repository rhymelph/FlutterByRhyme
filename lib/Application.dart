import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'dart:async';

import 'package:flutterbyrhyme/widgets/aShow.dart';
import 'package:flutterbyrhyme/home/home.dart';

import 'package:flutterbyrhyme/options/options.dart';
import 'package:flutterbyrhyme/options/theme.dart';
import 'package:flutterbyrhyme/options/scales.dart';

import 'package:flutterbyrhyme/pages.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  MyOptions _options;
  Timer _timeDilationTimer;

  @override
  void initState() {
    // TODO: 初始化配置
    super.initState();
    _options = MyOptions(
      theme: kLightTheme,
      textScale: kAllMyTextValue[0],
      timeDilation: timeDilation,
      platform: defaultTargetPlatform,
    );
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

  //主题更换
  void _handleOptionChanged(MyOptions newOptions) {
    setState(() {
      if (_options.timeDilation != newOptions.timeDilation) {
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

  Map<String, WidgetBuilder> _buildRoutes() {
    return new Map<String, WidgetBuilder>.fromIterable(
      kAllPages,
      key: (dynamic page) => '${page.routeName}',
      value: (dynamic page) => page.buildRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget optionPage=new OptionsPage(
      options: _options,
      onOptionsChanged: _handleOptionChanged,
    );
    Widget home=new HomePage(
      optionPage: optionPage,
    );
    return new MaterialApp(
      title: 'Flutter教程',
      theme: _options.theme.data.copyWith(platform: _options.platform),
      color: Colors.blue,
      routes: _buildRoutes(),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: _options.textDirection,
          child: _applyTextScaleFactor(child),
        );
      },
      home: home,
    );
  }

  @override
  void dispose() {
    _timeDilationTimer?.cancel();
    _timeDilationTimer = null;
    super.dispose();
  }
}
