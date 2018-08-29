import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class TransformDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Transform';
  final String detail = '''A widget that applies a transformation before painting its child.''';

  @override
  _TransformDemoState createState() =>
      _TransformDemoState();
}

class _TransformDemoState
    extends ExampleState<TransformDemo> {
  TransformSetting setting;

  @override
  void initState() {
    setting = TransformSetting(transform: transformValues[0],
    child: Value(
      value: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
      label: '''SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        )''',
    ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Transform(
      transform: ${setting.transform?.label??''},
      origin: ${setting.origin?.label??''},
      alignment: ${setting.alignment?.label??''},
      transformHitTests: ${setting.transformHitTests?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value){
        setState(() {
          setting=setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kOrigin),
      RadioGroupWidget(setting.origin,originValues , (value){
        setState(() {
          setting=setting.copyWith(origin: value);
        });
      }),
      ValueTitleWidget(StringParams.kTransform),
      RadioGroupWidget(setting.transform, transformValues, (value){
        setState(() {
          setting=setting.copyWith(transform: value);
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
    return 'Transform';
  }


  @override
  Widget getWidget() {
    return Transform(
      transform: setting.transform?.value,
      origin: setting.origin?.value,
      alignment: setting.alignment?.value,
      transformHitTests: setting.transformHitTests?.value,
      child: setting.child?.value,
    );
  }
}

class TransformSetting {
  final Value<Matrix4> transform;
  final Value<Offset> origin;
  final Value<AlignmentGeometry> alignment;
  final Value<bool> transformHitTests;
  final Value<Widget> child;
  TransformSetting({
    @required this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests ,
    this. child,
  });

  TransformSetting copyWith({
    Value<Matrix4> transform,
    Value<Offset> origin,
    Value<AlignmentGeometry> alignment,
    Value<bool> transformHitTests,
    Value<Widget> child,
  }) {
    return TransformSetting(
      transform: transform??this.transform,
      origin: origin??this.origin,
      alignment: alignment??this.alignment,
      transformHitTests: transformHitTests??this.transformHitTests,
      child: child??this.child,
    );
  }
}
