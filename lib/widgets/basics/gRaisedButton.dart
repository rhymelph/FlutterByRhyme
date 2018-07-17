import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RaisedButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/RaisedButton';

  @override
  _RaisedButtonDemoState createState() => _RaisedButtonDemoState();
}

class _RaisedButtonDemoState extends ExampleState<RaisedButtonDemo> {
  RaisedButtonSetting setting;

  @override
  void initState() {
    // TODO: implement initState
    setting = RaisedButtonSetting(
      onPressed: onPressValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return '';
  }

  @override
  String getExampleCode() {
    return '''RaisedButton(
        onPressed: ${setting.onPressed?.label ?? ''},
        onHighlightChanged: (b) {
          //If your press down the button ,b is true
          //If your release up the button,b is false
        },
        textTheme: ${setting.textTheme?.label ?? ''},
        textColor: ${setting.textColor?.label ?? ''},
        disabledTextColor: ${setting.disabledTextColor?.label ?? ''},
        disabledColor: ${setting.disabledColor?.label ?? ''},
        color: ${setting.color?.label ?? ''},
        highlightColor: ${setting.highlightColor?.label ?? ''},
        splashColor: ${setting.splashColor?.label ?? ''},
        colorBrightness: ${setting.colorBrightness?.label ?? ''},
        elevation: ${setting.elevation?.label ?? ''},
        highlightElevation: ${setting.highlightElevation?.label ?? ''},
        disabledElevation: ${setting.disabledElevation?.label ?? ''},
        padding: ${setting.padding?.label??''},
        shape: ${setting.shape?.label ?? ''},
        animationDuration: ${setting.animationDuration?.label ?? ''},
        child: Text('RaisedButton'),
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('onPressed'),
      RadioGroupWidget(setting.onPressed, onPressValues, (value) {
        setState(() {
          setting = setting.copyWith(onPress: value);
        });
      }),
      ValueTitleWidget('TextTheme(按钮文本主题)'),
      RadioGroupWidget<ButtonTextTheme>(
          setting.textTheme, buttonTextThemeValues, (value) {
        setState(() {
          setting = setting.copyWith(textTheme: value);
        });
      }),
      ValueTitleWidget('TextColor(文本颜色)'),
      ColorGroupWidget(setting.textColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(textColor: value);
        });
      }),
      ValueTitleWidget('DisabledTextColor(不可用文本颜色)'),
      ColorGroupWidget(setting.disabledTextColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(disabledTextColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget('disabledColor'),
      ColorGroupWidget(setting.disabledColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(disabledColor: value);
        });
      }),
      ValueTitleWidget('highlightColor(高亮颜色)'),
      ColorGroupWidget(setting.highlightColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(highlightColor: value);
        });
      }),
      ValueTitleWidget('splashColor(圆形扩展颜色)'),
      ColorGroupWidget(setting.splashColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(splashColor: value);
        });
      }),
      ValueTitleWidget('colorBrightness'),
      RadioGroupWidget(setting.colorBrightness, colorBrightnessValues, (value) {
        setState(() {
          setting = setting.copyWith(colorBrightness: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: 'elevation',
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: 'disabledElevation',
        value: setting.disabledElevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(disabledElevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: 'highlightElevation',
        value: setting.highlightElevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(highlightElevation: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget('shape'),
      RadioGroupWidget<ShapeBorder>(setting.shape, shapeValues, (value) {
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget('animationDuration'),
      RadioGroupWidget<Duration>(setting.animationDuration, durationValues, (value) {
        setState(() {
          setting = setting.copyWith(animationDuration: value);
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
        onPressed: setting.onPressed?.value == null
            ? setting.onPressed?.value
            : () {
                setting.onPressed?.value(scaffoldKey);
              },
        onHighlightChanged: (b) {
          //If your press down the button ,b is true
          //If your release up the button,b is false
        },
        textTheme: setting.textTheme?.value,
        textColor: setting.textColor?.value,
        disabledTextColor: setting.disabledTextColor?.value,
        color: setting.color?.value,
        disabledColor: setting.disabledColor?.value,
        highlightColor: setting.highlightColor?.value,
        splashColor: setting.splashColor?.value,
        colorBrightness: setting.colorBrightness?.value,
        elevation: setting.elevation?.value,
        disabledElevation: setting.disabledElevation?.value,
        highlightElevation: setting.highlightElevation?.value,
        padding: setting.padding?.value,
        shape: setting.shape?.value,
        animationDuration: setting.animationDuration?.value,
        child: Text(getTitle()),
      ),
    );
  }
}

class RaisedButtonSetting {
  final Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed;

  final Value<ButtonTextTheme> textTheme;
  final Value<Color> textColor;
  final Value<Color> disabledTextColor;
  final Value<Color> color;
  final Value<Color> disabledColor;
  final Value<Color> highlightColor;
  final Value<Color> splashColor;
  final Value<Brightness> colorBrightness;
  final Value<double> elevation;
  final Value<double> highlightElevation;
  final Value<double> disabledElevation;
  final Value<EdgeInsetsGeometry> padding;
  final Value<ShapeBorder> shape;
  final Value<Duration> animationDuration;

  RaisedButtonSetting({
    this.onPressed,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation: const Value(
      name: '2.0',
      value: 2.0,
      label: '2.0',
    ),
    this.highlightElevation: const Value(
      name: '8.0',
      value: 8.0,
      label: '8.0',
    ),
    this.disabledElevation: const Value(
      name: '0.0',
      value: 0.0,
      label: '0.0',
    ),
    this.padding,
    this.shape,
    this.animationDuration: const Value(
      value: kThemeChangeDuration,
      name: '200/milliseconds',
      label: 'const Duration(milliseconds: 200)',
    ),
  });

  RaisedButtonSetting copyWith({
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onPress,
    Value<ButtonTextTheme> textTheme,
    Value<Color> textColor,
    Value<Color> disabledTextColor,
    Value<Color> color,
    Value<Color> disabledColor,
    Value<Color> highlightColor,
    Value<Color> splashColor,
    Value<Brightness> colorBrightness,
    Value<double> elevation,
    Value<double> highlightElevation,
    Value<double> disabledElevation,
    Value<EdgeInsetsGeometry> padding,
    Value<ShapeBorder> shape,
    Value<Duration> animationDuration,
  }) {
    return RaisedButtonSetting(
      onPressed: onPress ?? this.onPressed,
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
