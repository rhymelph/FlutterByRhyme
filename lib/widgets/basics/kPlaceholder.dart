import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class PlaceholderDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/PlaceHolder';
  final String detail =
      '''A widget that draws a box that represents where other widgets will one day be added.
This widget is useful during development to indicate that the interface is not yet complete.
By default, the placeholder is sized to fit its container. If the placeholder is in an unbounded space, it will size itself according to the given fallbackWidth and fallbackHeight.''';

  @override
  _PlaceholderDemoState createState() => _PlaceholderDemoState();
}

class _PlaceholderDemoState extends ExampleState<PlaceholderDemo> {
  PlaceholderSetting setting;

  @override
  void initState() {
    setting = PlaceholderSetting(
      color: colorValues[1],
      strokeWidth: doubleMiniValues[0],
      fallbackHeight: doubleHugeValues[0],
      fallbackWidth: doubleHugeValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    // TODO: implement getExampleCode
    return '''Placeholder(
        color: ${setting.color?.label ?? ''},
        strokeWidth: ${setting.strokeWidth?.label ?? ''},
        fallbackHeight: ${setting.fallbackHeight?.label ?? ''},
        fallbackWidth: ${setting.fallbackWidth?.label ?? ''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleMiniValues,
        title: StringParams.kStrokeWidth,
        value: setting.strokeWidth,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(strokeWidth: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleHugeValues,
        title: StringParams.kFallbackWidth,
        value: setting.fallbackWidth,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(fallbackWidth: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleHugeValues,
        title: StringParams.kFallbackHeight,
        value: setting.fallbackHeight,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(fallbackHeight: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Placeholder';
  }

  @override
  Widget getWidget() {
    return Placeholder(
      color: setting.color?.value,
      strokeWidth: setting.strokeWidth?.value,
      fallbackHeight: setting.fallbackHeight?.value,
      fallbackWidth: setting.fallbackWidth?.value,
    );
  }
}

class PlaceholderSetting {
  final Value<Color> color;
  final Value<double> strokeWidth;
  final Value<double> fallbackWidth;
  final Value<double> fallbackHeight;

  PlaceholderSetting({
    this.color,
    this.strokeWidth,
    this.fallbackWidth,
    this.fallbackHeight,
  });

  PlaceholderSetting copyWith({
    Value<Color> color,
    Value<double> strokeWidth,
    Value<double> fallbackWidth,
    Value<double> fallbackHeight,
  }) {
    return PlaceholderSetting(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      fallbackWidth: fallbackWidth ?? this.fallbackWidth,
      fallbackHeight: fallbackHeight ?? this.fallbackHeight,
    );
  }
}
