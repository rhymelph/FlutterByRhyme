import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CardDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Card';
  final String detail = '''材料设计卡。卡片有圆角和阴影。

卡片是用于表示一些相关信息的一张材料，例如相册，地理位置，用餐，联系方式等。''';

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends ExampleState<CardDemo> {
  CardSetting setting;

  @override
  void initState() {
    setting = CardSetting(
      semanticContainer: boolValues[0],
      margin: marginValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Card(
        color: ${setting.color?.label??''},
        elevation: ${setting.elevation?.label??''},
        shape: ${setting.shape?.label??''},
        margin: ${setting.margin?.label??''},
        semanticContainer: ${setting.semanticContainer?.label??''},
        child: Text('This bg is card'),
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kShape),
      RadioGroupWidget(setting.shape, shapeValues, (value) {
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget(StringParams.kMargin),
      RadioGroupWidget(setting.margin, marginValues, (value) {
        setState(() {
          setting = setting.copyWith(margin: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kSemanticContainer,
          value: setting.semanticContainer,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(semanticContainer: value);
            });
          }),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kElevation,
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Card';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Card(
        color: setting.color?.value,
        elevation: setting.elevation?.value,
        shape: setting.shape?.value,
        margin: setting.margin?.value,
//        semanticContainer: setting.semanticContainer?.value,
        child: Text('This bg is card'),
      ),
    );
  }
}

class CardSetting {
  final Value<Color> color;
  final Value<double> elevation;
  final Value<ShapeBorder> shape;
  final Value<EdgeInsetsGeometry> margin;
  final Value<bool> semanticContainer;

  CardSetting({
    this.color,
    this.elevation,
    this.shape,
    this.margin,
    this.semanticContainer,
  });

  CardSetting copyWith({
    final Value<Color> color,
    final Value<double> elevation,
    final Value<ShapeBorder> shape,
    final Value<EdgeInsetsGeometry> margin,
    final Value<bool> semanticContainer,
  }) {
    return CardSetting(
      color: color ?? this.color,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      margin: margin ?? this.margin,
      semanticContainer: semanticContainer ?? this.semanticContainer,
    );
  }
}
