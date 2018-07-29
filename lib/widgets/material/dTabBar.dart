import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TabBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TabBar';
  final String detail = '''A material design widget that displays a horizontal row of tabs.
Typically created as the AppBar.bottom part of an AppBar and in conjunction with a TabBarView.
If a TabController is not provided, then a DefaultTabController ancestor must be provided instead. The tab controller's TabController.length must equal the length of the tabs list.
Requires one of its ancestors to be a Material widget.
See also:
TabBarView, which displays page views that correspond to each tab.''';

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends ExampleState<TabBarDemo> {
  TabBarSetting setting;

  bool isExpanded = false;
  bool isUnSelectExpanded = false;

  @override
  void initState() {
    setting = TabBarSetting(
      tabs: tabValues[0],
      isScrollable: const Value(
        name: 'true',
        value: true,
        label: 'true',
      ),
      indicator: decorationValues[0],
      indicatorWeight: doubleMiniValues[0],
    );

    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''DefaultTabController(
      length: ${setting.tabs.value.length.toString()},
      child: Scaffold(
        appBar: TabBar(
          tabs: ${setting.tabs?.label??''},
          controller: ${setting.controller?.label??''},
          isScrollable: ${setting.isScrollable?.label??''},
          indicatorColor: ${setting.indicatorColor?.label??''},
          indicatorWeight: ${setting.indicatorWeight?.label??''},
          indicatorPadding: ${setting.indicatorPadding?.label??''},
          indicator: ${setting.indicator?.label??''},
          indicatorSize: ${setting.indicatorSize?.label??''},
          labelColor: ${setting.labelColor?.label??''},
          unselectedLabelColor: ${setting.unselectedLabelColor?.label??''},
          labelStyle: ${setting.labelStyle?.label??''},
          unselectedLabelStyle: ${setting.unselectedLabelStyle?.label??''},
        ),
        body: Center(child: Text('Body')),
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTabs),
      RadioGroupWidget(setting.tabs, tabValues, (value) {
        setState(() {
          setting = setting.copyWith(tabs: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kIsScrollable,
        value: setting.isScrollable,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isScrollable: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kLabelColor),
      ColorGroupWidget(setting.labelColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(labelColor: value);
        });
      }),
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kLabelStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                labelStyle: value,
              );
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kIndicatorColor),
      ColorGroupWidget(setting.indicatorColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(indicatorColor: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kIndicatorWeight,
        value: setting.indicatorWeight,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(indicatorWeight: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kIndicatorPadding),
      RadioGroupWidget(setting.indicatorPadding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(indicatorPadding: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicatorSize),
      RadioGroupWidget(setting.indicatorSize, tabBarIndicatorSizeValues, (value) {
        setState(() {
          setting = setting.copyWith(indicatorSize: value);
        });
      }),
      ValueTitleWidget(StringParams.kIndicator),
      DecorationGroupWidget(setting.indicator, decorationValues, (value) {
        setState(() {
          setting = setting.copyWith(indicator: value);
        });
      }),
      ValueTitleWidget(StringParams.kUnselectedLabelColor),
      ColorGroupWidget(setting.unselectedLabelColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(unselectedLabelColor: value);
        });
      }),
      ExpansionPanelTitleWidget(
        isExpanded: isUnSelectExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isUnSelectExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kUnselectedLabelStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                unselectedLabelStyle: value,
              );
            });
          },
        ),
      ),
    ];
  }

  @override
  String getTitle() {
    return 'TabBar';
  }

  @override
  Widget getWidget() {
    return DefaultTabController(
      length: setting.tabs.value.length,
      child: Scaffold(
        appBar: TabBar(
          tabs: setting.tabs?.value,
          controller: setting.controller?.value,
          isScrollable: setting.isScrollable?.value,
          indicatorColor: setting.indicatorColor?.value,
          indicatorWeight: setting.indicatorWeight?.value,
          indicatorPadding: setting.indicatorPadding?.value,
          indicator: setting.indicator?.value,
          indicatorSize: setting.indicatorSize?.value,
          labelColor: setting.labelColor?.value,
          unselectedLabelColor: setting.unselectedLabelColor?.value,
          labelStyle: setting.labelStyle?.value,
          unselectedLabelStyle: setting.unselectedLabelStyle?.value,
        ),
        body: Center(child: Text('Body')),
      ),
    );
  }
}

