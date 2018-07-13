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

const List<Value<Color>> colorValues = [
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
  const Value(
    name: 'transparent',
    value: Colors.transparent,
    label: 'Colors.transparent',
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

const List<Value<MainAxisAlignment>> mainAxisAlignmentValues = [
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

const List<Value<MainAxisSize>> mainAxisSizeValues = [
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

const List<Value<CrossAxisAlignment>> crossAxisAlignmentValues = [
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

const List<Value<TextDirection>> textDirectionValues = [
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

const List<Value<VerticalDirection>> verticalDirectionValues = [
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

const List<Value<TextBaseline>> TextBaselineValues = [
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

const List<Value<ImageProvider>> imageValues = [
  Value(
    name: 'Assert.burgers',
    value: AssetImage('images/burgers.jpg'),
    label: "AssetImage('images/burgers.jpg')",
  ),
  Value(
    name: 'Assert.pazzer',
    value: AssetImage('images/pazzer.jpg'),
    label: "AssetImage('images/pazzer.jpg')",
  ),
  Value(
    name: 'Assert.chewCrispyChicken',
    value: AssetImage('images/chewCrispyChicken.9.jpg'),
    label: "AssetImage('images/chewCrispyChicken.9.jpg')",
  ),
  Value(
    name: 'Network.image',
    value: NetworkImage(
        'https://cdn.cnn.com/cnnnext/dam/assets/171027052520-processed-foods-exlarge-tease.jpg'),
    label:
        "NetworkImage('https://cdn.cnn.com/cnnnext/dam/assets/171027052520-processed-foods-exlarge-tease.jpg')",
  ),
];

const List<Value<ImageRepeat>> repeatValues = [
  Value(
    name: 'repeat',
    value: ImageRepeat.repeat,
    label: "ImageRepeat.repeat",
  ),
  Value(
    name: 'noRepeat',
    value: ImageRepeat.noRepeat,
    label: "ImageRepeat.noRepeat",
  ),
  Value(
    name: 'repeatX',
    value: ImageRepeat.repeatX,
    label: "ImageRepeat.repeatX",
  ),
  Value(
    name: 'repeatY',
    value: ImageRepeat.repeatY,
    label: "ImageRepeat.repeatY",
  ),
];

const List<Value<BlendMode>> colorBlendModeValues = [
  Value(
    name: 'clear',
    value: BlendMode.clear,
    label: "BlendMode.clear",
  ),
  Value(
    name: 'src',
    value: BlendMode.src,
    label: "BlendMode.src",
  ),
  Value(
    name: 'dst',
    value: BlendMode.dst,
    label: "BlendMode.dst",
  ),
  Value(
    name: 'srcOver',
    value: BlendMode.srcOver,
    label: "BlendMode.srcOver",
  ),
  Value(
    name: 'dstOver',
    value: BlendMode.dstOver,
    label: "BlendMode.dstOver",
  ),
  Value(
    name: 'srcIn',
    value: BlendMode.srcIn,
    label: "BlendMode.srcIn",
  ),
  Value(
    name: 'dstIn',
    value: BlendMode.dstIn,
    label: "BlendMode.dstIn",
  ),
  Value(
    name: 'srcOut',
    value: BlendMode.srcOut,
    label: "BlendMode.srcOut",
  ),
  Value(
    name: 'dstOut',
    value: BlendMode.dstOut,
    label: "BlendMode.dstOut",
  ),
  Value(
    name: 'srcATop',
    value: BlendMode.srcATop,
    label: "BlendMode.srcATop",
  ),
  Value(
    name: 'dstATop',
    value: BlendMode.dstATop,
    label: "BlendMode.dstATop",
  ),
  Value(
    name: 'xor',
    value: BlendMode.xor,
    label: "BlendMode.xor",
  ),
  Value(
    name: 'plus',
    value: BlendMode.plus,
    label: "BlendMode.plus",
  ),
  Value(
    name: 'modulate',
    value: BlendMode.modulate,
    label: "BlendMode.modulate",
  ),
  Value(
    name: 'screen',
    value: BlendMode.screen,
    label: "BlendMode.screen",
  ),
  Value(
    name: 'overlay',
    value: BlendMode.overlay,
    label: "BlendMode.overlay",
  ),
  Value(
    name: 'darken',
    value: BlendMode.darken,
    label: "BlendMode.darken",
  ),
  Value(
    name: 'lighten',
    value: BlendMode.lighten,
    label: "BlendMode.lighten",
  ),
  Value(
    name: 'colorDodge',
    value: BlendMode.colorDodge,
    label: "BlendMode.colorDodge",
  ),
  Value(
    name: 'colorBurn',
    value: BlendMode.colorBurn,
    label: "BlendMode.colorBurn",
  ),
  Value(
    name: 'hardLight',
    value: BlendMode.hardLight,
    label: "BlendMode.hardLight",
  ),
  Value(
    name: 'softLight',
    value: BlendMode.softLight,
    label: "BlendMode.softLight",
  ),
  Value(
    name: 'difference',
    value: BlendMode.difference,
    label: "BlendMode.difference",
  ),
  Value(
    name: 'exclusion',
    value: BlendMode.exclusion,
    label: "BlendMode.exclusion",
  ),
  Value(
    name: 'multiply',
    value: BlendMode.multiply,
    label: "BlendMode.multiply",
  ),
  Value(
    name: 'hue',
    value: BlendMode.hue,
    label: "BlendMode.hue",
  ),
  Value(
    name: 'saturation',
    value: BlendMode.saturation,
    label: "BlendMode.saturation",
  ),
  Value(
    name: 'color',
    value: BlendMode.color,
    label: "BlendMode.color",
  ),
  Value(
    name: 'luminosity',
    value: BlendMode.luminosity,
    label: "BlendMode.luminosity",
  ),
];

const List<Value<BoxFit>> fitValues = [
  Value(
    name: 'none',
    value: BoxFit.none,
    label: 'BoxFit.none',
  ),
  Value(
    name: 'cover',
    value: BoxFit.cover,
    label: 'BoxFit.cover',
  ),
  Value(
    name: 'contain',
    value: BoxFit.contain,
    label: 'BoxFit.contain',
  ),
  Value(
    name: 'scaleDown',
    value: BoxFit.scaleDown,
    label: 'BoxFit.scaleDown',
  ),
  Value(
    name: 'fill',
    value: BoxFit.fill,
    label: 'BoxFit.fill',
  ),
  Value(
    name: 'fitHeight',
    value: BoxFit.fitHeight,
    label: 'BoxFit.fitHeight',
  ),
  Value(
    name: 'fitWidth',
    value: BoxFit.fitWidth,
    label: 'BoxFit.fitWidth',
  ),
];

List<Value<Rect>> centerSlideValues = [
  Value(
    name: 'Rect.zero',
    value: Rect.zero,
    label: 'Rect.zero',
  ),
  Value(
    name: 'Rect.fromCircle',
    value: Rect.fromCircle(
      center: Offset(
        25.0,
        25.0,
      ),
      radius: 16.0,
    ),
    label: '''Rect.fromCircle(
      center: Offset(
        25.0,
        25.0,
      ),
      radius: 16.0,
    )''',
  ),
  Value(
    name: 'Rect.fromLTRB',
    value: Rect.fromLTRB(
      25.0,
      25.0,
      50.0,
      50.0,
    ),
    label: '''Rect.fromLTRB(
      25.0,
      25.0,
      50.0,
      50.0,
    )''',
  ),
  Value(
    name: 'Rect.fromLTWH',
    value: Rect.fromLTWH(
      25.0,
      25.0,
      50.0,
      50.0,
    ),
    label: '''Rect.fromLTWH(
      25.0,
      25.0,
      50.0,
      50.0,
    )''',
  ),
  Value(
    name: 'Rect.fromPoints',
    value: Rect.fromPoints(
        Offset(
          25.0,
          25.0,
        ),
        Offset(
          50.0,
          50.0,
        )),
    label: '''Rect.fromPoints(
        Offset(
          25.0,
          25.0,
        ),
        Offset(
          50.0,
          50.0,
        ))''',
  ),
  Value(
    name: 'Rect.largest',
    value: Rect.largest,
    label: 'Rect.largest',
  ),
];

const List<Value<TextAlign>> textAlignValues = [
  const Value(
    name: 'start',
    value: TextAlign.start,
    label: 'TextAlign.start',
  ),
  const Value(
    name: 'center',
    value: TextAlign.center,
    label: 'TextAlign.center',
  ),
  const Value(
    name: 'end',
    value: TextAlign.end,
    label: 'TextAlign.end',
  ),
  const Value(
    name: 'justify',
    value: TextAlign.justify,
    label: 'TextAlign.justify',
  ),
  const Value(
    name: 'left',
    value: TextAlign.left,
    label: 'TextAlign.left',
  ),
  const Value(
    name: 'right',
    value: TextAlign.right,
    label: 'TextAlign.right',
  ),
];

const List<Value<TextOverflow>> textOverflowValues = [
  const Value(
    name: 'fade',
    value: TextOverflow.fade,
    label: 'TextOverflow.fade',
  ),
  const Value(
    name: 'ellipsis',
    value: TextOverflow.ellipsis,
    label: 'TextOverflow.ellipsis',
  ),
  const Value(
    name: 'clip',
    value: TextOverflow.clip,
    label: 'TextOverflow.clip',
  ),
];

const List<Value<Overflow>> overflowValues = [
  const Value(
    name: 'clip',
    value: Overflow.clip,
    label: 'Overflow.clip',
  ),
  const Value(
    name: 'visible',
    value: Overflow.visible,
    label: 'Overflow.visible',
  ),
];

const List<Value<int>> intValues = [
  const Value(
    name: '1',
    value: 1,
    label: '1',
  ),
  const Value(
    name: '2',
    value: 2,
    label: '2',
  ),
  const Value(
    name: '3',
    value: 3,
    label: '3',
  ),
  const Value(
    name: '4',
    value: 4,
    label: '4',
  ),
];
const List<Value<double>> doubleValues = [
  const Value(
    name: '1.0',
    value: 1.0,
    label: '1.0',
  ),
  const Value(
    name: '2.0',
    value: 2.0,
    label: '2.0',
  ),
  const Value(
    name: '3.0',
    value: 3.0,
    label: '3.0',
  ),
  const Value(
    name: '4.0',
    value: 4.0,
    label: '4.0',
  ),
];

