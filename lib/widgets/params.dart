import 'package:flutter/material.dart';

class Value<T> {
  final String name;
  final String label;
  final T value;

  const Value({this.name, this.value, this.label});

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    Value typeOther = other;
    return typeOther.label == label && typeOther.name == name;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(name, label);
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

List<Value<Decoration>> decorationValues = [
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
    label: '''BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(32.0)))''',
  ),
  const Value(
    name: 'BoxDecoration.boxShadow',
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
    label: '''BoxDecoration(boxShadow: [
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
    ])''',
  ),
  Value(
    name: 'BoxDecoration.border',
    value: BoxDecoration(
      border: Border.all(color: Colors.green, width: 2.0),
    ),
    label: '''BoxDecoration(
      border: Border.all(color: Colors.green,width: 2.0),
    )''',
  ),
  Value(
    name: 'BoxDecoration.gradient',
    value: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.lightGreen,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    label: '''BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.lightGreen,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    )''',
  ),
  Value(
    name: 'BoxDecoration.image',
    value: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('images/burgers.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    label: '''DecorationImage(
          image: ExactAssetImage('images/burgers.jpg'),
          fit: BoxFit.cover,
        )''',
  ),
];

List<Value<Decoration>> foregroundDecorationValues = [
  const Value(
      name: 'BoxDecoration.color',
      value: BoxDecoration(color: Colors.blue),
      label: 'BoxDecoration(color: Colors.blue)'),
  const Value(
    name: 'BoxDecoration.borderRadius',
    value: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(64.0))),
    label: '''BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(64.0)))''',
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
    label: '''BoxDecoration(boxShadow: [
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
    ])''',
  ),
  Value(
    name: 'BoxDecoration.border',
    value: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2.0),
    ),
    label: '''BoxDecoration(
      border: Border.all(color: Colors.blue,width: 2.0),
    ),''',
  ),
  Value(
    name: 'BoxDecoration.LinearGradient',
    value: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.red,
          Colors.purple,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    label: '''BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.red,
          Colors.purple,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    )''',
  ),
  Value(
    name: 'BoxDecoration.image',
    value: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('images/pazzer.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    label: '''DecorationImage(
          image: ExactAssetImage('images/pazzer.jpg'),
          fit: BoxFit.cover,
        )''',
  ),
];

const List<Value<EdgeInsetsGeometry>> marginValues = [
  const Value(
    name: 'EdgeInsets.fromLTRB',
    value: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
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
    value: Matrix4.diagonal3Values(5.0, 10.0, 20.0),
    label: 'Matrix4.diagonal3Values(5.0, 10.0, 20.0)',
  ),
  Value(
    name: 'Matrix4.rotationX',
    value: Matrix4.rotationX(20.0),
    label: 'Matrix4.rotationX(20.0)',
  ),
  Value(
    name: 'Matrix4.skewX',
    value: Matrix4.skewX(30.0),
    label: 'Matrix4.skewX(30.0)',
  ),
  Value(
    name: 'Matrix4.translationValues',
    value: Matrix4.translationValues(10.0, 20.0, 30.0),
    label: 'Matrix4.translationValues(10.0, 20.0, 30.0)',
  ),
];

const List<Value<MainAxisAlignment>> mainAxisAlignmentValues=[
    const Value(
      name: 'start',
      value: MainAxisAlignment.start,
      label: 'MainAxisAlignment.start',
    ),
    const Value(
      name: 'center',
      value: MainAxisAlignment.center,
      label: 'MainAxisAlignment.center',
    ),
    const Value(
      name: 'end',
      value: MainAxisAlignment.end,
      label: 'MainAxisAlignment.end',
    ),
    const Value(
      name: 'spaceEvenly',
      value: MainAxisAlignment.spaceEvenly,
      label: 'MainAxisAlignment.spaceEvenly',
    ),
    const Value(
      name: 'spaceBetween',
      value: MainAxisAlignment.spaceBetween,
      label: 'MainAxisAlignment.spaceBetween',
    ),
    const Value(
      name: 'spaceAround',
      value: MainAxisAlignment.spaceAround,
      label: 'MainAxisAlignment.spaceAround',
    ),
];

const List<Value<MainAxisSize>> mainAxisSizeValues=[
  Value(
    name: 'min',
    value: MainAxisSize.min,
    label: 'MainAxisSize.min',
  ),
  Value(
    name: 'max',
    value: MainAxisSize.max,
    label: 'MainAxisSize.max',
  ),
];

const List<Value<CrossAxisAlignment>> crossAxisAlignmentValues=[
  const Value(
    name: 'start',
    value: CrossAxisAlignment.start,
    label: 'CrossAxisAlignment.start',
  ),
  const Value(
    name: 'center',
    value: CrossAxisAlignment.center,
    label: 'CrossAxisAlignment.center',
  ),
  const Value(
    name: 'end',
    value: CrossAxisAlignment.end,
    label: 'CrossAxisAlignment.end',
  ),
  const Value(
    name: 'stretch',
    value: CrossAxisAlignment.stretch,
    label: 'CrossAxisAlignment.stretch',
  ),
  const Value(
    name: 'baseline',
    value: CrossAxisAlignment.baseline,
    label: 'CrossAxisAlignment.baseline',
  ),
];

const List<Value<TextDirection>> textDirectionValues=[
  Value(
    name: 'rtl(right-to-left从右往左)',
    value: TextDirection.rtl,
    label: 'TextDirection.rtl',
  ),
  Value(
    name: 'ltr(left-to-right从左往右)',
    value: TextDirection.ltr,
    label: 'TextDirection.ltr',
  ),
];

const List<Value<VerticalDirection>> verticalDirectionValues=[
  Value(
    name: 'up',
    value: VerticalDirection.up,
    label: 'VerticalDirection.up',
  ),
  Value(
    name: 'down',
    value: VerticalDirection.down,
    label: 'VerticalDirection.down',
  ),
];

const List<Value<TextBaseline>> TextBaselineValues=[
  Value(
    name: 'alphabetic(对齐字母字符底部)',
    value: TextBaseline.alphabetic,
    label: 'TextBaseline.alphabetic',
  ),
  Value(
    name: 'ideographic(对齐表意字符底部)',
    value: TextBaseline.ideographic,
    label: 'TextBaseline.ideographic',
  ),
];