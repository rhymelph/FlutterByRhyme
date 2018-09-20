import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AlignDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/Align';
  final String detail = '''一个小部件，用于将其子项与其自身对齐，并根据子级的大小自行调整大小。

例如，要对齐右下方的框，您将通过此框一个比子的自然大小更大的严格约束，并且对齐Alignment.bottomRight。

如果它的尺寸受到约束并且widthFactor和heightFactor为null，则此窗口小部件将尽可能大 。如果维度不受约束且相应的大小因子为null，则窗口小部件将匹配其在该维度中的子项大小。如果尺寸因子为非null，则此窗口小部件的相应尺寸将是子尺寸和尺寸因子的乘积。例如，如果widthFactor是2.0，那么此小部件的宽度将始终是其子宽度的两倍。''';

  @override
  _AlignDemoState createState() =>
      _AlignDemoState();
}

class _AlignDemoState
    extends ExampleState<AlignDemo> {
  AlignSetting setting;

  @override
  void initState() {
    setting = AlignSetting(
      alignment: alignmentValues[0],
      widthFactor: doubleMiniValues[0],
      heightFactor: doubleMiniValues[0],
      child:  _formatValue(),
    );
    super.initState();
  }

  Widget _formatWidget(){
    return Align(
      alignment: setting?.alignment?.value??alignmentValues[0].value,
      widthFactor: setting?.widthFactor?.value??null,
      heightFactor: setting?.heightFactor?.value??null,
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    );
  }

  String _formatLabel(){
    return '''Align(
      alignment: ${setting?.alignment?.label??''},
      widthFactor: ${setting?.widthFactor?.label??''},
      heightFactor: ${setting?.heightFactor?.label??''},
      child: SizedBox(
        width: 35.0,
        height: 35.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
      ),
    )''';
  }

  Value<Widget> _formatValue(){
    return Value(
      value: _formatWidget(),
      label: _formatLabel(),
    );
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return setting.child?.label;
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value){
        setting = setting.copyWith(alignment: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
      ValueTitleWidget(StringParams.kWidthFactor),
      SeekBarGroupWidget(setting.widthFactor, (value){
        setting=setting.copyWith(widthFactor: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      },max: 2.0,min: 0.0,),
      ValueTitleWidget(StringParams.kHeightFactor),
      SeekBarGroupWidget(setting.heightFactor, (value){
        setting=setting.copyWith(heightFactor: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      },max: 2.0,min: 0.0,),
    ];
  }

  @override
  String getTitle() {
    return 'Align';
  }

  @override
  Widget getWidget() {
    return setting?.child?.value;
  }
}

class AlignSetting {
  final Value<double> widthFactor;
  final Value<double> heightFactor;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;
  AlignSetting({
    this.heightFactor,
    this.widthFactor,
    this.alignment,
    this.child,
  });

  AlignSetting copyWith({
    Value<double> widthFactor,
    Value<double> heightFactor,
    Value<AlignmentGeometry> alignment,
    Value<Widget> child,
  }) {
    return AlignSetting(
      alignment: alignment??this.alignment,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      child: child??this.child,
    );
  }
}
