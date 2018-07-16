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
  Value<TextAlign> _firstTextAlign;
  Value<TextDirection> _firstTextDirection;
  Value<bool> _firstSoftWrap;
  Value<TextOverflow> _firstOverflow;
  Value<double> _firstTextScaleFactor;
  Value<int> _firstMaxLines;
  bool isExpanded=false;

  GlobalKey<TextStyleDemoState> textStyleKey=new GlobalKey();
  @override
  void initState() {
    _firstTextScaleFactor = doubleValues[0];
    setting = TextSetting(
      textScaleFactor: _firstTextScaleFactor.value,
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
      style: ${textStyleKey?.currentState?.getExampleCode()?? ''},
      textAlign: ${_firstTextAlign?.value ?? ''},
      textDirection: ${_firstTextDirection?.value ?? ''},
      softWrap: ${_firstSoftWrap?.value ?? 'true'},
      overflow: ${_firstOverflow?.value ?? ''},
      textScaleFactor: ${_firstTextScaleFactor?.value ?? ''},
      maxLines: ${_firstMaxLines?.value ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (isExpanded){
          setState(() {
            this.isExpanded=isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kStyle),
        hintWidget: TextStyleDemo(
          key: textStyleKey,
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(style: value.onChange());
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kTextAlign),
      RadioGroupWidget<TextAlign>(_firstTextAlign, textAlignValues, (value) {
        setState(() {
          _firstTextAlign = value;
          setting = setting.copyWith(textAlign: value.value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget<TextDirection>(_firstTextDirection, textDirectionValues,
          (value) {
        setState(() {
          _firstTextDirection = value;
          setting = setting.copyWith(textDirection: value.value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kSoftWrap,
        onChanged: (value) {
          setState(() {
            _firstSoftWrap = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(softWrap: value);
          });
        },
        value: _firstSoftWrap?.value ?? true,
      ),
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget<TextOverflow>(_firstOverflow, textOverflowValues,
          (value) {
        setState(() {
          _firstOverflow = value;
          setting = setting.copyWith(overflow: value.value);
        });
      }),
      DropDownValueTitleWidget<double>(
        title: StringParams.kTextScaleFactor,
        selectList: doubleValues,
        value: _firstTextScaleFactor,
        onChanged: (value) {
          setState(() {
            _firstTextScaleFactor = value;
            setting = setting.copyWith(textScaleFactor: value.value);
          });
        },
      ),
      DropDownValueTitleWidget<int>(
        title: StringParams.kMaxLines,
        selectList: intValues,
        value: _firstMaxLines,
        onChanged: (value) {
          setState(() {
            _firstMaxLines = value;
            setting = setting.copyWith(maxLines: value.value);
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
        style: setting.style,
        textAlign: setting.textAlign,
        textDirection: setting.textDirection,
        softWrap: setting.softWrap,
        overflow: setting.overflow,
        textScaleFactor: setting.textScaleFactor,
        maxLines: setting.maxLines,
      ),
    );
  }
}

class TextSetting {
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;

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
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
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
  TextStyleDemo({Key key,this.onchange}):super(key:key);

  final ValueChanged<TextStyleSetting> onchange;

  @override
  TextStyleDemoState createState() => TextStyleDemoState();
}

class TextStyleDemoState extends State<TextStyleDemo> {
  TextStyleSetting setting;

  Value<Color> _firstColor;

  Value<double> _firstFontSize;

  Value<FontWeight> _firstFontWeight;

  Value<FontStyle> _firstFontStyle;

  Value<double> _firstLetterSpacing;

  Value<double> _firstWordSpacing;

  Value<TextBaseline> _firstTextBaseline;

  Value<Paint> _firstPaint;

  Value<TextDecoration> _firstTextDecoration;

  Value<Color> _firstDecorationColor;

  Value<TextDecorationStyle> _firstTextDecorationStyle;

  @override
  void initState() {
    // TODO: implement initState
    setting = TextStyleSetting();
    super.initState();
  }

  String getExampleCode(){
    return '''TextStyle(
      inherit: ${setting.inherit?'true':'false'},
      color: ${_firstColor?.label??''},
      fontStyle: ${_firstFontStyle?.label??''},
      fontSize: ${_firstFontSize?.label??''},
      fontWeight: ${_firstFontWeight?.label??''},
      letterSpacing: ${_firstLetterSpacing?.label??''},
      wordSpacing: ${_firstWordSpacing?.label??''},
      textBaseline: ${_firstTextBaseline?.label??''},
      background: ${_firstPaint?.label??''},
      decoration: ${_firstTextDecoration?.label??''},
      decorationColor: ${_firstDecorationColor?.label??''},
      decorationStyle: ${_firstTextDecorationStyle?.label??''},
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
          value: setting.inherit ?? false,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                inherit: value,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kColor),
        ColorGroupWidget(_firstColor, colorValues, (value) {
          setState(() {
            _firstColor = value;
            setting = setting.copyWith(
              color: value.value,
            );
            widget.onchange(setting);
          });
        }),
        DropDownValueTitleWidget(
          selectList: fontSizeValues,
          title: StringParams.kFontSize,
          value: _firstFontSize,
          onChanged: (value) {
            setState(() {
              _firstFontSize = value;
              setting = setting.copyWith(
                fontSize: value.value,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kFontWeight),
        RadioGroupWidget<FontWeight>(_firstFontWeight, fontWeightValues,
            (value) {
          setState(() {
            _firstFontWeight = value;
            setting = setting.copyWith(
              fontWeight: value.value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kFontStyle),
        RadioGroupWidget<FontStyle>(_firstFontStyle, fontStyleValues, (value) {
          setState(() {
            _firstFontStyle = value;
            setting = setting.copyWith(
              fontStyle: value.value,
            );
            widget.onchange(setting);
          });
        }),
        DropDownValueTitleWidget<double>(
          selectList: doubleValues,
          title: StringParams.kLetterSpacing,
          value: _firstLetterSpacing,
          onChanged: (value) {
            setState(() {
              _firstLetterSpacing = value;
              setting = setting.copyWith(
                letterSpacing: value.value,
              );
              widget.onchange(setting);
            });
          },
        ),
        DropDownValueTitleWidget<double>(
          selectList: doubleValues,
          title: StringParams.kWordSpacing,
          value: _firstWordSpacing,
          onChanged: (value) {
            setState(() {
              _firstWordSpacing = value;
              setting = setting.copyWith(
                wordSpacing: value.value,
              );
              widget.onchange(setting);
            });
          },
        ),
        ValueTitleWidget(StringParams.kTextBaseline),
        RadioGroupWidget<TextBaseline>(_firstTextBaseline, TextBaselineValues,
            (value) {
          setState(() {
            _firstTextBaseline = value;
            setting = setting.copyWith(
              textBaseline: value.value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kBackground),
        RadioGroupWidget<Paint>(_firstPaint, paintValues, (value) {
          setState(() {
            _firstPaint = value;
            setting = setting.copyWith(
              background: value.value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kTextDecoration),
        RadioGroupWidget<TextDecoration>(
            _firstTextDecoration, textDecorationValues, (value) {
          setState(() {
            _firstTextDecoration = value;
            setting = setting.copyWith(
              decoration: value.value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kDecorationColor),
        ColorGroupWidget(_firstDecorationColor, colorValues, (value) {
          setState(() {
            _firstDecorationColor = value;
            setting = setting.copyWith(
              decorationColor: value.value,
            );
            widget.onchange(setting);
          });
        }),
        ValueTitleWidget(StringParams.kDecorationStyle),
        RadioGroupWidget<TextDecorationStyle>(
            _firstTextDecorationStyle, textDecorationStyleValues, (value) {
          setState(() {
            _firstTextDecorationStyle = value;
            setting = setting.copyWith(
              decorationStyle: value.value,
            );
            widget.onchange(setting);
          });
        }),
      ],
    );
  }
}

class TextStyleSetting {
  final bool inherit;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double letterSpacing;
  final double wordSpacing;
  final TextBaseline textBaseline;

//  final double height;
//  final Locale locale;
  final Paint background;
  final TextDecoration decoration;
  final Color decorationColor;
  final TextDecorationStyle decorationStyle;

  TextStyleSetting({
    this.inherit: true,
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
    bool inherit,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
//    double height,
//    Locale locale,
    Paint background,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
  }) {
    return TextStyleSetting(
      inherit: inherit ?? this.inherit,
      color: color ?? this.color,
      fontSize: fontSize ?? this.fontSize,
      fontStyle: fontStyle ??this.fontStyle,
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
      inherit: inherit,
      color: color,
      fontSize: fontSize ,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      background: background,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
    );
  }

}
