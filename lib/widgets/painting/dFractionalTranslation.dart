import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FractionalTranslationDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/FractionalTranslation';
  final String detail = '''在绘制其子项之前应用转换转换。

翻译表示为缩小到孩子大小的偏移量。例如，a 为0.25 的Offsetdx将导致子宽度的四分之一的水平平移。

命中测试只会在FractionalTranslation的范围内被检测到 ，即使内容被偏移使得它们溢出。''';

  @override
  _FractionalTranslationDemoState createState() =>
      _FractionalTranslationDemoState();
}

class _FractionalTranslationDemoState
    extends ExampleState<FractionalTranslationDemo> {
  FractionalTranslationSetting setting;

  @override
  void initState() {
    setting = FractionalTranslationSetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      translation: offsetValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''FractionalTranslation(
      translation: ${setting.translation?.label ?? ''},
      transformHitTests: ${setting.transformHitTests?.label ?? ''},
      child: ${setting.child?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTranslation),
      RadioGroupWidget(setting.translation, offsetValues, (value) {
        setState(() {
          setting = setting.copyWith(translation: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kTransformHitTests, value: setting.transformHitTests, onChanged: (value){
        setState(() {
          setting=setting.copyWith(transformHitTests: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'FractionalTranslation';
  }

  @override
  Widget getWidget() {
    return FractionalTranslation(
      translation: setting.translation?.value,
      transformHitTests: setting.transformHitTests?.value,
      child: setting.child?.value,
    );
  }
}

class FractionalTranslationSetting {
  final Value<Offset> translation;
  final Value<bool> transformHitTests;
  final Value<Widget> child;

  FractionalTranslationSetting({
    this.translation,
    this.transformHitTests,
    this.child,
  });

  FractionalTranslationSetting copyWith({
    Value<Offset> translation,
    Value<bool> transformHitTests,
    Value<Widget> child,
  }) {
    return FractionalTranslationSetting(
      transformHitTests: transformHitTests ?? this.transformHitTests,
      translation: translation ?? this.translation,
      child: child ?? this.child,
    );
  }
}
