import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TextFieldDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TextField';
  final String detail = '''材料设计文本字段。

文本字段允许用户使用硬件键盘或屏幕键盘输入文本。

只要用户更改字段中的文本，文本字段就会调用onChanged回调。如果用户指示他们已完成在字段中键入（例如，通过按下软键盘上的按钮），则文本字段调用onSubmitted回调。

要控制文本字段中显示的文本，请使用 控制器。例如，要设置文本字段的初始值，请使用已包含某些文本的控制器。该控制器还可以控制的选择和组成区域（并观察更改文本，选择和组成区域）。

默认情况下，文本字段具有在文本字段下方绘制分隔符的装饰。您可以使用decoration属性来控制装饰，例如通过添加标签或图标。如果将decoration 属性设置为null，则将完全删除装饰，包括装饰引入的额外填充以节省标签的空间。

如果修饰非空（这是默认设置），则文本字段要求其祖先之一为“ 材质”窗口小部件。当的TextField被轻触的油墨飞溅，关于材料油漆被触发时，看到 ThemeData.splashFactory。

要将TextField与其他FormField小部件集成到Form中，请考虑使用TextFormField。''';

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
        label: '_controller',
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
        label: '_node',
      ),
      onChanged: Value(
        name: 'onChanged',
        value: (value){
          //todo
        },
        label: '''(value){
          //todo 当输入文本改变时会触发
        }''',
      ),
      onSubmitted: Value(
        name: 'onSubmitted',
        value: (value){
          //todo
        },
        label: '''(value){
          //todo 点击软键盘的提交按钮会触发
        }''',
      )
    );
    //添加监听
    setting.focusNode.value.addListener((){
//      print(setting.focusNode.value.hasFocus);
    });
    setting.controller.value.addListener((){
//      print(setting.controller.value.text);
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
    return '''TextEditingController _controller=TextEditingController();
    //监听输入的文本
    _controller.addListener((){
//      print(controller.text);
    });
FocusNode _node=FocusNode();
    //监听输入框获取焦点
    _node.addListener((){
//      print(node.hasFocus);
    });
    TextField(
        controller: ${setting.controller?.label??''},
        focusNode: ${setting.focusNode?.label??''},
        decoration: ${setting.decoration?.label??''},
        keyboardType: ${setting.keyboardType?.label??''},
        style: ${setting.style?.label??''},
        textAlign: ${setting.textAlign?.label??''},
        autofocus: ${setting.autofocus?.label??''},
        obscureText: ${setting.obscureText?.label??''},
        autocorrect: ${setting.autocorrect?.label??''},
        maxLines: ${setting.maxLines?.label??''},
        maxLength: ${setting.maxLength?.label??''},
        maxLengthEnforced: ${setting.maxLengthEnforced?.label??''},
        onChanged: ${setting.onChanged?.label??''},
        onSubmitted: ${setting.onSubmitted?.label??''},
        inputFormatters: ${setting.inputFormatters?.label??''},
        enabled: ${setting.enabled?.label??''},
      )''';
  }

  bool isDecorationExpanded=false;
  bool isStyleExpanded=false;

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isStyleExpanded,
        onChanged: (value){
          setState(() {
            this.isStyleExpanded=value;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kStyle),
        hintWidget: TextStyleDemo(onchange: (value){
          setState(() {
            setting=setting.copyWith(style: value);
          });
        },),
      ),
      ExpansionPanelTitleWidget(
        isExpanded: isDecorationExpanded,
        onChanged: (value){
          setState(() {
            this.isDecorationExpanded=value;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kDecoration),
        hintWidget: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          return InputDecorationDemo(onchange: (value){
            setState(() {
              setting=setting.copyWith(decoration: value);
            });
          },);
        }),
      ),
      ValueTitleWidget(StringParams.kTextAlign),
      RadioGroupWidget(setting.textAlign, textAlignValues, (value){
        setState(() {
          setting=setting.copyWith(textAlign: value);
        });
      }),
      ValueTitleWidget(StringParams.kKeyboardType),
      RadioGroupWidget(setting.keyboardType, textInputTypeValues, (value){
        setState(() {
          setting.controller.value.clear();
          setting=setting.copyWith(keyboardType: value);
        });
      }),
      ValueTitleWidget(StringParams.kInputFormatters),
      RadioGroupWidget(setting.inputFormatters, textinputFormatterValues, (value){
        setState(() {
          setting.controller.value.clear();
          setting=setting.copyWith(inputFormatters: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kAutoFocus,
        value: setting.autofocus,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(autofocus: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kAutoCorrect,
        value: setting.autocorrect,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(autocorrect: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kObscureText,
        value: setting.obscureText,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(obscureText: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kMaxLengthEnforced,
        value: setting.maxLengthEnforced,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxLengthEnforced: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kEnabled,
        value: setting.enabled,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(enabled: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: intMiniValues,
        title: StringParams.kMaxLines,
        value: setting.maxLines,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(maxLines: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: intMiniValues,
        title: StringParams.kMaxLength,
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
