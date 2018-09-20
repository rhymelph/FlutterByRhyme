import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ButtonBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/ButtonBar';
  final String detail = '''按钮的水平排列。

根据当前ButtonTheme中的填充水平放置按钮 。

由Dialog用于排列对话框底部的操作.''';

  @override
  _ButtonBarDemoState createState() => _ButtonBarDemoState();
}

class _ButtonBarDemoState extends ExampleState<ButtonBarDemo> {
  ButtonBarSetting setting;

  @override
  void initState() {
    setting = ButtonBarSetting(
      children: buttonValues[0],
      alignment: mainAxisAlignmentValues[0],
      mainAxisSize: mainAxisSizeValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''ButtonBar(
      alignment: ${setting.alignment?.label??''},
      mainAxisSize: ${setting.mainAxisSize?.label??''},
      children: ${setting.children?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kChildren),
      RadioGroupWidget(setting.children, buttonValues, (value){
        setState(() {
          setting=setting.copyWith(children: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, mainAxisAlignmentValues, (value){
        setState(() {
          setting=setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kMainAxisSize),
      RadioGroupWidget(setting.mainAxisSize, mainAxisSizeValues, (value){
        setState(() {
          setting=setting.copyWith(mainAxisSize: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ButtonBar';
  }
  @override
  Widget getWidget() {
    return ButtonBar(
      alignment: setting.alignment?.value,
      mainAxisSize: setting.mainAxisSize?.value,
      children: setting.children?.value,
    );
  }
}

class ButtonBarSetting {
  final Value<MainAxisAlignment> alignment;
  final Value<MainAxisSize> mainAxisSize;
  final Value<List<Widget>> children;

  ButtonBarSetting({
    this.alignment,
    this.mainAxisSize,
    this.children,
  });

  ButtonBarSetting copyWith({
    Value<MainAxisAlignment> alignment,
    Value<MainAxisSize> mainAxisSize,
    Value<List<Widget>> children,
  }) {
    return ButtonBarSetting(
      alignment: alignment ?? this.alignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      children: children ?? this.children,
    );
  }
}
