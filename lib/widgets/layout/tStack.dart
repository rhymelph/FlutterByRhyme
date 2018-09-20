import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class StackDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Stack';
  final String detail = '''一个小部件，用于将其子级相对于其框的边缘定位。

如果要以简单的方式重叠多个子项，此类很有用，例如，具有一些文本和图像，用渐变覆盖并且按钮附加到底部。

Stack小部件的每个子节点都已定位或未定位。定位子项是包含在具有至少一个非null属性的定位窗口小部件中的子项。堆栈大小本身包含所有未定位的子项，这些子项根据对齐方式定位 （默认为从左到右环境中的左上角和从右到左环境中的右上角）。然后根据它们的顶部，右侧，底部和左侧属性相对于堆叠放置定位的子项。

当第一个孩子在底部时，堆栈按顺序绘制其子项。如果要更改子项绘制的顺序，可以使用新顺序中的子项重建堆栈。如果以这种方式对子项重新排序，请考虑为子项指定非空键。这些键将使框架将子项的基础对象移动到新位置，而不是在新位置重新创建它们。

有关堆栈布局算法的更多详细信息，请参阅RenderStack。

如果要以特定模式放置多个子项，或者如果要创建自定义布局管理器，则可能需要使用 CustomMultiChildLayout。特别是，当使用堆栈时，您无法根据大小或堆栈自身大小来定位子项。''';

  @override
  _StackDemoState createState() => _StackDemoState();
}

class _StackDemoState extends ExampleState<StackDemo> {
  StackSetting setting;

  @override
  void initState() {
    setting = StackSetting(
        alignment: alignmentValues[0],
        fit: stackFitValues[0],
        overflow: overflowValues[0],
        children: Value(
          value: <Widget>[
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Text('text文本'),
          ],
          label: '''<Widget>[
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Text('text文本'),
          ]''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Stack(
      alignment: ${setting.alignment?.label ?? ''},
      textDirection: ${setting.textDirection?.label ?? ''},
      fit: ${setting.fit?.label ?? ''},
      overflow: ${setting.overflow?.label ?? ''},
      children: ${setting.children?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kFit),
      RadioGroupWidget(setting.fit, stackFitValues, (value) {
        setState(() {
          setting = setting.copyWith(fit: value);
        });
      }),
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget(setting.overflow, overflowValues, (value) {
        setState(() {
          setting = setting.copyWith(overflow: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'Stack';
  }

  @override
  Widget getWidget() {
    return Stack(
      alignment: setting.alignment?.value,
      textDirection: setting.textDirection?.value,
      fit: setting.fit?.value,
      overflow: setting.overflow?.value,
      children: setting.children?.value,
    );
  }
}

class StackSetting {
  final Value<AlignmentGeometry> alignment;
  final Value<TextDirection> textDirection;
  final Value<StackFit> fit;
  final Value<Overflow> overflow;
  final Value<List<Widget>> children;

  StackSetting({
    this.alignment,
    this.textDirection,
    this.fit,
    this.overflow,
    this.children,
  });

  StackSetting copyWith({
    Value<AlignmentGeometry> alignment,
    Value<TextDirection> textDirection,
    Value<StackFit> fit,
    Value<Overflow> overflow,
    Value<List<Widget>> children,
  }) {
    return StackSetting(
      alignment: alignment ?? this.alignment,
      textDirection: textDirection ?? this.textDirection,
      fit: fit ?? this.fit,
      overflow: overflow ?? this.overflow,
      children: children ?? this.children,
    );
  }
}
