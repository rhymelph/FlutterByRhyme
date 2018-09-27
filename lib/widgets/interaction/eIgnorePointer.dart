import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IgnorePointerDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/IgnorePointer';
  final String detail = '''在命中测试期间不可见的小部件。

如果忽略为true，则此窗口小部件（及其子树）对于命中测试是不可见的。它仍然会在布局过程中消耗空间并像往常一样对孩子进行绘画。它只是不能成为找到事件的目标，因为它从RenderBox.hitTest返回false 。

当忽略语义为真时，子树对于语义层是不可见的（因此例如可访问性工具）。如果 ignoringSemantics为null，它使用的值忽略。''';

  @override
  _IgnorePointerDemoState createState() => _IgnorePointerDemoState();
}

class _IgnorePointerDemoState extends ExampleState<IgnorePointerDemo> {
  IgnorePointerSetting setting;

  @override
  void initState() {
    setting = IgnorePointerSetting(
        child: Value(
          value: GestureDetector(onTap:(){exampleKey.currentState.showToast('点击');},child: Image.asset('images/burgers.jpg')),
          label: "GestureDetector(onTap:(){exampleKey.currentState.showToast('点击');},child: Image.asset('images/burgers.jpg'))",
        ),
      ignoring: boolValues[0],
      ignoringSemantics: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''IgnorePointer(
      ignoring: ${setting.ignoring?.label??''},
      ignoringSemantics: ${setting.ignoringSemantics?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {

    return [
      SwitchValueTitleWidget(
          title: StringParams.kIgnoring,
          value: setting.ignoring,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(ignoring: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kIgnoringSemantics,
          value: setting.ignoringSemantics,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(ignoringSemantics: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'IgnorePointer';
  }

  @override
  Widget getWidget() {
    return IgnorePointer(
      ignoring: setting.ignoring?.value,
      ignoringSemantics: setting.ignoringSemantics?.value,
      child: setting.child?.value,
    );
  }
}

class IgnorePointerSetting {
  final Value<bool> ignoring;
  final Value<bool> ignoringSemantics;
  final Value<Widget> child;

  IgnorePointerSetting({this.ignoring, this.ignoringSemantics, this.child});

  IgnorePointerSetting copyWith({
    Value<bool> ignoring,
    Value<bool> ignoringSemantics,
    Value<Widget> child,
  }) {
    return IgnorePointerSetting(
      ignoring: ignoring ?? this.ignoring,
      ignoringSemantics: ignoringSemantics ?? this.ignoringSemantics,
      child: child ?? this.child,
    );
  }
}
