import 'package:flutter/material.dart';

///App主题
class MyTheme {
  final String name;
  final ThemeData data;

  const MyTheme._(this.name, this.data);

  MyTheme copyWith({ThemeData data}){
    return MyTheme._(name, data??this.data);
  }
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
  // TODO: implement hashCode
  int get hashCode => hashValues(name, data);
}

MyTheme kDarkTheme = MyTheme._('Dark', _buildDarkTheme());
MyTheme kLightTheme = MyTheme._('Light', _buildLightTheme());

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'qlYouYuan',
    ),
    subhead: base.subhead.copyWith(fontFamily: 'qlYouYuan'),
  );
}

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
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
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
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
