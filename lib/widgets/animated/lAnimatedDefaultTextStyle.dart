import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedDefaultTextStyle';
  final String detail = '''DefaultTextStyle的动画版本，无论何时给定的样式发生更改，都会在给定的持续时间内自动转换默认文本样式（文本样式以应用于没有显式样式的后代Text小部件）。

该textAlign设置，softWrap，textOverflow和MAXLINES性能不够生动和改变时立即生效。''';

  @override
  _AnimatedDefaultTextStyleDemoState createState() =>
      _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState
    extends ExampleState<AnimatedDefaultTextStyleDemo> {
  AnimatedDefaultTextStyleSetting setting;

  @override
  void initState() {
    setting = AnimatedDefaultTextStyleSetting(
        curve: curveValues[0],
        duration: durationValues[0],
        textAlign: textAlignValues[0],
        softWrap: boolValues[1],
        overflow: textOverflowValues[0],
        child: Value(
          value: Column(
            children: <Widget>[
              Text('Flutter:Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.'),
              Text('Dart:Developers at Google and elsewhere use Dart to create high-quality, mission-critical apps for iOS, Android, and the web. With features aimed at client-side development, Dart is a great fit for both mobile and web apps.'),
              Text('Android'),
              Text('IOS'),
              Text('Fushcia'),
            ],
          ),
          label: '''Column(
          children: <Widget>[
            Text('Flutter'),
            Text('Dart'),
            Text('Android'),
            Text('IOS'),
            Text('Fushcia'),
          ],
        )''',
        ),
        style: Value(
            value: TextStyle(),
            label: 'TextStyle()'
        )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''DefaultTextStyle(
      curve: ${setting.curve?.label??''},
      duration: ${setting.duration?.label??''},
      style: ${setting.style?.label??''},
      softWrap: ${setting.softWrap?.label??''},
      overflow: ${setting.overflow?.label??''},
      textAlign: ${setting.textAlign?.label??''},
      maxLines: ${setting.maxLines?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  bool isExpanded=false;

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(
                style: value,);
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value){
        setState(() {
          setting=setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kCurve),
      RadioGroupWidget(setting.curve, curveValues, (value){
        setState(() {
          setting=setting.copyWith(curve: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextAlign),
      RadioGroupWidget(setting.textAlign,textAlignValues, (value){
        setState(() {
          setting=setting.copyWith(textAlign: value);
        });
      }),
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget(setting.overflow,textOverflowValues, (value){
        setState(() {
          setting=setting.copyWith(overflow: value);
        });
      }),
      DropDownValueTitleWidget(
        title: StringParams.kMaxLines,
        value: setting.maxLines,
        selectList: intMiniValues,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxLines: value);
          });
        },
      ),
      SwitchValueTitleWidget(title: StringParams.kSoftWrap, value: setting.softWrap, onChanged: (value){
        setState(() {
          setting=setting.copyWith(softWrap: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedDefaultTextStyle';
  }

  @override
  Widget getWidget() {
    return AnimatedDefaultTextStyle(
      style: setting.style?.value,
      softWrap: setting.softWrap?.value,
      overflow: setting.overflow?.value,
      textAlign: setting.textAlign?.value,
      maxLines: setting.maxLines?.value,
      child: setting.child?.value,
      curve: setting.curve?.value,
      duration: setting.duration?.value,
    );
  }
}

class AnimatedDefaultTextStyleSetting {
  final Value<Widget> child;
  final Value<TextStyle> style;
  final Value<TextAlign> textAlign;
  final Value<TextOverflow> overflow;
  final Value<int> maxLines;
  final Value<Curve> curve;
  final Value<Duration> duration;
  final Value<bool> softWrap;

  AnimatedDefaultTextStyleSetting({
    this.child,
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.curve,
    this.duration,
  });

  AnimatedDefaultTextStyleSetting copyWith({
    Value<Widget> child,
    Value<TextStyle> style,
    Value<TextAlign> textAlign,
    Value<TextOverflow> overflow,
    Value<int> maxLines,
    Value<Curve> curve,
    Value<bool> softWrap,
    Value<Duration> duration,
  }) {
    return AnimatedDefaultTextStyleSetting(
      softWrap: softWrap??this.softWrap,
      child: child ?? this.child,
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}
