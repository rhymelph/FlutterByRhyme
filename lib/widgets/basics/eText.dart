import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TextDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Text';
  final String detail = '''A run of text with a single style.
The Text widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.
The style argument is optional. When omitted, the text will use the style from the closest enclosing DefaultTextStyle. If the given style's TextStyle.inherit property is true, the given style will be merged with the closest enclosing DefaultTextStyle. This merging behavior is useful, for example, to make the text bold while using the default font family and size.
Using the new TextSpan.rich constructor, the Text widget can also be created with a TextSpan to display text that use multiple styles (e.g., a paragraph with some bold words).''';

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends ExampleState<TextDemo> {
  TextSetting setting;

  bool isExpanded = false;

  GlobalKey<TextStyleDemoState> textStyleKey = new GlobalKey();

  @override
  void initState() {
    setting = TextSetting(
      textScaleFactor: doubleMiniValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Text(
      "content",
      style: ${textStyleKey?.currentState?.getExampleCode() ?? ''},
      textAlign: ${setting.textAlign?.value ?? ''},
      textDirection: ${setting.textDirection?.value ?? ''},
      softWrap: ${setting.softWrap?.value ?? 'true'},
      overflow: ${setting.overflow?.value ?? ''},
      textScaleFactor: ${setting.textScaleFactor?.value ?? ''},
      maxLines: ${setting.maxLines?.value ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kStyle),
        hintWidget: TextStyleDemo(
          key: textStyleKey,
          onchange: (value) {
            setState(() {
              final Value<TextStyle> _firstTextStyle=Value<TextStyle>(
                name: '',
                value: value.onChange(),
                label: textStyleKey.currentState.getExampleCode(),
              );
              setting = setting.copyWith(
                  style: _firstTextStyle,);
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kTextAlign),
      RadioGroupWidget<TextAlign>(setting.textAlign, textAlignValues, (value) {
        setState(() {
          setting = setting.copyWith(textAlign: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget<TextDirection>(
          setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kSoftWrap,
        onChanged: (value) {
          setState(() {
            final _firstSoftWrap = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(softWrap: _firstSoftWrap);
          });
        },
        value: setting.softWrap?.value ?? true,
      ),
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget<TextOverflow>(setting.overflow, textOverflowValues,
          (value) {
        setState(() {
          setting = setting.copyWith(overflow: value);
        });
      }),
      DropDownValueTitleWidget<double>(
        title: StringParams.kTextScaleFactor,
        selectList: doubleMiniValues,
        value: setting.textScaleFactor,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(textScaleFactor: value);
          });
        },
      ),
      DropDownValueTitleWidget<int>(
        title: StringParams.kMaxLines,
        selectList: intValues,
        value: setting.maxLines,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxLines: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Text';
  }

  @override
  Widget getWidget() {
    return Container(
      color: Colors.grey[300],
      child: Text(
        '''Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.
      Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。''',
        style: setting.style?.value,
        textAlign: setting.textAlign?.value,
        textDirection: setting.textDirection?.value,
        softWrap: setting.softWrap?.value,
        overflow: setting.overflow?.value,
        textScaleFactor: setting.textScaleFactor?.value,
        maxLines: setting.maxLines?.value,
      ),
    );
  }
}

class TextSetting {
  final Value<TextStyle> style;
  final Value<TextAlign> textAlign;
  final Value<TextDirection> textDirection;
  final Value<bool> softWrap;
  final Value<TextOverflow> overflow;
  final Value<double> textScaleFactor;
  final Value<int> maxLines;

  TextSetting({
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
  });

  TextSetting copyWith({
    Value<TextStyle> style,
    Value<TextAlign> textAlign,
    Value<TextDirection> textDirection,
    Value<bool> softWrap,
    Value<TextOverflow> overflow,
    Value<double> textScaleFactor,
    Value<int> maxLines,
  }) {
    return TextSetting(
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
    );
  }
}

class TextStyleDemo extends StatefulWidget {
  TextStyleDemo({Key key, this.onchange}) : super(key: key);

  final ValueChanged<TextStyleSetting> onchange;

  @override
  TextStyleDemoState createState() => TextStyleDemoState();
}

class TextStyleDemoState extends State<TextStyleDemo> {
  TextStyleSetting setting;

  @override
  void initState() {
    // TODO: implement initState
    setting = TextStyleSetting();
    super.initState();
  }

  String getExampleCode() {
    return '''TextStyle(
      inherit: ${setting.inherit?.label ?? 'false'},
      color: ${setting.color?.label ?? ''},
      fontStyle: ${setting.fontStyle?.label ?? ''},
      fontSize: ${setting.fontSize?.label ?? ''},
      fontWeight: ${setting.fontWeight?.label ?? ''},
      letterSpacing: ${setting.letterSpacing?.label ?? ''},
      wordSpacing: ${setting.wordSpacing?.label ?? ''},
      textBaseline: ${setting.textBaseline?.label ?? ''},
      background: ${setting.background?.label ?? ''},
      decoration: ${setting.decoration?.label ?? ''},
      decorationColor: ${setting.decorationColor?.label ?? ''},
      decorationStyle: ${setting.decorationStyle?.label ?? ''},
    )''';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SwitchValueTitleWidget(
          title: StringParams.kInherit,
          value: setting.inherit?.value ?? false,
          onChanged: (value) {
            setState(() {
              Value<bool> _firstInherit = Value(
                name: value ? 'true' : 'false',
                value: value,
                label: value ? 'true' : 'false',
              );
              setting = setting.copyWith(
                inherit: _firstInherit,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kColor),
        ColorGroupWidget(setting.color, colorValues, (value) {
          setState(() {
            setting = setting.copyWith(
              color: value,
            );
            widget.onchange(setting);
          });
        }),
        DropDownValueTitleWidget(
          selectList: fontSizeValues,
          title: StringParams.kFontSize,
          value: setting.fontSize,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                fontSize: value,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kFontWeight),
        RadioGroupWidget<FontWeight>(setting.fontWeight, fontWeightValues,
            (value) {
          setState(() {
            setting = setting.copyWith(
              fontWeight: value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kFontStyle),
        RadioGroupWidget<FontStyle>(setting.fontStyle, fontStyleValues,
            (value) {
          setState(() {
            setting = setting.copyWith(
              fontStyle: value,
            );
            widget.onchange(setting);
          });
        }),
        DropDownValueTitleWidget<double>(
          selectList: doubleMiniValues,
          title: StringParams.kLetterSpacing,
          value: setting.letterSpacing,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                letterSpacing: value,
              );
              widget.onchange(setting);
            });
          },
        ),
        DropDownValueTitleWidget<double>(
          selectList: doubleMiniValues,
          title: StringParams.kWordSpacing,
          value: setting.wordSpacing,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                wordSpacing: value,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kTextBaseline),
        RadioGroupWidget<TextBaseline>(setting.textBaseline, TextBaselineValues,
            (value) {
          setState(() {
            setting = setting.copyWith(
              textBaseline: value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kBackground),
        RadioGroupWidget<Paint>(setting.background, paintValues, (value) {
          setState(() {
            setting = setting.copyWith(
              background: value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kTextDecoration),
        RadioGroupWidget<TextDecoration>(
            setting.decoration, textDecorationValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decoration: value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kDecorationColor),
        ColorGroupWidget(setting.decorationColor, colorValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decorationColor: value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kDecorationStyle),
        RadioGroupWidget<TextDecorationStyle>(
            setting.decorationStyle, textDecorationStyleValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decorationStyle: value,
            );
            widget.onchange(setting);
          });
        }),
      ],
    );
  }
}

class TextStyleSetting {
//  final double height;
//  final Locale locale;
  final Value<bool> inherit;
  final Value<Color> color;
  final Value<double> fontSize;
  final Value<FontWeight> fontWeight;
  final Value<FontStyle> fontStyle;
  final Value<double> letterSpacing;
  final Value<double> wordSpacing;
  final Value<TextBaseline> textBaseline;
  final Value<Paint> background;
  final Value<TextDecoration> decoration;
  final Value<Color> decorationColor;
  final Value<TextDecorationStyle> decorationStyle;

  TextStyleSetting({
    this.inherit: const Value<bool>(
      name: 'true',
      value: true,
      label: 'true',
    ),
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
//    this.height,
//    this.locale,
    this.background,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
  });

  TextStyleSetting copyWith({
    Value<bool> inherit,
    Value<Color> color,
    Value<double> fontSize,
    Value<FontWeight> fontWeight,
    Value<FontStyle> fontStyle,
    Value<double> letterSpacing,
    Value<double> wordSpacing,
    Value<TextBaseline> textBaseline,
    Value<Paint> background,
    Value<TextDecoration> decoration,
    Value<Color> decorationColor,
    Value<TextDecorationStyle> decorationStyle,
  }) {
    return TextStyleSetting(
      inherit: inherit ?? this.inherit,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ?? this.fontStyle,
      fontWeight: fontWeight ?? this.fontWeight,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
//      height: height ?? this.height,
//      locale: locale ?? this.locale,
      background: background ?? this.background,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
    );
  }

  TextStyle onChange() {
    return TextStyle(
      inherit: inherit?.value,
      color: color?.value,
      fontSize: fontSize?.value,
      fontStyle: fontStyle?.value,
      fontWeight: fontWeight?.value,
      letterSpacing: letterSpacing?.value,
      wordSpacing: wordSpacing?.value,
      textBaseline: textBaseline?.value,
      background: background?.value,
      decoration: decoration?.value,
      decorationColor: decorationColor?.value,
      decorationStyle: decorationStyle?.value,
    );
  }
}
