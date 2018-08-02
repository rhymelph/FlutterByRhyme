import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//属性实体类
import 'params.dart';
export 'params.dart';

///选项高度
const double _kItemHeight = 48.0;

///内边距
const EdgeInsetsDirectional _kPadding =
    const EdgeInsetsDirectional.only(start: 8.0, end: 8.0);

class _ParamItem extends StatelessWidget {
  const _ParamItem({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double textScale = MediaQuery.textScaleFactorOf(context);
    return MergeSemantics(
      ///合并语义的小组件
      child: Container(
        constraints: BoxConstraints(minHeight: _kItemHeight * textScale),
        padding: _kPadding,
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
            style: DefaultTextStyle.of(context).style,
            maxLines: 2,
            overflow: TextOverflow.fade,
            child: IconTheme(
              data: Theme.of(context).primaryIconTheme,
              child: child,
            )),
      ),
    );
  }
}

//标题控件
class ValueTitleWidget extends StatelessWidget {
  ValueTitleWidget(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData data = Theme.of(context);

    return _ParamItem(
      child: DefaultTextStyle(
        style: data.textTheme.title,
        child: Semantics(
          header: true,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}

//点击按钮
class ValueTitleButtonWidget extends StatelessWidget {
  ValueTitleButtonWidget({this.title, this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return _ParamItem(
      child: RaisedButton(
        onPressed: onPressed,
        color: isDark ? Colors.black87 : Colors.white,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(
              color: Colors.grey[300],
              width: 1.0,
            )),
        splashColor: Colors.grey[200],
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}

//开关标题
class SwitchValueTitleWidget extends StatelessWidget {
  SwitchValueTitleWidget({this.title, this.value, this.onChanged});

  final Value<bool> value;
  final String title;
  final ValueChanged<Value<bool>> onChanged;

  void _onChanged(bool a) {
    final Value<bool> changeValue = Value(
      name: a ? 'true' : 'false',
      value: a,
      label: a ? 'true' : 'false',
    );
    onChanged(changeValue);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return _ParamItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Switch(
            value: value?.value ?? false,
            onChanged: _onChanged,
            activeColor: Colors.blue,
            activeTrackColor: isDark ? Colors.white24 : Colors.black26,
          ),
        ],
      ),
    );
  }
}

//下拉选项标题
class DropDownValueTitleWidget<T> extends StatelessWidget {
  DropDownValueTitleWidget(
      {@required this.selectList,
      @required this.title,
      @required this.value,
      this.onChanged});

  final Value<T> value;
  final String title;
  final ValueChanged<Value<T>> onChanged;
  final List<Value<T>> selectList;

  @override
  Widget build(BuildContext context) {
    return _ParamItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButtonHideUnderline(
              child: Container(
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: DropdownButton<Value<T>>(
                  onChanged: onChanged,
                  value: value,
                  items: selectList.map((Value<T> selectValue) {
                    return DropdownMenuItem<Value<T>>(
                        value: selectValue,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(selectValue.name),
                        ));
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//二级选择
class ExpansionPanelTitleWidget extends StatelessWidget {
  ExpansionPanelTitleWidget({
    this.titleWidget,
    this.hintWidget,
    this.isExpanded: false,
    this.onChanged,
  });

  final Widget titleWidget;
  final Widget hintWidget;
  final bool isExpanded;
  final ValueChanged<bool> onChanged;

  ExpansionPanelHeaderBuilder get header {
    return (BuildContext context, bool isExpanded) {
      return titleWidget;
    };
  }

  @override
  Widget build(BuildContext context) {
    return _ParamItem(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          onChanged(!isExpanded);
        },
        children: [
          ExpansionPanel(
              isExpanded: isExpanded, headerBuilder: header, body: hintWidget),
        ],
      ),
    );
  }
}

//单选控件
class RadioWidget<T> extends StatelessWidget {
  RadioWidget(this.value, this.groupValue, this.onchange);

  final Value<T> groupValue;
  final Value<T> value;
  final ValueChanged<Value<T>> onchange;

  Widget getWidget(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color normalColor = isDark ? Colors.black : const Color(0xFFD5D7DA);
    Color checkColor = isDark ? const Color(0xFFD5D7DA) : Colors.black;
    return RawMaterialButton(
      onPressed: () {
        onchange(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(value.name),
      ),
      fillColor: null,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: value == groupValue ? checkColor : normalColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ParamItem(
      child: Tooltip(
        message: value.label,
        child: getWidget(context),
      ),
    );
  }
}

//单选控件组
class RadioGroupWidget<T> extends StatelessWidget {
  RadioGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<T> groupValue;
  final List<Value<T>> valueList;
  final ValueChanged<Value<T>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return RadioWidget(value, groupValue, valueChanged);
        }).toList(),
      ),
    );
  }
}

//颜色选择单选按钮
class ColorWidget extends StatelessWidget {
  ColorWidget(this.value, this.groupValue, this.onchange);

  final Value<Color> groupValue;
  final Value<Color> value;
  final ValueChanged<Value<Color>> onchange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color normalColor = isDark ? Colors.black : const Color(0xFFD5D7DA);
    Color checkColor = isDark ? const Color(0xFFD5D7DA) : Colors.black;
    return _ParamItem(
      child: Tooltip(
        message: value.label,
        child: RawMaterialButton(
          onPressed: () {
            onchange(value);
          },
          constraints: const BoxConstraints.tightFor(
            width: 32.0,
            height: 32.0,
          ),
          fillColor: value.value,
          shape: CircleBorder(
              side: BorderSide(
                  color: value == groupValue ? checkColor : normalColor,
                  width: 3.0)),
        ),
      ),
    );
  }
}

//颜色选择单选按钮组
class ColorGroupWidget extends StatelessWidget {
  ColorGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<Color> groupValue;
  final List<Value<Color>> valueList;
  final ValueChanged<Value<Color>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ColorWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}

//多种颜色组合按钮
class ColorsWidget extends StatelessWidget {
  ColorsWidget(this.value, this.groupValue, this.onchange);

  final Value<MaterialColor> groupValue;
  final Value<MaterialColor> value;
  final ValueChanged<Value<MaterialColor>> onchange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _ParamItem(
      child: Tooltip(
        message: value.label,
        child: RawMaterialButton(
          onPressed: () {
            onchange(value);
          },
          constraints: const BoxConstraints.tightFor(
            width: 32.0,
            height: 32.0,
          ),
          fillColor: value.value.shade400,
          shape: CircleBorder(
              side: BorderSide(
                  color: value == groupValue
                      ? value.value.shade900
                      : const Color(0xFFD5D7DA),
                  width: 3.0)),
        ),
      ),
    );
  }
}

//多种颜色组合按钮组
class ColorsGroupWidget extends StatelessWidget {
  ColorsGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<MaterialColor> groupValue;
  final List<Value<MaterialColor>> valueList;
  final ValueChanged<Value<MaterialColor>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ColorsWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}

//装饰选择单选按钮
class DecorationWidget extends StatelessWidget {
  DecorationWidget(this.value, this.groupValue, this.onchange);

  final Value<Decoration> groupValue;
  final Value<Decoration> value;
  final ValueChanged<Value<Decoration>> onchange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _ParamItem(
      child: Tooltip(
        message: value.label,
        child: GestureDetector(
          onTap: () {
            onchange(value);
          },
          child: DecoratedBox(
            decoration: value.value,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.radio_button_checked,
                size: 10.0,
                color: value == groupValue ? Colors.black : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//装饰选择单选按钮组
class DecorationGroupWidget extends StatelessWidget {
  DecorationGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<Decoration> groupValue;
  final List<Value<Decoration>> valueList;
  final ValueChanged<Value<Decoration>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: DecorationWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}

class EditTextTitleWidget extends StatelessWidget {
  EditTextTitleWidget(this.title, this.value, this.onChanged);

  final String title;
  final Value<String> value;
  final ValueChanged<Value<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    String oldText = '';
    if (value?.name != null) {
      oldText = value.name;
    }
    TextEditingController controller = TextEditingController(text: oldText);
    int selection = 0;
    if (value?.name != null) {
      selection = value.name.length;
    }
    controller.selection =
        TextSelection(baseOffset: selection, extentOffset: selection);
    controller.addListener(() {
      String text = controller.text;
      onChanged(Value<String>(
        name: text,
        value: text,
        label: "'$text'",
      ));
    });
    // TODO: implement build
    return _ParamItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeekBarGroupWidget extends StatelessWidget {
  SeekBarGroupWidget(this.value, this.onChanged);

  final Value<double> value;
  final ValueChanged<Value<double>> onChanged;

  void onChangedValue(double change) {
    onChanged(Value(
      name: '$change',
      value: change,
      label: '$change',
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _ParamItem(
        child: Slider(
      value: value.value,
      onChanged: onChangedValue,
    ));
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
        ValueTitleWidget(StringParams.kColor),
        ColorGroupWidget(setting.color, colorValues, (value) {
          setState(() {
            setting = setting.copyWith(
              color: value,
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
      ],
    );
  }
}

class InputDecorationSetting {
  final Value<Widget> icon;
  final Value<String> labelText;
  final Value<TextStyle> labelStyle;
  final Value<String> helperText;
  final Value<TextStyle> helperStyle;
  final Value<String> hintText;
  final Value<TextStyle> hintStyle;
  final Value<String> errorText;
  final Value<TextStyle> errorStyle;
  final Value<int> errorMaxLines;
  final Value<bool> isDense;
  final Value<EdgeInsetsGeometry> contentPadding;
  final Value<Widget> prefixIcon;
  final Value<String> prefixText;
  final Value<TextStyle> prefixStyle;
  final Value<Widget> suffixIcon;
  final Value<String> suffixText;
  final Value<TextStyle> suffixStyle;
  final Value<String> counterText;
  final Value<TextStyle> counterStyle;
  final Value<bool> filled;
  final Value<Color> fillColor;
  final Value<InputBorder> border;
  final Value<bool> enabled;

  InputDecorationSetting(
      {this.icon,
      this.labelText,
      this.labelStyle,
      this.helperText,
      this.helperStyle,
      this.hintText,
      this.hintStyle,
      this.errorText,
      this.errorStyle,
      this.errorMaxLines,
      this.isDense,
      this.contentPadding,
      this.prefixIcon,
      this.prefixText,
      this.prefixStyle,
      this.suffixText,
      this.suffixIcon,
      this.suffixStyle,
      this.counterText,
      this.counterStyle,
      this.filled,
      this.fillColor,
      this.border,
      this.enabled});

  InputDecorationSetting copyWith({
    Value<Widget> icon,
    Value<String> labelText,
    Value<TextStyle> labelStyle,
    Value<String> helperText,
    Value<TextStyle> helperStyle,
    Value<String> hintText,
    Value<TextStyle> hintStyle,
    Value<String> errorText,
    Value<TextStyle> errorStyle,
    Value<int> errorMaxLines,
    Value<bool> isDense,
    Value<EdgeInsetsGeometry> contentPadding,
    Value<Widget> prefixIcon,
    Value<String> prefixText,
    Value<TextStyle> prefixStyle,
    Value<Widget> suffixIcon,
    Value<String> suffixText,
    Value<TextStyle> suffixStyle,
    Value<String> counterText,
    Value<TextStyle> counterStyle,
    Value<bool> filled,
    Value<Color> fillColor,
    Value<InputBorder> border,
    Value<bool> enabled,
  }) {
    return InputDecorationSetting(
      icon: icon ?? this.icon,
      labelText: labelText ?? this.labelText,
      labelStyle: labelStyle ?? this.labelStyle,
      helperText: helperText ?? this.helperText,
      helperStyle: helperStyle ?? this.helperStyle,
      hintText: hintText ?? this.hintText,
      hintStyle: hintStyle ?? this.hintStyle,
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      isDense: isDense ?? this.isDense,
      contentPadding: contentPadding ?? this.contentPadding,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      prefixText: prefixText ?? this.prefixText,
      prefixStyle: prefixStyle ?? this.prefixStyle,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      suffixText: suffixText ?? this.suffixText,
      suffixStyle: suffixStyle ?? this.suffixStyle,
      counterText: counterText ?? this.counterText,
      counterStyle: counterStyle ?? this.counterStyle,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      border: border ?? this.border,
      enabled: enabled ?? this.enabled,
    );
  }

  InputDecoration onChange() {
    return InputDecoration(
      icon: icon?.value,
      labelText: labelText?.value,
      labelStyle: labelStyle?.value,
      helperText: helperText?.value,
      helperStyle: helperStyle?.value,
      hintText: hintText?.value,
      hintStyle: hintStyle?.value,
      errorText: errorText?.value,
      errorStyle: errorStyle?.value,
      errorMaxLines: errorMaxLines?.value,
      isDense: isDense?.value,
      contentPadding: contentPadding?.value,
      prefixIcon: prefixIcon?.value,
      prefixText: prefixText?.value,
      prefixStyle: prefixStyle?.value,
      suffixIcon: suffixIcon?.value,
      suffixText: suffixText?.value,
      suffixStyle: suffixStyle?.value,
      counterText: counterText?.value,
      counterStyle: counterStyle?.value,
      filled: filled?.value,
      fillColor: fillColor?.value,
      border: border?.value,
      enabled: enabled?.value,
    );
  }
}

class InputDecorationDemo extends StatefulWidget {
  InputDecorationDemo({Key key, this.onchange}) : super(key: key);

  final ValueChanged<Value<InputDecoration>> onchange;

  @override
  _InputDecorationDemoState createState() => _InputDecorationDemoState();
}

class _InputDecorationDemoState extends State<InputDecorationDemo> {
  InputDecorationSetting setting;

  @override
  void initState() {
    // TODO: implement initState
    setting = InputDecorationSetting(
      enabled: boolValues[1],
    );
    super.initState();
  }

  void changeValue() {
    widget.onchange(Value(
      label: getExampleCode(),
      value: setting.onChange(),
    ));
  }

  String getExampleCode() {
    return '''InputDecoration(
      icon: ${setting.icon?.label ?? ''},
      labelText: ${setting.labelText?.label ?? ''},
      labelStyle: ${setting.labelStyle?.label ?? ''},
      helperText: ${setting.helperText?.label ?? ''},
      helperStyle: ${setting.helperStyle?.label ?? ''},
      hintText: ${setting.hintText?.label ?? ''},
      hintStyle: ${setting.hintStyle?.label ?? ''},
      errorText: ${setting.errorText?.label ?? ''},
      errorStyle: ${setting.errorStyle?.label ?? ''},
      errorMaxLines: ${setting.errorMaxLines?.label ?? ''},
      isDense: ${setting.isDense?.label ?? ''},
      contentPadding: ${setting.contentPadding?.label ?? ''},
      prefixIcon: ${setting.prefixIcon?.label ?? ''},
      prefixText: ${setting.prefixText?.label ?? ''},
      prefixStyle: ${setting.prefixStyle?.label ?? ''},
      suffixIcon: ${setting.suffixIcon?.label ?? ''},
      suffixText: ${setting.suffixText?.label ?? ''},
      suffixStyle: ${setting.suffixStyle?.label ?? ''},
      counterText: ${setting.counterText?.label ?? ''},
      counterStyle: ${setting.counterStyle?.label ?? ''},
      filled: ${setting.filled?.label ?? ''},
      fillColor: ${setting.fillColor?.label ?? ''},
      border: ${setting.border?.label ?? ''},
      enabled: ${setting.enabled?.label ?? ''},
    )''';
  }

  bool isLabelStyle = false;
  bool isHelperStyle = false;
  bool isHintStyle = false;
  bool isErrorStyle = false;
  bool isCounterStyle=false;
  bool isPrefixStyle=false;
  bool isSuffixStyle=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ValueTitleWidget('Icon'),
        RadioGroupWidget(setting.icon, iconButtonValues, (value){
          setState(() {
            setting=setting.copyWith(icon: value);
            changeValue();
          });
        }),
        
        ValueTitleWidget('contentPadding'),
        RadioGroupWidget(setting.contentPadding, paddingValues, (value){
          setState(() {
            setting=setting.copyWith(contentPadding: value);
            changeValue();
          });
        }),
        ValueTitleWidget('border'),
        RadioGroupWidget(setting.border, inputBorderValues, (value){
          setState(() {
            setting=setting.copyWith(border: value);
            changeValue();
          });
        }),
        SwitchValueTitleWidget(title: 'enabled',value: setting.enabled,
          onChanged: (value){
            setState(() {
              setting=setting.copyWith(enabled: value);
              changeValue();
            });
          },),
        SwitchValueTitleWidget(title: 'isDense',value: setting.isDense,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(isDense: value);
            changeValue();
          });
        },),
        SwitchValueTitleWidget(title: 'filled',value: setting.filled,
          onChanged: (value){
            setState(() {
              setting=setting.copyWith(filled: value);
              changeValue();
            });
          },),
        ValueTitleWidget(''),
        ColorGroupWidget(setting.fillColor, colorValues, (value){
          setState(() {
            setting=setting.copyWith(fillColor: value);
            changeValue();
          });
        }),
        EditTextTitleWidget('hintText', setting.hintText, (value) {
          setState(() {
            setting = setting.copyWith(
              hintText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('hintStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  hintStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isHintStyle,
          onChanged: (value) {
            setState(() {
              this.isHintStyle = value;
            });
          },
        ),
        EditTextTitleWidget('labelText', setting.labelText, (value) {
          setState(() {
            setting = setting.copyWith(
              labelText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('labelStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  labelStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isLabelStyle,
          onChanged: (value) {
            setState(() {
              this.isLabelStyle = value;
            });
          },
        ),
        EditTextTitleWidget('helperText', setting.helperText, (value) {
          setState(() {
            setting = setting.copyWith(
              helperText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('helperStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  helperStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isHelperStyle,
          onChanged: (value) {
            setState(() {
              this.isHelperStyle = value;
            });
          },
        ),
        EditTextTitleWidget('errorText', setting.errorText, (value) {
          setState(() {
            setting = setting.copyWith(
              errorText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('errorStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  errorStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isErrorStyle,
          onChanged: (value) {
            setState(() {
              this.isErrorStyle = value;
            });
          },
        ),
        DropDownValueTitleWidget(
          selectList: intValues,
          title: 'errorMaxLines',
          value: setting.errorMaxLines,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(
                errorMaxLines: value,
              );
              changeValue();
            });
          },
        ),
        EditTextTitleWidget('counterText', setting.counterText, (value) {
          setState(() {
            setting = setting.copyWith(
              counterText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('counterStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  counterStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isCounterStyle,
          onChanged: (value) {
            setState(() {
              this.isCounterStyle = value;
            });
          },
        ),
        ValueTitleWidget('prefixIcon'),
        RadioGroupWidget(setting.prefixIcon, iconButtonValues, (value){
          setState(() {
            setting=setting.copyWith(prefixIcon: value);
            changeValue();
          });
        }),
        EditTextTitleWidget('prefixText', setting.prefixText, (value) {
          setState(() {
            setting = setting.copyWith(
              prefixText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('prefixStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  prefixStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isPrefixStyle,
          onChanged: (value) {
            setState(() {
              this.isPrefixStyle = value;
            });
          },
        ),
        ValueTitleWidget('suffixIcon'),
        RadioGroupWidget(setting.suffixIcon, iconButtonValues, (value){
          setState(() {
            setting=setting.copyWith(suffixIcon: value);
            changeValue();
          });
        }),
        EditTextTitleWidget('suffixText', setting.suffixText, (value) {
          setState(() {
            setting = setting.copyWith(
              suffixText: value,
            );
            changeValue();
          });
        }),
        ExpansionPanelTitleWidget(
          titleWidget: ValueTitleWidget('suffixStyle'),
          hintWidget: TextStyleDemo(
            onchange: (value) {
              setState(() {
                setting = setting.copyWith(
                  suffixStyle: value,
                );
                changeValue();
              });
            },
          ),
          isExpanded: isSuffixStyle,
          onChanged: (value) {
            setState(() {
              this.isSuffixStyle = value;
            });
          },
        ),
      ],
    );
  }
}
