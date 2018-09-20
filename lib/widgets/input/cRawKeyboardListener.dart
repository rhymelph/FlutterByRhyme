import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RawKeyboardListenerDemo extends StatefulWidget {
  static const String routeName = 'widgets/input/RawKeyboardListener';
  final String detail = '''每当用户按下或释放键盘上的键时调用回调的小部件。

一个RawKeyboardListener是欣赏被表示为原料按键按键事件和硬件按钮非常有用。通常由游戏和其他应用程序使用，这些应用程序将键盘用于文本输入以外的目的。

对于文本输入，请考虑使用EditableText，它与屏幕键盘和输入法编辑器（IME）集成。''';

  @override
  _RawKeyboardListenerDemoState createState() =>
      _RawKeyboardListenerDemoState();
}

class _RawKeyboardListenerDemoState
    extends ExampleState<RawKeyboardListenerDemo> {
  RawKeyboardListenerSetting setting;
  String putDownKey='';
  FocusNode focusNode;
  @override
  void initState() {
    focusNode=FocusNode()
      ..addListener((){
        print('hasFocus:${focusNode.hasFocus}');
        print('consumeKeyboardToken:${focusNode.consumeKeyboardToken()}');
        print('runtimeType:${focusNode.runtimeType.toString()}');
      });
    setting = RawKeyboardListenerSetting(
      child: Value(
          value: TextField(
        controller: TextEditingController(),
      )),
      focusNode: Value(
        value: focusNode,
        label: 'focusNode'
      ),
      onKey: Value(
        value: (key){
          setState(() {
            //TODO key.data获取到的键
            putDownKey=key.data.toString();
          });
        }
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('当前按下的键为:'),
      Center(child: Text(putDownKey)),
    ];
  }

  @override
  String getTitle() {
    return 'RawKeyboardListener';
  }

  @override
  Widget getWidget() {
    return RawKeyboardListener(
      child: setting.child?.value,
      focusNode: setting.focusNode?.value,
      onKey: setting.onKey?.value,
    );
  }
}

class RawKeyboardListenerSetting {
  final Value<FocusNode> focusNode;
  final Value<ValueChanged<RawKeyEvent>> onKey;
  final Value<Widget> child;

  RawKeyboardListenerSetting(
      {@required this.focusNode, @required this.onKey, @required this.child});

  RawKeyboardListenerSetting copyWith({
    Value<FocusNode> focusNode,
    Value<ValueChanged<RawKeyEvent>> onKey,
    Value<Widget> child,
  }) {
    return RawKeyboardListenerSetting(
      focusNode: focusNode ?? this.focusNode,
      onKey: onKey ?? this.onKey,
      child: child ?? this.child,
    );
  }
}
