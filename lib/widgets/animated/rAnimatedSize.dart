import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedSizeDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedSize';
  final String detail = '''动画窗口小部件，只要给定子项的大小发生更改，就会在给定的持续时间内自动转换其大小。''';

  @override
  _AnimatedSizeDemoState createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends ExampleState<AnimatedSizeDemo>
    with SingleTickerProviderStateMixin {
  AnimatedSizeSetting setting;
  @override
  void initState() {
    setting = AnimatedSizeSetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      curve: curveValues[0],
      duration: durationValues[0],
      vsync: Value(
        value: this,
        label: 'this',
      ),
      alignment: alignmentValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AnimatedSize(
      child: ${setting.child?.label??''},
      alignment: ${setting.alignment?.label??''},
      curve: ${setting.curve?.label??''},
      duration: ${setting.duration?.label??''},
      vsync: ${setting.vsync?.label??''},
    )''';
  }

  bool isChanged=true;
  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(title: '改变子Widget大小',onPressed: (){
        setState(() {
          if(isChanged){
            setting=setting.copyWith(child: Value(
              value: Image.asset('images/burgers.jpg',height: 100.0,width: 100.0,),
              label: "Image.asset('images/burgers.jpg')",
            ));
          }else{
            setting=setting.copyWith(child: Value(
              value: Image.asset('images/burgers.jpg'),
              label: "Image.asset('images/burgers.jpg')",
            ));
          }
          isChanged=!isChanged;
//          CurveChartTestPresenter
        });
      },),
      ValueTitleWidget(StringParams.kDuration),
      RadioGroupWidget(setting.duration, durationValues, (value) {
        setState(() {
          setting = setting.copyWith(duration: value);
        });
      }),
      ValueTitleWidget(StringParams.kCurve),
      RadioGroupWidget(setting.curve, curveValues, (value) {
        setState(() {
          setting = setting.copyWith(curve: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedSize';
  }

  @override
  Widget getWidget() {
    return AnimatedSize(
      child: setting.child?.value,
      alignment: setting.alignment?.value,
      curve: setting.curve?.value,
      duration: setting.duration?.value,
      vsync: setting.vsync?.value,
    );
  }
}

class AnimatedSizeSetting {
  final Value<Widget> child;
  final Value<AlignmentGeometry> alignment;
  final Value<Curve> curve;
  final Value<Duration> duration;
  final Value<TickerProvider> vsync;

  AnimatedSizeSetting({
    this.child,
    this.alignment,
    this.curve,
    this.duration,
    this.vsync,
  });

  AnimatedSizeSetting copyWith({
    Value<Widget> child,
    Value<AlignmentGeometry> alignment,
    Value<Curve> curve,
    Value<Duration> duration,
    Value<TickerProvider> vsync,
  }) {
    return AnimatedSizeSetting(
      child: child ?? this.child,
      alignment: alignment ?? this.alignment,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      vsync: vsync ?? this.vsync,
    );
  }
}
