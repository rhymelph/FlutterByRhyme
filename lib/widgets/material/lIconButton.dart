import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IconButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/IconButton';
  final String detail = '''A material design icon button.
An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).
Icon buttons are commonly used in the AppBar.actions field, but they can be used in many other places as well.
If the onPressed callback is null, then the button will be disabled and will not react to touch.
Requires one of its ancestors to be a Material widget.
The hit region of an icon button will, if possible, be at least 48.0 pixels in size, regardless of the actual iconSize, to satisfy the touch target size requirements in the Material Design specification. The alignment controls how the icon itself is positioned within the hit region.''';

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