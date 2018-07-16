import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ContainerDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Container';
  final String detail='''A convenience widget that combines common painting, positioning, and sizing widgets.
A container first surrounds the child with padding (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the width and height as constraints, if either is non-null). The container is then surrounded by additional empty space described from the margin.
During painting, the container first applies the given transform, then paints the decoration to fill the padded extent, then it paints the child, and finally paints the foregroundDecoration, also filling the padded extent.
Containers with no children try to be as big as possible unless the incoming constraints are unbounded, in which case they try to be as small as possible. Containers with children size themselves to their children. The width, height, and constraints arguments to the constructor override this.''';
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends ExampleState<ContainerDemo> {
  ContainerSetting setting;

  void _showSyncSelectTip() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Only can select color or decoration !\n颜色，装饰只能选中一个!')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setting = new ContainerSetting();
  }

  @override
  String getExampleCode() {
    return """Container(
    alignment: ${setting.alignment?.label ?? ''},
    padding: ${setting.padding?.label ?? ''},
    color: ${setting.color?.label ?? ''},
    decoration: ${setting.decoration?.label ?? ''},
    foregroundDecoration: ${setting.foregroundDecoration?.label ?? ''},
    margin: ${setting.margin?.label ?? ''},
    transform: ${setting.transform?.label ?? ''},
    child: Text('Container.child')),
    )""";
  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return 'Container';
  }

  @override
  Widget getWidget() {
    // TODO: implement getWidget
    return Container(
        alignment: setting.alignment?.value,
        padding: setting.padding?.value,
        color: setting.color?.value,
        decoration: setting.decoration?.value,
        foregroundDecoration: setting.foregroundDecoration?.value,
        margin: setting.margin?.value,
        transform: setting.transform?.value,
        child: Text('Container.child'));
  }

  @override
  List<Widget> getSetting() {
    // TODO: implement getSetting
    return <Widget>[
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget<AlignmentGeometry>(
          setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, colorValues, (value) {
        if (setting.decoration != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(color: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget<EdgeInsetsGeometry>(setting.padding, paddingValues,
          (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget(StringParams.kDecoration),
      DecorationGroupWidget(setting.decoration, decorationValues, (value) {
        if (setting.color != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(decoration: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kForegroundDecoration),
      DecorationGroupWidget(
          setting.foregroundDecoration, foregroundDecorationValues, (value) {
        setState(() {
          setting = setting.copyWith(foregroundDecoration: value);
        });
      }),
      ValueTitleWidget(StringParams.kMargin),
      RadioGroupWidget<EdgeInsetsGeometry>(setting.margin, marginValues, (value) {
        setState(() {
          setting = setting.copyWith(margin: value);
        });
      }),
      ValueTitleWidget(StringParams.kTransform),
      RadioGroupWidget<Matrix4>(setting.transform, transformValues, (value) {
        setState(() {
          setting = setting.copyWith(transform: value);
        });
      }),
    ];
  }
  @override
  String getDetail() {
    return widget.detail;
  }
}

class ContainerSetting {

  final Value<AlignmentGeometry> alignment;
  final Value<Color> color;
  final Value<EdgeInsetsGeometry> padding;
  final Value<Decoration> decoration;
  final Value<Decoration> foregroundDecoration;
  final Value<EdgeInsetsGeometry> margin;
  final Value<Matrix4> transform;
  ContainerSetting(
      {this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.margin,
      this.transform});

  ContainerSetting copyWith(
      {Value<AlignmentGeometry> alignment,
      Value<Color> color,
      Value<EdgeInsetsGeometry> padding,
      Value<Decoration> decoration,
      Value<Decoration> foregroundDecoration,
      Value<EdgeInsetsGeometry> margin,
      Value<Matrix4> transform}) {
    return new ContainerSetting(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration ?? this.decoration,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
    );
  }
}
