import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TextDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Text';
  final String detail = '';

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends ExampleState<TextDemo> {
  TextSetting setting;
  Value<TextStyle> _firstStyle;
  Value<TextAlign> _firstTextAlign;
  Value<TextDirection> _firstTextDirection;
  Value<bool> _firstSoftWrap;
  Value<TextOverflow> _firstOverflow;
  Value<double> _firstTextScaleFactor;
  Value<int> _firstMaxLines;

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
    return '''return Text(’content‘,
      style: ${_firstStyle?.value ?? ''},
      textAlign: ${_firstTextAlign?.value ?? ''},
      textDirection: ${_firstTextDirection?.value ?? ''},
      softWrap: ${_firstSoftWrap?.value ?? 'true'},
      overflow: ${_firstOverflow?.value ?? ''},
      textScaleFactor: ${_firstTextScaleFactor?.value ?? ''},
      maxLines: ${_firstMaxLines?.value ?? ''},
    );''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('Style(样式)'),
      ValueTitleWidget('TextAlign(文本对齐)'),
      RadioGroupWidget<TextAlign>(_firstTextAlign, textAlignValues, (value) {
        setState(() {
          _firstTextAlign = value;
          setting = setting.copyWith(textAlign: value.value);
        });
      }),
      ValueTitleWidget('TextDirection(文本方向)'),
      RadioGroupWidget<TextDirection>(_firstTextDirection, textDirectionValues,
          (value) {
        setState(() {
          _firstTextDirection = value;
          setting = setting.copyWith(textDirection: value.value);
        });
      }),
      SwitchValueTitleWidget(
        title: 'SoftWrap(自动换行,如果超出屏幕)',
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
      ValueTitleWidget('Overflow(处理文本溢出)'),
      RadioGroupWidget<TextOverflow>(_firstOverflow, textOverflowValues,
          (value) {
        setState(() {
          _firstOverflow = value;
          setting = setting.copyWith(overflow: value.value);
        });
      }),
      DropDownValueTitleWidget<double>(
        title: 'TextScaleFactor(文本比例)',
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
        title: 'MaxLines(最大行数)',
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
    return Text(
      '''Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.
    Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码一起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。''',
      style: setting.style,
      textAlign: setting.textAlign,
      textDirection: setting.textDirection,
      softWrap: setting.softWrap,
      overflow: setting.overflow,
      textScaleFactor: setting.textScaleFactor,
      maxLines: setting.maxLines,
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
  @override
  _TextStyleDemoState createState() => _TextStyleDemoState();
}

class _TextStyleDemoState extends State<TextStyleDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
  final double height;
  final Locale locale;
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
    this.height,
    this.locale,
    this.background,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
  });

  TextStyleSetting copyWith(
    bool inherit,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    double letterSpacing,
    double wordSpacing,
    TextBaseline textBaseline,
    double height,
    Locale locale,
    Paint background,
    TextDecoration decoration,
    Color decorationColor,
    TextDecorationStyle decorationStyle,
  ) {
    return TextStyleSetting(
      inherit: inherit??this.inherit,
      color: color??this.color,
      fontSize: fontSize??this.fontSize,
      fontWeight: fontWeight??this.fontWeight,
      letterSpacing: letterSpacing??this.letterSpacing,
      wordSpacing: wordSpacing??this.wordSpacing,
      textBaseline: textBaseline??this.textBaseline,
      height: height??this.height,
      locale: locale??this.locale,
      background: background??this.background,
      decoration: decoration??this.decoration,
      decorationColor: decorationColor??this.decorationColor,
      decorationStyle: decorationStyle??this.decorationStyle,
    );
  }
}
