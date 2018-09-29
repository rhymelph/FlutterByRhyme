import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class OpacityDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/Opacity';
  final String detail = '''使子项部分透明的小部件。

此类将其子绘制到中间缓冲区中，然后将子项重新混合到部分透明的场景中。

对于0.0和1.0以外的不透明度值，此类相对较贵，因为它需要将子画面绘制到中间缓冲区中。对于值0.0，孩子根本就没有画过。对于值1.0，将立即绘制子项而不使用中间缓冲区。''';

  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends ExampleState<OpacityDemo> {
  OpacitySetting setting;

  @override
  void initState() {
    setting = OpacitySetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      opacity: doubleOneValues[1],
      alwaysIncludeSemantics: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Opacity(
      opacity: ${setting.opacity.label??''},
      child: ${setting.child?.label??''},
      alwaysIncludeSemantics: ${setting.alwaysIncludeSemantics?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kOpacity),
      SeekBarGroupWidget(setting.opacity, (value){
        setState(() {
          setState(() {
            setting = setting.copyWith(opacity: value);
          });
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kAlwaysIncludeSemantics, value: setting.alwaysIncludeSemantics, onChanged: (value){
        setState(() {
          setting=setting.copyWith(alwaysIncludeSemantics: value);
        });
      })
    ];
  }

  @override
  String getTitle() {
    return 'Opacity';
  }

  @override
  Widget getWidget() {
    return Opacity(
      opacity: setting.opacity.value,
      child: setting.child?.value,
      alwaysIncludeSemantics: setting.alwaysIncludeSemantics?.value,
    );
  }
}

class OpacitySetting {
  final Value<Widget> child;
  final Value<double> opacity;
  final Value<bool> alwaysIncludeSemantics;

  OpacitySetting({
    this.child,
    this.opacity,
    this.alwaysIncludeSemantics,
  });

  OpacitySetting copyWith({
    Value<Widget> child,
    Value<double> opacity,
    Value<bool> alwaysIncludeSemantics,
  }) {
    return OpacitySetting(
      child: child ?? this.child,
      opacity: opacity ?? this.opacity,
      alwaysIncludeSemantics:
          alwaysIncludeSemantics ?? this.alwaysIncludeSemantics,
    );
  }
}
