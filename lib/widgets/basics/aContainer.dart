
import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/widgets/paramsWidget.dart';
class ContainerDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Container';

  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  ContainerSetting setting;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setting = new ContainerSetting(
      alignment: Alignment.center,
    );
  }

  Value<AlignmentGeometry> _firstAlignmentGeometry = alignmentValues[0];
  Value<Color> _firstColor = colors[0];
  Value<EdgeInsetsGeometry> _firstPadding=paddingValues[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: setting.alignment,
            padding: setting.padding,
            color: setting.color,
            decoration: setting.decoration,
            foregroundDecoration: setting.foregroundDecoration,
            margin: setting.margin,
            transform: setting.transform,
            child: Text('Container'),
          )),
          Divider(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ValueTitleWidget('Alignment(对齐)'),
                RadioGroupWidget<AlignmentGeometry>(
                    _firstAlignmentGeometry, alignmentValues, (value) {
                  setState(() {
                    _firstAlignmentGeometry = value;
                    setting=setting.copyWith(alignment: value.value);
                  });
                }),
                ValueTitleWidget('Color(颜色)'),
                ColorGroupWidget(
                    _firstColor, colors, (value) {
                  setState(() {
                    _firstColor = value;
                    setting=setting.copyWith(color: value.value);
                  });
                }),
                ValueTitleWidget('Padding(内边距)'),
                RadioGroupWidget<EdgeInsetsGeometry>(
                    _firstPadding, paddingValues, (value) {
                  setState(() {
                    _firstPadding = value;
                    setting=setting.copyWith(padding: value.value);
                  });
                }),
              ],
            ),
          )),
        ],
      ),
    );
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

const List<Value<AlignmentGeometry>> alignmentValues = [
  const Value(
    'topLeft',
    Alignment.topLeft,
    'align to top and left',
  ),
  const Value(
    'topCenter',
    Alignment.topCenter,
    'align to top and center',
  ),
  const Value(
    'topRight',
    Alignment.topRight,
    'align to top and right',
  ),
  const Value(
    'centerLeft',
    Alignment.centerLeft,
    'align to centre and left',
  ),
  const Value(
    'center',
    Alignment.center,
    'align to center',
  ),
  const Value(
    'centerRight',
    Alignment.centerRight,
    'align to center and right',
  ),
  const Value(
    'bottomLeft',
    Alignment.bottomLeft,
    'align to bottom and left',
  ),
  const Value(
    'bottomCenter',
    Alignment.bottomCenter,
    'align to bottom and center',
  ),
  const Value(
    'bottomRight',
    Alignment.bottomRight,
    'align to bottom and right',
  ),
];
const List<Value<Color>> colors = [
  const Value(
    'white',
    Colors.white,
    'Color is white',
  ),
  const Value(
    'red',
    Colors.red,
    'Color is red',
  ),
  const Value(
    'orangeAccent',
    Colors.orangeAccent,
    'Color is orangeAccent',
  ),
  const Value(
    'yellow',
    Colors.yellow,
    'Color is yellow',
  ),
  const Value(
    'green',
    Colors.green,
    'Color is green',
  ),
  const Value(
    'cyan',
    Colors.cyan,
    'Color is cyan',
  ),
  const Value(
    'blue',
    Colors.blue,
    'Color is blue',
  ),
  const Value(
    'purple',
    Colors.purple,
    'Color is purple',
  ),
  const Value(
    'pink',
    Colors.pink,
    'Color is pink',
  ),
];

const List<Value<EdgeInsetsGeometry>> paddingValues=[
  const Value('EdgeInsets.fromLTRB', const EdgeInsets.fromLTRB(10.0, 8.0, 4.0, 8.0), 'from left top right bottom'),
  const Value('EdgeInsets.symmetric', const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0), 'symmetric vertical and horizontal'),
  const Value('EdgeInsets.all', const EdgeInsets.all(8.0), 'all padding'),
  const Value('EdgeInsets.only', const EdgeInsets.only(top: 8.0), 'only'),
];

