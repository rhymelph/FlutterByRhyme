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

  GlobalKey<ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();
  Value<AlignmentGeometry> _firstAlignmentGeometry ;
  Value<Color> _firstColor ;
  Value<EdgeInsetsGeometry> _firstPadding ;
  Value<Decoration> _firstDecoration ;
  Value<Decoration> _firstForegroundDecoration ;
  Value<EdgeInsetsGeometry> _firstMargin;

  void _showSyncSelectTip(){
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Only can select color or decoration !\n颜色，装饰只能选中一个!')));
  }
  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      key: _scaffoldKey,
      title: 'Container',
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
            child: Text('Container.child')),
          ),
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
                  if(setting.decoration!=null){
                    _showSyncSelectTip();
                  }else{
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
                RadioGroupWidget<Decoration>(_firstDecoration, decorationValues,
                    (value) {
                  if(setting.color!=null){
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('color , decoration and foregroundDecoration only one can select!\n颜色，装饰和前景装饰只能选中一个!')));
                  }else{
                    setState(() {
                      _firstDecoration = value;
                      setting = setting.copyWith(decoration: value.value);
                    });
                  }
                }),
                ValueTitleWidget('foregroundDecoration(前景装饰)'),
                RadioGroupWidget<Decoration>(_firstForegroundDecoration, foregroundDecorationValues,
                        (value) {
                      setState(() {
                        _firstForegroundDecoration = value;
                        setting = setting.copyWith(foregroundDecoration: value.value);
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
    'Alignment.topLeft',
  ),
  const Value(
    'topCenter',
    Alignment.topCenter,
    'Alignment.topCenter',
  ),
  const Value(
    'topRight',
    Alignment.topRight,
    'Alignment.topRight',
  ),
  const Value(
    'centerLeft',
    Alignment.centerLeft,
    'Alignment.centerLeft',
  ),
  const Value(
    'center',
    Alignment.center,
    'Alignment.center',
  ),
  const Value(
    'centerRight',
    Alignment.centerRight,
    'Alignment.centerRight',
  ),
  const Value(
    'bottomLeft',
    Alignment.bottomLeft,
    'Alignment.bottomLeft',
  ),
  const Value(
    'bottomCenter',
    Alignment.bottomCenter,
    'Alignment.bottomCenter',
  ),
  const Value(
    'bottomRight',
    Alignment.bottomRight,
    'Alignment.bottomRight',
  ),
];

const List<Value<EdgeInsetsGeometry>> paddingValues = [
  const Value(
      'EdgeInsets.fromLTRB',
      const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0),
      'const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0)'),
  const Value(
      'EdgeInsets.symmetric',
      const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      'const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0)'),
  const Value('EdgeInsets.all', const EdgeInsets.all(20.0),
      'const EdgeInsets.all(20.0)'),
  const Value('EdgeInsets.only', const EdgeInsets.only(top: 30.0),
      'const EdgeInsets.only(top: 30.0)'),
];

const List<Value<Color>> colors = [
  const Value(
    'white',
    Colors.white,
    'Colors.white',
  ),
  const Value(
    'red',
    Colors.red,
    'Colors.red',
  ),
  const Value(
    'orangeAccent',
    Colors.orangeAccent,
    'Colors.orangeAccent',
  ),
  const Value(
    'yellow',
    Colors.yellow,
    'Colors.yellow',
  ),
  const Value(
    'green',
    Colors.green,
    'Colors.green',
  ),
  const Value(
    'cyan',
    Colors.cyan,
    'Colors.cyan',
  ),
  const Value(
    'blue',
    Colors.blue,
    'Colors.blue',
  ),
  const Value(
    'purple',
    Colors.purple,
    'Colors.purple',
  ),
  const Value(
    'pink',
    Colors.pink,
    'Colors.pink',
  ),
];

const List<Value<Decoration>> decorationValues = [
  const Value('BoxDecoration.color', BoxDecoration(color: Colors.green),
      'BoxDecoration(color: Colors.green)'),
  const Value(
      'BoxDecoration.borderRadius',
      BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      'BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.all(Radius.circular(32.0)))'),
  const Value(
      'BoxDecoration.BoxShadow',
      BoxDecoration(boxShadow: [
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
      'BoxDecoration(boxShadow: [BoxShadow(color: Colors.purple,offset: Offset(5.0, 10.0),blurRadius: 3.0,spreadRadius: 3.0), BoxShadow(color: Colors.red,offset: Offset(10.0, 5.0),blurRadius: 3.0,spreadRadius: 4.0),])'),
];

const List<Value<Decoration>> foregroundDecorationValues = [
  const Value('BoxDecoration.color', BoxDecoration(color: Colors.blue),
      'BoxDecoration(color: Colors.blue)'),
  const Value(
      'BoxDecoration.borderRadius',
      BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.all(Radius.circular(64.0))),
      'BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.all(Radius.circular(64.0)))'),
  const Value(
      'BoxDecoration.BoxShadow',
      BoxDecoration(boxShadow: [
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
      'BoxDecoration(boxShadow: [BoxShadow(color: Colors.orangeAccent,offset: Offset(5.0, 10.0),blurRadius: 3.0,spreadRadius: 3.0), BoxShadow(color: Colors.yellow,offset: Offset(10.0, 5.0),blurRadius: 3.0,spreadRadius: 4.0),])'),
];

const List<Value<EdgeInsetsGeometry>> marginValues = [
  const Value(
      'EdgeInsets.fromLTRB',
      const EdgeInsets.fromLTRB(10.0, 2.0, 30.0, 40.0),
      'const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)'),
  const Value(
      'EdgeInsets.symmetric',
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      'const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0)'),
  const Value('EdgeInsets.all', const EdgeInsets.all(10.0),
      'const EdgeInsets.all(10.0)'),
  const Value('EdgeInsets.only', const EdgeInsets.only(top: 10.0),
      'const EdgeInsets.only(top: 10.0)'),
];