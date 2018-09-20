import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TextDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Text';
  final String detail = '''一系列具有单一样式的文本。

“ 文本”小组件显示单个样式的文本字符串。字符串可能会跨越多行，也可能全部显示在同一行上，具体取决于布局约束。

该风格参数可选。省略时，文本将使用最接近的DefaultTextStyle中的样式。如果给定样式的 TextStyle.inherit属性为true（默认值），则给定样式将与最接近的DefaultTextStyle合并。例如，这种合并行为很有用，可以在使用默认字体系列和大小时使文本变为粗体.''';

  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends ExampleState<TextDemo> {
  TextSetting setting;

  bool isExpanded = false;


  @override
  void initState() {
    setting = TextSetting(
      textScaleFactor: doubleMiniValues[1],
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
      style: ${setting.style?.label?? ''},
      textAlign: ${setting.textAlign?.label ?? ''},
      textDirection: ${setting.textDirection?.label ?? ''},
      softWrap: ${setting.softWrap?.label ?? 'true'},
      overflow: ${setting.overflow?.label ?? ''},
      textScaleFactor: ${setting.textScaleFactor?.label ?? ''},
      maxLines: ${setting.maxLines?.label ?? ''},
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
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                  style: value,);
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
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget<TextOverflow>(setting.overflow, textOverflowValues,
              (value) {
            setState(() {
              setting = setting.copyWith(overflow: value);
            });
          }),
      SwitchValueTitleWidget(
        title: StringParams.kSoftWrap,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(softWrap: value);
          });
        },
        value: setting.softWrap,
      ),
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
        selectList: intMiniValues,
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
    bool isDark=Theme.of(context).brightness==Brightness.dark;

    return Container(
      color: isDark?Colors.black38:Colors.grey[300],
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