import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ContainerDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Container';
  final String detail='''一个便利的小部件，结合了常见的绘画，定位和大小调整小部件。

容器首先用填充物围绕孩子（由装饰中存在的任何边界膨胀），然后将其他约束应用于 填充范围（ 如果非空，则包含width和height作为约束）。然后容器被边缘描述的额外空的空间包围。

在绘画过程中，容器首先应用给定的变换，然后绘制装饰以填充填充范围，然后绘制孩子，最后绘制foregroundDecoration，同时填充填充范围。

没有孩子的容器试图尽可能大，除非传入的约束是无限制的，在这种情况下，它们尽可能地小。容纳孩子的容器。的 width，height和约束参数的构造覆盖。''';
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
//    String alignment=setting.alignment?.label==null?
//        '':'alignment: ${setting.alignment?.label},';
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
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget<EdgeInsetsGeometry>(setting.padding, paddingValues,
              (value) {
            setState(() {
              setting = setting.copyWith(padding: value);
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
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
        if (setting.decoration != null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(color: value);
          });
        }
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
//  final Value<BoxConstraints> constraints;
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
