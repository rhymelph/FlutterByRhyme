import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RaisedButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/RaisedButton';

  @override
  _RaisedButtonDemoState createState() => _RaisedButtonDemoState();
}

class _RaisedButtonDemoState extends ExampleState<RaisedButtonDemo> {
  RaisedButtonSetting setting;

  Value<ButtonTextTheme> _firstButtonTextTheme;

  Value<Color> _firstTextColor;
  Value<Color> _firstDisabledTextColor;


  @override
  void initState() {
    // TODO: implement initState
    setting = RaisedButtonSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return '';
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('TextTheme(按钮文本主题)'),
      RadioGroupWidget<ButtonTextTheme>(
          _firstButtonTextTheme, buttonTextThemeValues, (value) {
        setState(() {
          _firstButtonTextTheme = value;
          setting = setting.copyWith(textTheme: value.value);
        });
      }),
      ValueTitleWidget('TextColor(文本颜色)'),
      ColorGroupWidget(
          _firstTextColor, colorValues, (value) {
        setState(() {
          _firstTextColor = value;
          setting = setting.copyWith(textColor: value.value);
        });
      }),
      ValueTitleWidget('DisabledTextColor(不可用文本颜色)'),
      ColorGroupWidget(
          _firstDisabledTextColor, colorValues, (value) {
        setState(() {
          _firstDisabledTextColor = value;
          setting = setting.copyWith(disabledTextColor: value.value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(
          _firstDisabledTextColor, colorValues, (value) {
        setState(() {
          _firstDisabledTextColor = value;
          setting = setting.copyWith(disabledTextColor: value.value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'RaisedButton';
  }

  @override
  Widget getWidget() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text('RaisedButton is be click !')));
        },
        onHighlightChanged: (b) {
          //If your press down the button ,b is true
          //If your release up the button,b is false
        },
        textTheme: setting.textTheme,
        textColor: setting.textColor,
        disabledTextColor: setting.disabledTextColor,
        disabledColor: setting.disabledColor,
        color: setting.color,
        highlightColor: setting.highlightColor,
        splashColor: setting.splashColor,
        colorBrightness: setting.colorBrightness,
        elevation: setting.elevation,
        highlightElevation: setting.highlightElevation,
        disabledElevation: setting.disabledElevation,
        shape: setting.shape,
        animationDuration: setting.animationDuration,
        child: Text(getTitle()),
      ),
    );
  }
}

class RaisedButtonSetting {
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color highlightColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final double elevation;
  final double highlightElevation;
  final double disabledElevation;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Duration animationDuration;

  RaisedButtonSetting({
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation: 2.0,
    this.highlightElevation: 8.0,
    this.disabledElevation: 0.0,
    this.padding,
    this.shape,
    this.animationDuration: kThemeChangeDuration,
  });

  RaisedButtonSetting copyWith({
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double highlightElevation,
    double disabledElevation,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Duration animationDuration,
  }) {
    return RaisedButtonSetting(
      textTheme: textTheme ?? this.textTheme,
      textColor: textColor ?? this.textColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      color: color ?? this.color,
      disabledColor: disabledColor ?? this.disabledColor,
      highlightColor: highlightColor ?? this.highlightColor,
      splashColor: splashColor ?? this.splashColor,
      colorBrightness: colorBrightness ?? this.colorBrightness,
      elevation: elevation ?? this.elevation,
      highlightElevation: highlightElevation ?? this.highlightElevation,
      disabledElevation: disabledElevation ?? this.disabledElevation,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }
}
