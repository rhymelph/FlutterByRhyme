import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class AbsorbPointerDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/AbsorbPointer';
  final String detail = '''在命中测试期间吸收指针的小部件。

当吸收为真时，此小部件通过终止命中测试来阻止其子树接收指针事件。它仍然会在布局过程中消耗空间并像往常一样对孩子进行绘画。它只是阻止它的子节点成为定位事件的目标，因为它从RenderBox.hitTest返回true 。''';

  @override
  _AbsorbPointerDemoState createState() =>
      _AbsorbPointerDemoState();
}

class _AbsorbPointerDemoState
    extends ExampleState<AbsorbPointerDemo> {
  AbsorbPointerSetting setting;

  @override
  void initState() {
    setting = AbsorbPointerSetting(child: Value(
      value: GestureDetector(onTap:(){exampleKey.currentState.showToast('点击');},child: Image.asset('images/burgers.jpg')),
      label: "GestureDetector(onTap:(){exampleKey.currentState.showToast('点击');},child: Image.asset('images/burgers.jpg'))",
    ),
      absorbing: boolValues[0],
      ignoringSemantics: boolValues[0],);
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AbsorbPointer(
      ignoring: ${setting.absorbing?.label??''},
      ignoringSemantics: ${setting.ignoringSemantics?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
          title: StringParams.kIgnoring,
          value: setting.absorbing,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(absorbing: value);
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
    return 'AbsorbPointer';
  }


  @override
  Widget getWidget() {
    return AbsorbPointer(
      absorbing: setting.absorbing?.value,
      ignoringSemantics: setting.ignoringSemantics?.value,
      child: setting.child?.value,);
  }
}

class AbsorbPointerSetting {
  final Value<bool> absorbing;
  final Value<bool> ignoringSemantics;
  final Value<Widget> child;

  AbsorbPointerSetting({this.absorbing, this.ignoringSemantics, this.child});

  AbsorbPointerSetting copyWith({
    Value<bool> absorbing,
    Value<bool> ignoringSemantics,
    Value<Widget> child,
  }) {

    return AbsorbPointerSetting(
      absorbing: absorbing ?? this.absorbing,
      ignoringSemantics: ignoringSemantics ?? this.ignoringSemantics,
      child: child ?? this.child,
    );
  }
}
