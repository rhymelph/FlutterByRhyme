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

  Value<AlignmentGeometry> _firstAlignmentGeometry;

  Value<Color> _firstColor;

  Value<EdgeInsetsGeometry> _firstPadding;

  Value<Decoration> _firstDecoration;

  Value<Decoration> _firstForegroundDecoration;

  Value<EdgeInsetsGeometry> _firstMargin;

  Value<Matrix4> _firstTransform;

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
    alignment: ${_firstAlignmentGeometry?.label ?? ''},
    padding: ${_firstPadding?.label ?? ''},
    color: ${_firstColor?.label ?? ''},
    decoration: ${_firstDecoration?.label ?? ''},
    foregroundDecoration: ${_firstForegroundDecoration?.label ?? ''},
    margin: ${_firstMargin?.label ?? ''},
    transform: ${_firstTransform?.label ?? ''},
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
        alignment: setting.alignment,
        padding: setting.padding,
        color: setting.color,
        decoration: setting.decoration,
        foregroundDecoration: setting.foregroundDecoration,
        margin: setting.margin,
        transform: setting.transform,
        child: Text('Container.child'));
  }

  @override
  List<Widget> getSetting() {
    // TODO: implement getSetting
    return <Widget>[
      ValueTitleWidget('Alignment(对齐)'),
      RadioGroupWidget<AlignmentGeometry>(
          _firstAlignmentGeometry, alignmentValues, (value) {
        setState(() {
          _firstAlignmentGeometry = value;
          setting = setting.copyWith(alignment: value.value);
        });
      }),
      ValueTitleWidget('Color(颜色)'),
      ColorGroupWidget(_firstColor, colors, (value) {
        if (setting.decoration != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            _firstColor = value;
            setting = setting.copyWith(color: value.value);
          });
        }
      }),
      ValueTitleWidget('Padding(内边距)'),
      RadioGroupWidget<EdgeInsetsGeometry>(_firstPadding, paddingValues,
          (value) {
        setState(() {
          _firstPadding = value;
          setting = setting.copyWith(padding: value.value);
        });
      }),
      ValueTitleWidget('Decoration(装饰)'),
      DecorationGroupWidget(_firstDecoration, decorationValues, (value) {
        if (setting.color != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            _firstDecoration = value;
            setting = setting.copyWith(decoration: value.value);
          });
        }
      }),
      ValueTitleWidget('foregroundDecoration(前景装饰)'),
      DecorationGroupWidget(
          _firstForegroundDecoration, foregroundDecorationValues, (value) {
        setState(() {
          _firstForegroundDecoration = value;
          setting = setting.copyWith(foregroundDecoration: value.value);
        });
      }),
      ValueTitleWidget('margin(外边距)'),
      RadioGroupWidget<EdgeInsetsGeometry>(_firstMargin, marginValues, (value) {
        setState(() {
          _firstMargin = value;
          setting = setting.copyWith(margin: value.value);
        });
      }),
      ValueTitleWidget('transform(绘制之前转换)'),
      RadioGroupWidget<Matrix4>(_firstTransform, transformValues, (value) {
        setState(() {
          _firstTransform = value;
          setting = setting.copyWith(transform: value.value);
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
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Decoration decoration;
  final Decoration foregroundDecoration;
  final EdgeInsetsGeometry margin;
  final Matrix4 transform;

  ContainerSetting(
      {this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.margin,
      this.transform});

  ContainerSetting copyWith(
      {AlignmentGeometry alignment,
      EdgeInsetsGeometry padding,
      Color color,
      Decoration decoration,
      Decoration foregroundDecoration,
      EdgeInsetsGeometry margin,
      Matrix4 transform}) {
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
