import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlutterLogoDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/FlutterLogo';
  final String detail='''The Flutter logo, in widget form. This widget respects the IconTheme.
See also:
IconTheme, which provides ambient configuration for icons.
Icon, for showing icons the Material design icon library.
ImageIcon, for showing icons from AssetImages or other ImageProviders.''';

  @override
  _FlutterLogoDemoState createState() => _FlutterLogoDemoState();
}

class _FlutterLogoDemoState extends ExampleState<FlutterLogoDemo> {
  FlutterLogoSetting setting;

  @override
  void initState() {
    setting = FlutterLogoSetting(
      textColor: colorValues[1],
      style: logoStyleValues[0],
      curve: curveValues[0],
      duration: durationValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''FlutterLogo(
      size: ${setting.size?.label ?? ''},
      colors: ${setting.colors?.label ?? ''},
      textColor: ${setting.textColor?.label ?? ''},
      style: ${setting.style?.label ?? ''},
      duration: ${setting.duration?.label ?? ''},
      curve: ${setting.curve?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kStyle),
      RadioGroupWidget<FlutterLogoStyle>(setting.style, logoStyleValues, (value){
        setState(() {
          setting=setting.copyWith(style: value);
        });
      }),

      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget<Duration>(setting.duration, durationValues, (value){
        setState(() {
          setting=setting.copyWith(duration: value);
        });
      }),

      ValueTitleWidget(StringParams.kCurve),
      RadioGroupWidget<Curve>(setting.curve, curveValues, (value){
        setState(() {
          setting=setting.copyWith(curve: value);
        });
      }),

      ValueTitleWidget(StringParams.kColors),
      ColorsGroupWidget(setting.colors,  (value){
        setState(() {
          setting=setting.copyWith(colors: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextColor),
      ColorGroupWidget(setting.textColor,  (value){
        setState(() {
          setting=setting.copyWith(textColor: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: sizeValues,
        title: StringParams.kSize,
        value: setting.size,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(size: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'FlutterLogo';
  }

  @override
  Widget getWidget() {
    return Center(
      child: FlutterLogo(
        size: setting.size?.value,
        colors: setting.colors?.value,
        textColor: setting.textColor?.value,
        style: setting.style?.value,
        duration: setting.duration?.value,
        curve: setting.curve?.value,
      ),
    );
  }
}

class FlutterLogoSetting {
  final Value<double> size;
  final Value<MaterialColor> colors;
  final Value<Color> textColor;
  final Value<FlutterLogoStyle> style;
  final Value<Duration> duration;
  final Value<Curve> curve;

  FlutterLogoSetting({
    this.size,
    this.colors,
    this.textColor,
    this.style,
    this.duration,
    this.curve,
  });

  FlutterLogoSetting copyWith({
    Value<double> size,
    Value<MaterialColor> colors,
    Value<Color> textColor,
    Value<FlutterLogoStyle> style,
    Value<Duration> duration,
    Value<Curve> curve,
  }) {
    return FlutterLogoSetting(
      size: size ?? this.size,
      colors: colors ?? this.colors,
      textColor: textColor ?? this.textColor,
      style: style ?? this.style,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
    );
  }
}
