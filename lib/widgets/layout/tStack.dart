import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class StackDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Stack';
  final String detail = '''A widget that positions its children relative to the edges of its box.
This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.
Each child of a Stack widget is either positioned or non-positioned. Positioned children are those wrapped in a Positioned widget that has at least one non-null property. The stack sizes itself to contain all the non-positioned children, which are positioned according to alignment (which defaults to the top-left corner in left-to-right environments and the top-right corner in right-to-left environments). The positioned children are then placed relative to the stack according to their top, right, bottom, and left properties.
The stack paints its children in order with the first child being at the bottom. If you want to change the order in which the children paint, you can rebuild the stack with the children in the new order. If you reorder the children in this way, consider giving the children non-null keys. These keys will cause the framework to move the underlying objects for the children to their new locations rather than recreate them at their new location.
For more details about the stack layout algorithm, see RenderStack.
If you want to lay a number of children out in a particular pattern, or if you want to make a custom layout manager, you probably want to use CustomMultiChildLayout instead. In particular, when using a Stack you can't position children relative to their size or the stack's own size.
See also:
Align, which sizes itself based on its child's size and positions the child according to an Alignment value.
CustomSingleChildLayout, which uses a delegate to control the layout of a single child.
CustomMultiChildLayout, which uses a delegate to position multiple children.
Flow, which provides paint-time control of its children using transform matrices.
The catalog of layout widgets.''';

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
