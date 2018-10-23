import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RichTextDemo extends StatefulWidget {
  static const String routeName = 'widgets/text/RichText';
  final String detail = '''一段富文本。

在富文本使用多个不同风格的小部件显示文本。要显示的文本使用TextSpan对象树来描述，每个对象都有一个用于该子树的关联样式。文本可能会跨越多行，也可能全部显示在同一行上，具体取决于布局约束。

必须显式设置RichText小部件中显示的文本。选择要使用的样式时，请考虑使用当前 BuildContext的DefaultTextStyle .来提供默认值。有关如何在RichText小部件中设置文本样式的更多详细信息，请参阅TextStyle的文档。

考虑使用Text小部件 自动与DefaultTextStyle集成。当所有文本使用相同的样式时，默认构造函数不那么详细。该Text.rich构造函数允许你的风格与默认的文本样式多跨度，同时还允许每个跨度指定的样式。''';

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
