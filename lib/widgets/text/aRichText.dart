import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:io';

class RichTextDemo extends StatefulWidget {
  static const String routeName = 'widgets/text/RichText';
  final String detail = '''A paragraph of rich text.
The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints.
Text displayed in a RichText widget must be explicitly styled. When picking which style to use, consider using DefaultTextStyle.of the current BuildContext to provide defaults. For more details on how to style text in a RichText widget, see the documentation for TextStyle.
Consider using the Text widget to integrate with the DefaultTextStyle automatically. When all the text uses the same style, the default constructor is less verbose. The Text.rich constructor allows you to style multiple spans with the default text style while still allowing specified styles per span.''';

  @override
  _RichTextDemoState createState() => _RichTextDemoState();
}

class _RichTextDemoState extends ExampleState<RichTextDemo> {
  RichTextSetting setting;

  @override
  void initState() {
    setting = RichTextSetting(
      textAlign: textAlignValues[0],
      softWrap: boolValues[1],
      overflow: textOverflowValues[0],
      textScaleFactor: doubleMiniValues[1],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''RichText(
      text: ${setting.text?.label ?? ''},
      textAlign: ${setting.textAlign?.label ?? ''},
      textDirection: ${setting.textDirection?.label ?? ''},
      softWrap: ${setting.softWrap?.label ?? ''},
      overflow: ${setting.overflow?.label ?? ''},
      textScaleFactor: ${setting.textScaleFactor?.label ?? ''},
      maxLines: ${setting.maxLines?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTextAlign),
      RadioGroupWidget(setting.textAlign, textAlignValues, (value) {
        setState(() {
          setting = setting.copyWith(textAlign: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kOverflow),
      RadioGroupWidget(setting.overflow, textOverflowValues, (value) {
        setState(() {
          setting = setting.copyWith(overflow: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kSoftWrap,
          value: setting.softWrap,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(softWrap: value);
            });
          }),
      DropDownValueTitleWidget(
        title: StringParams.kTextScaleFactor,
        value: setting.textScaleFactor,
        selectList: doubleMiniValues,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(textScaleFactor: value);
          });
        },
      ),
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
    ];
  }

  @override
  String getTitle() {
    return 'RichText';
  }

  @override
  Widget getWidget() {
    setting = setting.copyWith(
      text: Value(
        value: TextSpan(
          children: <TextSpan>[
            TextSpan(
              style: Theme.of(context).textTheme.body1,
              text:
                  'Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. ',
            ),
            TextSpan(
                style: Theme.of(context).textTheme.body2,
                text: 'Flutter works with existing code, '),
            TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.blue),
                text:
                    'is used by developers and organizations around the world, '),
            TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(color: Colors.deepOrange),
              text: 'and is free and open source.',
            )
          ],
        ),
        label: '''TextSpan(
        children: <TextSpan>[
          TextSpan(
            style: Theme.of(context).textTheme.body1,
            text:
                'Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. ',
          ),
          TextSpan(
              style: Theme.of(context).textTheme.body2,
              text: 'Flutter works with existing code, '),
          TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(color: Colors.blue),
              text:
                  'is used by developers and organizations around the world, '),
          TextSpan(
            style: Theme.of(context)
                .textTheme
                .body2
                .copyWith(color: Colors.deepOrange),
            text: 'and is free and open source.',
          )
        ],
      )''',
      ),
    );
    return RichText(
      text: setting.text?.value,
      textAlign: setting.textAlign?.value,
      textDirection: setting.textDirection?.value,
      softWrap: setting.softWrap?.value,
      overflow: setting.overflow?.value,
      textScaleFactor: setting.textScaleFactor?.value,
      maxLines: setting.maxLines?.value,
    );
  }
}

class RichTextSetting {
  final Value<TextSpan> text;
  final Value<TextAlign> textAlign;
  final Value<TextDirection> textDirection;
  final Value<bool> softWrap;
  final Value<TextOverflow> overflow;
  final Value<double> textScaleFactor;
  final Value<int> maxLines;
  final Value<Locale> locale;

  RichTextSetting({
    this.text,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.locale,
  });

  RichTextSetting copyWith({
    Value<TextSpan> text,
    Value<TextAlign> textAlign,
    Value<TextDirection> textDirection,
    Value<bool> softWrap,
    Value<TextOverflow> overflow,
    Value<double> textScaleFactor,
    Value<int> maxLines,
    Value<Locale> locale,
  }) {
    return RichTextSetting(
      text: text ?? this.text,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      locale: locale ?? this.locale,
    );
  }
}
