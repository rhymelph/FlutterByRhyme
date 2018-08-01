import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RaisedButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/RaisedButton';
  final String detail='''A material design "raised button".
A raised button is based on a Material widget whose Material.elevation increases when the button is pressed.
Use raised buttons to add dimension to otherwise mostly flat layouts, e.g. in long busy lists of content, or in wide spaces. Avoid using raised buttons on already-raised content such as dialogs or cards.
If the onPressed callback is null, then the button will be disabled and by default will resemble a flat button in the disabledColor. If you are trying to change the button's color and it is not having any effect, check that you are passing a non-null onPressed handler.
If you want an ink-splash effect for taps, but don't want to use a button, consider using InkWell directly.
Raised buttons have a minimum size of 88.0 by 36.0 which can be overidden with ButtonTheme.''';

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
    return widget.detail;
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
      ValueTitleWidget(StringParams.konPressed),
      RadioGroupWidget(setting.onPressed, onPressValues, (value) {
        setState(() {
          setting = setting.copyWith(onPressed: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextTheme),
      RadioGroupWidget<ButtonTextTheme>(
          setting.textTheme, buttonTextThemeValues, (value) {
        setState(() {
          setting = setting.copyWith(textTheme: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextColor),
      ColorGroupWidget(setting.textColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(textColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kDisabledTextColor),
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
      ValueTitleWidget(StringParams.kDisabledColor),
      ColorGroupWidget(setting.disabledColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(disabledColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kHighlightColor),
      ColorGroupWidget(setting.highlightColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(highlightColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kSplashColor),
      ColorGroupWidget(setting.splashColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(splashColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kColorBrightness),
      RadioGroupWidget(setting.colorBrightness, colorBrightnessValues, (value) {
        setState(() {
          setting = setting.copyWith(colorBrightness: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kElevation,
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kDisabledElevation,
        value: setting.disabledElevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(disabledElevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kHighlightColor,
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
      ValueTitleWidget(StringParams.kShape),
      RadioGroupWidget<ShapeBorder>(setting.shape, shapeValues, (value) {
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget(StringParams.kAnimationDuration),
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
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed,
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
      onPressed: onPressed ?? this.onPressed,
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
