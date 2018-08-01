import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlatButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/FlatButton';
  final String detail = '''A material design "flat button".
A flat button is a text label displayed on a (zero elevation) Material widget that reacts to touches by filling with color.
Use flat buttons on toolbars, in dialogs, or inline with other content but offset from that content with padding so that the button's presence is obvious. Flat buttons intentionally do not have visible borders and must therefore rely on their position relative to other content for context. In dialogs and cards, they should be grouped together in one of the bottom corners. Avoid using flat buttons where they would blend in with other content, for example in the middle of lists.
Material design flat buttons have an all-caps label, some internal padding, and some defined dimensions. To have a part of your application be interactive, with ink splashes, without also committing to these stylistic choices, consider using InkWell instead.
If the onPressed callback is null, then the button will be disabled, will not react to touch, and will be colored as specified by the disabledColor property instead of the color property. If you are trying to change the button's color and it is not having any effect, check that you are passing a non-null onPressed handler.
Flat buttons have a minimum size of 88.0 by 36.0 which can be overidden with ButtonTheme.''';

  @override
  _FlatButtonDemoState createState() => _FlatButtonDemoState();
}

class _FlatButtonDemoState extends ExampleState<FlatButtonDemo> {
  FlatButtonSetting setting;

  @override
  void initState() {
    setting = FlatButtonSetting(
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
    return '''FlatButton(
        onPressed: ${setting.onPressed?.label ?? ''},
        child: Text('FlatButton'),
        onHighlightChanged: (b) {
          //If your press down the button ,b is true
          //If your release up the button,b is false
        },
        textTheme: ${setting.textTheme?.label??''},
        textColor: ${setting.textColor?.label??''},
        disabledTextColor: ${setting.disabledTextColor?.label??''},
        color: ${setting.color?.label??''},
        disabledColor: ${setting.disabledColor?.label??''},
        splashColor: ${setting.splashColor?.label??''},
        highlightColor: ${setting.highlightColor?.label??''},
        colorBrightness: ${setting.colorBrightness?.label??''},
        padding: ${setting.padding?.label??''},
        shape: ${setting.shape?.label??''},
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
    ];
  }

  @override
  String getTitle() {
    return 'FlatButton';
  }

  @override
  Widget getWidget() {
    return Center(
      child: FlatButton(
        onPressed: setting.onPressed?.value == null
            ? setting.onPressed?.value
            : () {
          setting.onPressed?.value(scaffoldKey);
        },
        child: Text('FlatButton'),
        onHighlightChanged: (b) {
          //If your press down the button ,b is true
          //If your release up the button,b is false
        },
        textTheme: setting.textTheme?.value,
        textColor: setting.textColor?.value,
        disabledTextColor: setting.disabledTextColor?.value,
        color: setting.color?.value,
        disabledColor: setting.disabledColor?.value,
        splashColor: setting.splashColor?.value,
        highlightColor: setting.highlightColor?.value,
        colorBrightness: setting.colorBrightness?.value,
        padding: setting.padding?.value,
        shape: setting.shape?.value,
      ),
    );
  }
}

class FlatButtonSetting {
  final Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed;
  final Value<ButtonTextTheme> textTheme;
  final Value<Color> textColor;
  final Value<Color> disabledTextColor;
  final Value<Color> color;
  final Value<Color> disabledColor;
  final Value<Color> splashColor;
  final Value<Color> highlightColor;
  final Value<Brightness> colorBrightness;
  final Value<EdgeInsetsGeometry> padding;
  final Value<ShapeBorder> shape;

  const FlatButtonSetting({
    this.onPressed,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.padding,
    this.shape,
  });

  FlatButtonSetting copyWith({
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed,
    Value<ButtonTextTheme> textTheme,
    Value<Color> textColor,
    Value<Color> disabledTextColor,
    Value<Color> color,
    Value<Color> disabledColor,
    Value<Color> splashColor,
    Value<Color> highlightColor,
    Value<Brightness> colorBrightness,
    Value<EdgeInsetsGeometry> padding,
    Value<ShapeBorder> shape,
  }) {
    return FlatButtonSetting(
      onPressed: onPressed??this.onPressed,
      textTheme: textTheme ?? this.textTheme,
      textColor: textColor ?? this.textColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      color: color ?? this.color,
      disabledColor: disabledColor ?? this.disabledColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      colorBrightness: colorBrightness ?? this.colorBrightness,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
    );
  }
}
