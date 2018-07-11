import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/widgets/paramsWidget.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

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
    setting = new ContainerSetting();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Value<AlignmentGeometry> _firstAlignmentGeometry;

  Value<Color> _firstColor;

  Value<EdgeInsetsGeometry> _firstPadding;

  Value<Decoration> _firstDecoration;

  Value<Decoration> _firstForegroundDecoration;

  Value<EdgeInsetsGeometry> _firstMargin;

  Value<Matrix4> _firstTransform;

  void _showSyncSelectTip() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Only can select color or decoration !\n颜色，装饰只能选中一个!')));
  }

  String getExampleCode() {
    return """Container(
    alignment: ${_firstAlignmentGeometry?.label??''},
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
  Widget build(BuildContext context) {
    return ExampleScaffold(
      scaffoldKey: _scaffoldKey,
      exampleCode: getExampleCode(),
      title: 'Container',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child:
                // start
                Container(
                    alignment: setting.alignment,
                    padding: setting.padding,
                    color: setting.color,
                    decoration: setting.decoration,
                    foregroundDecoration: setting.foregroundDecoration,
                    margin: setting.margin,
                    transform: setting.transform,
                    child: Text('Container.child')),
          ),
          // end
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
                RadioGroupWidget<EdgeInsetsGeometry>(
                    _firstPadding, paddingValues, (value) {
                  setState(() {
                    _firstPadding = value;
                    setting = setting.copyWith(padding: value.value);
                  });
                }),
                ValueTitleWidget('Decoration(装饰)'),
                DecorationGroupWidget(_firstDecoration, decorationValues,
                    (value) {
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
                    _firstForegroundDecoration, foregroundDecorationValues,
                    (value) {
                  setState(() {
                    _firstForegroundDecoration = value;
                    setting =
                        setting.copyWith(foregroundDecoration: value.value);
                  });
                }),
                ValueTitleWidget('margin(外边距)'),
                RadioGroupWidget<EdgeInsetsGeometry>(_firstMargin, marginValues,
                    (value) {
                  setState(() {
                    _firstMargin = value;
                    setting = setting.copyWith(margin: value.value);
                  });
                }),
                ValueTitleWidget('transform(绘制之前转换)'),
                RadioGroupWidget<Matrix4>(_firstTransform, transformValues,
                    (value) {
                  setState(() {
                    _firstTransform = value;
                    setting = setting.copyWith(transform: value.value);
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
    name: 'topLeft',
    value: Alignment.topLeft,
    label: 'Alignment.topLeft',
  ),
  const Value(
    name: 'topCenter',
    value: Alignment.topCenter,
    label: 'Alignment.topCenter',
  ),
  const Value(
    name: 'topRight',
    value: Alignment.topRight,
    label: 'Alignment.topRight',
  ),
  const Value(
    name: 'centerLeft',
    value: Alignment.centerLeft,
    label: 'Alignment.centerLeft',
  ),
  const Value(
    name: 'center',
    value: Alignment.center,
    label: 'Alignment.center',
  ),
  const Value(
    name: 'centerRight',
    value: Alignment.centerRight,
    label: 'Alignment.centerRight',
  ),
  const Value(
    name: 'bottomLeft',
    value: Alignment.bottomLeft,
    label: 'Alignment.bottomLeft',
  ),
  const Value(
    name: 'bottomCenter',
    value: Alignment.bottomCenter,
    label: 'Alignment.bottomCenter',
  ),
  const Value(
    name: 'bottomRight',
    value: Alignment.bottomRight,
    label: 'Alignment.bottomRight',
  ),
];

const List<Value<EdgeInsetsGeometry>> paddingValues = [
  const Value(
      name: 'EdgeInsets.fromLTRB',
      value: const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0),
      label: 'const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0)'),
  const Value(
      name: 'EdgeInsets.symmetric',
      value: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      label: 'const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0)'),
  const Value(
      name: 'EdgeInsets.all',
      value: const EdgeInsets.all(20.0),
      label: 'const EdgeInsets.all(20.0)'),
  const Value(
      name: 'EdgeInsets.only',
      value: const EdgeInsets.only(top: 30.0),
      label: 'const EdgeInsets.only(top: 30.0)'),
];

const List<Value<Color>> colors = [
  const Value(
    name: 'white',
    value: Colors.white,
    label: 'Colors.white',
  ),
  const Value(
    name: 'red',
    value: Colors.red,
    label: 'Colors.red',
  ),
  const Value(
    name: 'orangeAccent',
    value: Colors.orangeAccent,
    label: 'Colors.orangeAccent',
  ),
  const Value(
    name: 'yellow',
    value: Colors.yellow,
    label: 'Colors.yellow',
  ),
  const Value(
    name: 'green',
    value: Colors.green,
    label: 'Colors.green',
  ),
  const Value(
    name: 'cyan',
    value: Colors.cyan,
    label: 'Colors.cyan',
  ),
  const Value(
    name: 'blue',
    value: Colors.blue,
    label: 'Colors.blue',
  ),
  const Value(
    name: 'purple',
    value: Colors.purple,
    label: 'Colors.purple',
  ),
  const Value(
    name: 'pink',
    value: Colors.pink,
    label: 'Colors.pink',
  ),
];

const List<Value<Decoration>> decorationValues = [
  const Value(
    name: 'BoxDecoration.color',
    value: BoxDecoration(color: Colors.green),
    label: 'BoxDecoration(color: Colors.green)',
  ),
  const Value(
    name: 'BoxDecoration.borderRadius',
    value: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    label:
        'BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.all(Radius.circular(32.0)))',
  ),
  const Value(
    name: 'BoxDecoration.BoxShadow',
    value: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.purple,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.red,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ]),
    label:
        'BoxDecoration(boxShadow: [BoxShadow(color: Colors.purple,offset: Offset(5.0, 10.0),blurRadius: 3.0,spreadRadius: 3.0), BoxShadow(color: Colors.red,offset: Offset(10.0, 5.0),blurRadius: 3.0,spreadRadius: 4.0),])',
  ),
];

const List<Value<Decoration>> foregroundDecorationValues = [
  const Value(
      name: 'BoxDecoration.color',
      value: BoxDecoration(color: Colors.blue),
      label: 'BoxDecoration(color: Colors.blue)'),
  const Value(
    name: 'BoxDecoration.borderRadius',
    value: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(64.0))),
    label:
        'BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.all(Radius.circular(64.0)))',
  ),
  const Value(
    name: 'BoxDecoration.BoxShadow',
    value: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.orangeAccent,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.yellow,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ]),
    label:
        'BoxDecoration(boxShadow: [BoxShadow(color: Colors.orangeAccent,offset: Offset(5.0, 10.0),blurRadius: 3.0,spreadRadius: 3.0), BoxShadow(color: Colors.yellow,offset: Offset(10.0, 5.0),blurRadius: 3.0,spreadRadius: 4.0),])',
  ),
];

const List<Value<EdgeInsetsGeometry>> marginValues = [
  const Value(
    name: 'EdgeInsets.fromLTRB',
    value: const EdgeInsets.fromLTRB(10.0, 2.0, 30.0, 40.0),
    label: 'const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)',
  ),
  const Value(
    name: 'EdgeInsets.symmetric',
    value: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    label: 'const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0)',
  ),
  const Value(
    name: 'EdgeInsets.all',
    value: const EdgeInsets.all(10.0),
    label: 'const EdgeInsets.all(10.0)',
  ),
  const Value(
    name: 'EdgeInsets.only',
    value: const EdgeInsets.only(top: 10.0),
    label: 'const EdgeInsets.only(top: 10.0)',
  )
];

List<Value<Matrix4>> transformValues = [
  Value(
    name: 'Matrix4.diagonal3Values',
    value: Matrix4.diagonal3Values(20.0, 40.0, 60.0),
    label: 'Matrix4.diagonal3Values(20.0, 40.0, 60.0)',
  ),
  Value(
    name: 'Matrix4.rotationX',
    value: Matrix4.rotationX(30.0),
    label: 'Matrix4.rotationX(30.0)',
  ),
  Value(
    name: 'Matrix4.skewX',
    value: Matrix4.skewX(40.0),
    label: 'Matrix4.skewX(40.0)',
  ),
  Value(
    name: 'Matrix4.translationValues',
    value: Matrix4.translationValues(20.0, 40.0, 60.0),
    label: 'Matrix4.translationValues(20.0, 40.0, 60.0)',
  ),
];
