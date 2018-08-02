import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TextFieldDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TextField';
  final String detail = '';

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends ExampleState<TextFieldDemo> {
  TextFieldSetting setting;

  @override
  void initState() {
    setting = TextFieldSetting(
      controller: Value(
        name: 'controller',
        value: TextEditingController(),
        label: 'TextEditingController()',
      ),
      decoration: inputDecorationValues[0],
      keyboardType: textInputTypeValues[0],
      textAlign: textAlignValues[0],
      autocorrect: boolValues[0],
      autofocus: boolValues[0],
      obscureText: boolValues[0],
      enabled: boolValues[1],
      maxLengthEnforced: boolValues[0],
      focusNode: Value(
        name: 'focusNode',
        value: FocusNode(),
        label: 'node',
      )
    );
    //添加监听
    setting.focusNode.value.addListener((){
      print(setting.focusNode.value.hasFocus);
    });
    setting.controller.value.addListener((){
      print(setting.controller.value.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    setting.focusNode.value.dispose();
    setting.controller.value.dispose();
    super.dispose();
  }
  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '';
  }

  bool isExpanded=false;

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (value){
          setState(() {
            this.isExpanded=value;
          });
        },
        titleWidget: ValueTitleWidget('decoration'),
        hintWidget: InputDecorationDemo(
          onchange: (value){
            setState(() {
              setting=setting.copyWith(decoration: value);
            });
          },
        ),
      ),
      ValueTitleWidget('textAlign'),
      RadioGroupWidget(setting.textAlign, textAlignValues, (value){
        setState(() {
          setting=setting.copyWith(textAlign: value);
        });
      }),
      ValueTitleWidget('keyboardType'),
      RadioGroupWidget(setting.keyboardType, textInputTypeValues, (value){
        setState(() {
          setting.controller.value.clear();
          setting=setting.copyWith(keyboardType: value);
        });
      }),
      SwitchValueTitleWidget(
        title: 'autofocus',
        value: setting.autofocus,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(autofocus: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: 'autocorrect',
        value: setting.autocorrect,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(autocorrect: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: 'obscureText',
        value: setting.obscureText,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(obscureText: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: 'maxLengthEnforced',
        value: setting.maxLengthEnforced,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxLengthEnforced: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: 'enabled',
        value: setting.enabled,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(enabled: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: intValues,
        title: 'maxLines',
        value: setting.maxLines,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(maxLines: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: intValues,
        title: 'maxLength',
        value: setting.maxLength,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(maxLength: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'TextField';
  }

  @override
  Widget getWidget() {
    return Center(
      child: TextField(
        controller: setting.controller?.value,
        focusNode: setting.focusNode?.value,
        decoration: setting.decoration?.value,
        keyboardType: setting.keyboardType?.value,
        style: setting.style?.value,
        textAlign: setting.textAlign?.value,
        autofocus: setting.autofocus?.value,
        obscureText: setting.obscureText?.value,
        autocorrect: setting.autocorrect?.value,
        maxLines: setting.maxLines?.value,
        maxLength: setting.maxLength?.value,
        maxLengthEnforced: setting.maxLengthEnforced?.value,
        onChanged: setting.onChanged?.value,
        onSubmitted: setting.onSubmitted?.value,
        inputFormatters: setting.inputFormatters?.value,
        enabled: setting.enabled?.value,
      ),
    );
  }

}

class TextFieldSetting {
  final Value<TextEditingController> controller;
  final Value<FocusNode> focusNode;
  final Value<InputDecoration> decoration;
  final Value<TextInputType> keyboardType;
  final Value<TextStyle> style;
  final Value<TextAlign> textAlign;
  final Value<ValueChanged<String>> onChanged;
  final Value<ValueChanged<String>> onSubmitted;
  final Value<List<TextInputFormatter>> inputFormatters;
  final Value<bool> autofocus;
  final Value<bool> obscureText;
  final Value<bool> autocorrect;
  final Value<bool> maxLengthEnforced;
  final Value<bool> enabled;
  final Value<int> maxLines;
  final Value<int> maxLength;

  TextFieldSetting({
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
  });

  TextFieldSetting copyWith({
    Value<TextEditingController> controller,
    Value<FocusNode> focusNode,
    Value<InputDecoration> decoration,
    Value<TextInputType> keyboardType,
    Value<TextStyle> style,
    Value<TextAlign> textAlign,
    Value<bool> autofocus,
    Value<bool> obscureText,
    Value<bool> autocorrect,
    Value<int> maxLines,
    Value<int> maxLength,
    Value<bool> maxLengthEnforced,
    Value<ValueChanged<String>> onChanged,
    Value<ValueChanged<String>> onSubmitted,
    Value<List<TextInputFormatter>> inputFormatters,
    Value<bool> enabled,
  }) {
    return TextFieldSetting(
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
      decoration: decoration ?? this.decoration,
      keyboardType: keyboardType ?? this.keyboardType,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      autofocus: autofocus ?? this.autofocus,
      obscureText: obscureText ?? this.obscureText,
      autocorrect: autocorrect ?? this.autocorrect,
      maxLines: maxLines ?? this.maxLines,
      maxLength: maxLength ?? this.maxLength,
      maxLengthEnforced: maxLengthEnforced ?? this.maxLengthEnforced,
      onChanged: onChanged ?? this.onChanged,
      onSubmitted: onSubmitted ?? this.onSubmitted,
      inputFormatters: inputFormatters ?? this.inputFormatters,
      enabled: enabled ?? this.enabled,
    );
  }
}
