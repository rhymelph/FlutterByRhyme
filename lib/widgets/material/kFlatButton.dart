import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlatButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/FlatButton';
  final String detail = '''材料设计“扁平按钮”。

平面按钮是显示在（零高程）材质 小部件上的文本标签，通过填充颜色对触摸作出反应。

在工具栏上，在对话框中使用平面按钮，或与其他内容内联，但使用填充从该内容偏移，以便按钮的存在是显而易见的。平面按钮故意不具有可见边框，因此必须依赖于它们相对于其他内容的位置以用于上下文。在对话框和卡片中，它们应该组合在一个底角中。避免使用平面按钮，它们会与其他内容混合，例如在列表中间。

材料设计平面按钮具有全帽标签，一些内部填充和一些定义的尺寸。要使应用程序的一部分具有交互式，使用墨水溅，而不是承诺这些样式选择，请考虑使用InkWell。

如果onPressed回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按disabledColor属性而不是color属性指定的颜色进行着色。如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序。

平面按钮的最小尺寸为88.0×36.0，可以用ButtonTheme 覆盖。

该clipBehavior参数不能为空。''';

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
      ValueTitleWidget(StringParams.kTextColor),
      ColorGroupWidget(setting.textColor,  (value) {
        setState(() {
          setting = setting.copyWith(textColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kDisabledTextColor),
      ColorGroupWidget(setting.disabledTextColor,  (value) {
        setState(() {
          setting = setting.copyWith(disabledTextColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget(StringParams.kDisabledColor),
      ColorGroupWidget(setting.disabledColor,  (value) {
        setState(() {
          setting = setting.copyWith(disabledColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kHighlightColor),
      ColorGroupWidget(setting.highlightColor,  (value) {
        setState(() {
          setting = setting.copyWith(highlightColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kSplashColor),
      ColorGroupWidget(setting.splashColor,  (value) {
        setState(() {
          setting = setting.copyWith(splashColor: value);
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
