import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class OffstageDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Offstage';
  final String detail = '''一个小部件，它将孩子放在树中，但没有绘制任何东西，没有让孩子可用于命中测试，也没有占用父母的任何空间。

动画继续在舞台上的孩子中运行，因此无论动画最终是否可见，都会使用电池和CPU时间。

可以使用Offstage来测量小部件的尺寸，而无需将其带到屏幕上（尚未）。要在不需要的情况下隐藏窗口小部件，请更喜欢从树中完全删除窗口小部件，而不是将其保留在Offstage子树中。''';

  @override
  _OffstageDemoState createState() =>
      _OffstageDemoState();
}

class _OffstageDemoState
    extends ExampleState<OffstageDemo> {
  OffstageSetting setting;

  @override
  void initState() {
    setting = OffstageSetting(
      offstage: boolValues[0],
      child: Value(
        value: SizedBox.fromSize(
          size: Size(35.0, 35.0),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        label: '''SizedBox.fromSize(
          size: Size(35.0, 35.0),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        )''',
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
    return '''Offstage(
        offstage: ${setting.offstage.label??''},
        child: ${setting.child.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(title: StringParams.kOffstage, value: setting.offstage, onChanged: (value){
        setState(() {
          setting=setting.copyWith(offstage: value);
        });
      })
    ];
  }

  @override
  String getTitle() {
    return 'Offstage';
  }


  @override
  Widget getWidget() {
    return Center(
      child: Offstage(
        offstage: setting.offstage.value,
        child: setting.child.value,
      ),
    );
  }
}

class OffstageSetting {
  final Value<bool> offstage;
  final Value<Widget> child;

  OffstageSetting({
    this.child,
    this.offstage,
  });

  OffstageSetting copyWith({
    Value<bool> offstage,
    Value<Widget> child,
  }) {
    return OffstageSetting(
      offstage: offstage??this.offstage,
      child: child??this.child,
    );
  }
}