class TabBarSetting {
  final Value<List<Widget>> tabs;
  final Value<TabController> controller;
  final Value<bool> isScrollable;
  final Value<Color> indicatorColor;
  final Value<double> indicatorWeight;
  final Value<EdgeInsetsGeometry> indicatorPadding;
  final Value<Decoration> indicator;
  final Value<TabBarIndicatorSize> indicatorSize;
  final Value<Color> labelColor;
  final Value<TextStyle> labelStyle;
  final Value<Color> unselectedLabelColor;
  final Value<TextStyle> unselectedLabelStyle;

  TabBarSetting({
    @required this.tabs,
    this.controller,
    this.isScrollable,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorPadding,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
  });

  TabBarSetting copyWith({
    Value<List<Widget>> tabs,
    Value<TabController> controller,
    Value<bool> isScrollable,
    Value<Color> indicatorColor,
    Value<double> indicatorWeight,
    Value<EdgeInsetsGeometry> indicatorPadding,
    Value<Decoration> indicator,
    Value<TabBarIndicatorSize> indicatorSize,
    Value<Color> labelColor,
    Value<Color> unselectedLabelColor,
    Value<TextStyle> labelStyle,
    Value<TextStyle> unselectedLabelStyle,
  }) {
    return TabBarSetting(
      tabs: tabs ?? this.tabs,
      controller: controller ?? this.controller,
      isScrollable: isScrollable ?? this.isScrollable,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      indicatorWeight: indicatorWeight ?? this.indicatorWeight,
      indicatorPadding: indicatorPadding ?? this.indicatorPadding,
      indicator: indicator ?? this.indicator,
      indicatorSize: indicatorSize ?? this.indicatorSize,
      labelColor: labelColor ?? this.labelColor,
      labelStyle: labelStyle ?? this.labelStyle,
      unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
    );
  }
}

class TextStyleDemo extends StatefulWidget {
  TextStyleDemo({Key key, this.onchange}) : super(key: key);

  final ValueChanged<Value<TextStyle>> onchange;

  @override
  _TextStyleDemoState createState() => _TextStyleDemoState();
}

class _TextStyleDemoState extends State<TextStyleDemo> {
  TextStyleSetting setting;

  @override
  void initState() {
    // TODO: implement initState
    setting = TextStyleSetting();
    super.initState();
  }

  void changeValue() {
    widget.onchange(Value(
      label: getExampleCode(),
      value: setting.onChange(),
    ));
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
          value: setting.inherit,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                inherit: value,
              );
              changeValue();
            });
          },
        ),
        ValueTitleWidget(StringParams.kColor),
        ColorGroupWidget(setting.color, colorValues, (value) {
          setState(() {
            setting = setting.copyWith(
              color: value,
            );
            changeValue();
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
              changeValue();
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
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kFontStyle),
        RadioGroupWidget<FontStyle>(setting.fontStyle, fontStyleValues,
            (value) {
          setState(() {
            setting = setting.copyWith(
              fontStyle: value,
            );
            changeValue();
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
              changeValue();
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
              changeValue();
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
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kBackground),
        RadioGroupWidget<Paint>(setting.background, paintValues, (value) {
          setState(() {
            setting = setting.copyWith(
              background: value,
            );
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kTextDecoration),
        RadioGroupWidget<TextDecoration>(
            setting.decoration, textDecorationValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decoration: value,
            );
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kDecorationColor),
        ColorGroupWidget(setting.decorationColor, colorValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decorationColor: value,
            );
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kDecorationStyle),
        RadioGroupWidget<TextDecorationStyle>(
            setting.decorationStyle, textDecorationStyleValues, (value) {
          setState(() {
            setting = setting.copyWith(
              decorationStyle: value,
            );
            changeValue();
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
