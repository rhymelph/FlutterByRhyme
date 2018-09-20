import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IconButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/IconButton';
  final String detail = '''材料设计图标按钮。

图标按钮是打印在“ 材质”小部件上的图片，通过填充颜色（墨水）来对触摸作出反应。

图标按钮通常在AppBar.actions字段中使用，但它们也可以在许多其他地方使用。

如果onPressed回调为null，则该按钮将被禁用，并且不会对触摸作出反应。

需要其中一个祖先成为Material小部件。

如果可能，图标按钮的命中区域的大小至少为48.0像素，与实际的iconSize无关，以满足 Material Design规范中的触摸目标大小要求。的对准控制图标本身如何定位命中区域内。''';

  @override
  _IconButtonDemoState createState() => _IconButtonDemoState();
}

class _IconButtonDemoState extends ExampleState<IconButtonDemo> {
  IconButtonSetting setting;

  @override
  void initState() {
    setting = IconButtonSetting(
      onPressed: onPressValues[0],
      iconSize: doubleLargeValues[4],
      padding: paddingValues[0],
      alignment: alignmentValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''IconButton(
        icon: Icon(Icons.check),
        onPressed: ${setting.onPressed?.label??''},
        color: ${setting.color?.label??''},
        disabledColor: ${setting.disabledColor?.label??''},
        splashColor: ${setting.splashColor?.label??''},
        highlightColor: ${setting.highlightColor?.label??''},
        padding: ${setting.padding?.label??''},
        tooltip: '${setting.tooltip?.label??''}',
        iconSize: ${setting.iconSize?.label??''},
        alignment: ${setting.alignment?.label??''},
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
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget<AlignmentGeometry>(
          setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
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
      SwitchValueTitleWidget(
        title: StringParams.kTooltip,
        value: setting.tooltip,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(tooltip: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kIconSize,
        value: setting.iconSize,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(
              iconSize: value,
            );
          });
        },
      ),

    ];
  }

  @override
  String getTitle() {
    return 'IconButton';
  }

  @override
  Widget getWidget() {
    return Center(
      child: IconButton(
        icon: Icon(Icons.check),
        onPressed: setting.onPressed?.value == null
            ? setting.onPressed?.value
            : () {
          setting.onPressed?.value(scaffoldKey);
        },
        color: setting.color?.value,
        disabledColor: setting.disabledColor?.value,
        splashColor: setting.splashColor?.value,
        highlightColor: setting.highlightColor?.value,
        padding: setting.padding?.value,
        tooltip: setting.tooltip?.label,
        iconSize: setting.iconSize?.value,
        alignment: setting.alignment?.value,
      ),
    );
  }
}

class IconButtonSetting {
  final Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed;
  final Value<Color> color;
  final Value<Color> disabledColor;
  final Value<Color> splashColor;
  final Value<Color> highlightColor;
  final Value<EdgeInsetsGeometry> padding;
  final Value<bool> tooltip;
  final Value<double> iconSize;
  final Value<AlignmentGeometry> alignment;

  const IconButtonSetting({
    this.iconSize,
    this.padding,
    this.alignment,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.onPressed,
    this.tooltip
  });

  IconButtonSetting copyWith({
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onPressed,
    Value<Color> color,
    Value<Color> disabledColor,
    Value<Color> splashColor,
    Value<Color> highlightColor,
    Value<EdgeInsetsGeometry> padding,
    Value<bool> tooltip,
    Value<double> iconSize,
    Value<AlignmentGeometry> alignment,
  }) {
    return IconButtonSetting(
      onPressed: onPressed ?? this.onPressed,
      color: color ?? this.color,
      disabledColor: disabledColor ?? this.disabledColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      padding: padding ?? this.padding,
      tooltip: tooltip ?? this.tooltip,
      iconSize: iconSize ?? this.iconSize,
      alignment: alignment ?? this.alignment,
    );
  }
}