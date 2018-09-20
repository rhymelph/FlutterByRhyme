import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DefaultTextStyleDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/DefaultTextStyle';
  final String detail = '''要应用于后代Text小部件而没有显式样式的文本样式。''';

  @override
  _DefaultTextStyleDemoState createState() => _DefaultTextStyleDemoState();
}

class _DefaultTextStyleDemoState extends ExampleState<DefaultTextStyleDemo> {
  DefaultTextStyleSetting setting;

  @override
  void initState() {
    setting = DefaultTextStyleSetting(
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
      style: ${setting.style?.label??''},
      softWrap: ${setting.softWrap?.label??''},
      overflow: ${setting.overflow?.label??''},
      textAlign: ${setting.textAlign?.label??''},
      maxLines: ${setting.maxLines?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }
  bool isExpanded = false;

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
    return 'DefaultTextStyle';
  }

    @override
    Widget getWidget() {
      return Center(
        child: DefaultTextStyle(
        style: setting.style?.value,
        softWrap: setting.softWrap?.value,
        overflow: setting.overflow?.value,
        textAlign: setting.textAlign?.value,
        maxLines: setting.maxLines?.value,
        child: setting.child?.value,
    ),
      );
  }
}

class DefaultTextStyleSetting {
  final Value<TextStyle> style;
  final Value<TextAlign> textAlign;
  final Value<bool> softWrap;
  final Value<TextOverflow> overflow;
  final Value<int> maxLines;
  final Value<Widget> child;

  DefaultTextStyleSetting({
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.child,
  });

  DefaultTextStyleSetting copyWith({
    Value<TextStyle> style,
    Value<TextAlign> textAlign,
    Value<bool> softWrap,
    Value<TextOverflow> overflow,
    Value<int> maxLines,
    Value<Widget> child,
  }) {
    return DefaultTextStyleSetting(
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      child: child ?? this.child,
    );
  }
}
