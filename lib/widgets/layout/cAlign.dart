import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AlignDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/Align';
  final String detail = '''A widget that aligns its child within itself and optionally sizes itself based on the child's size.
For example, to align a box at the bottom right, you would pass this box a tight constraint that is bigger than the child's natural size, with an alignment of Alignment.bottomRight.
This widget will be as big as possible if its dimensions are constrained and widthFactor and heightFactor are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.
See also:
CustomSingleChildLayout, which uses a delegate to control the layout of a single child.
Center, which is the same as Align but with the alignment always set to Alignment.center.
FractionallySizedBox, which sizes its child based on a fraction of its own size and positions the child according to an Alignment value.
The catalog of layout widgets.''';

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
