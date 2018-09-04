import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class WrapDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Wrap';
  final String detail = '''A widget that displays its children in multiple horizontal or vertical runs.
A Wrap lays out each child and attempts to place the child adjacent to the previous child in the main axis, given by direction, leaving spacing space in between. If there is not enough space to fit the child, Wrap creates a new run adjacent to the existing children in the cross axis.
After all the children have been allocated to runs, the children within the runs are positioned according to the alignment in the main axis and according to the crossAxisAlignment in the cross axis.
The runs themselves are then positioned in the cross axis according to the runSpacing and runAlignment.''';

  @override
  _WrapDemoState createState() =>
      _WrapDemoState();
}

class _WrapDemoState
    extends ExampleState<WrapDemo> {
  WrapSetting setting;

  @override
  void initState() {
    setting = WrapSetting(
      direction: axisValues[0],
      alignment: wrapAlignmentValues[0],
      spacing: doubleXlargeValues[0],
      runAlignment: wrapAlignmentValues[0],
      runSpacing: doubleXlargeValues[0],
      crossAxisAlignment: wrapcrossAlignmentValues[0],
      textDirection: textDirectionValues[0],
      verticalDirection: verticalDirectionValues[0],
      children: Value(
        value: <Widget>[
          Chip(label: Text('Chip1'),avatar: Icon(Icons.textsms),),
          Chip(label: Text('Chip2'),avatar: Icon(Icons.textsms),),
          Chip(label: Text('Chip3'),avatar: Icon(Icons.textsms),),
          Chip(label: Text('Chip4'),avatar: Icon(Icons.textsms),),
        ],
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
    return '''Wrap(
      direction: ${setting.direction?.label??''},
      alignment: ${setting.alignment?.label??''},
      spacing: ${setting.spacing?.label??''},
      runAlignment: ${setting.runAlignment?.label??''},
      runSpacing: ${setting.runSpacing?.label??''},
      crossAxisAlignment: ${setting.crossAxisAlignment?.label??''},
      textDirection: ${setting.textDirection?.label??''},
      verticalDirection: ${setting.verticalDirection?.label??''},
      children: ${setting.children?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDirection),
      RadioGroupWidget(setting.direction, axisValues, (value){
        setState(() {
          setting=setting.copyWith(direction: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, wrapAlignmentValues, (value){
        setState(() {
          setting=setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kRunAlignment),
      RadioGroupWidget(setting.runAlignment, wrapAlignmentValues, (value){
        setState(() {
          setting=setting.copyWith(runAlignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kRunSpacing),
      DropDownValueTitleWidget(selectList: wrapAlignmentValues, title: StringParams.kRunSpacing, value: setting.runSpacing,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(runSpacing: value);
        });
      },),
    ];
  }

  @override
  String getTitle() {
    return 'Wrap';
  }


  @override
  Widget getWidget() {
    return Wrap(
      direction: setting.direction?.value,
      alignment: setting.alignment?.value,
      spacing: setting.spacing?.value,
      runAlignment: setting.runAlignment?.value,
      runSpacing: setting.runSpacing?.value,
      crossAxisAlignment: setting.crossAxisAlignment?.value,
      textDirection: setting.textDirection?.value,
      verticalDirection: setting.verticalDirection?.value,
      children: setting.children?.value,
    );
  }
}

class WrapSetting {
  final Value<Axis> direction;
  final Value<WrapAlignment> alignment;
  final Value<double> spacing;
  final Value<WrapAlignment> runAlignment;
  final Value<double> runSpacing;
  final Value<WrapCrossAlignment> crossAxisAlignment;
  final Value<TextDirection> textDirection;
  final Value<VerticalDirection> verticalDirection;
  final Value<List<Widget>> children;
  
  WrapSetting({
    this.direction ,
    this.alignment ,
    this.spacing ,
    this.runAlignment ,
    this.runSpacing ,
    this.crossAxisAlignment ,
    this.textDirection,
    this.verticalDirection ,
    this.children ,
  });

  WrapSetting copyWith({
   Value<Axis> direction,
   Value<WrapAlignment> alignment,
   Value<double> spacing,
   Value<WrapAlignment> runAlignment,
   Value<double> runSpacing,
   Value<WrapCrossAlignment> crossAxisAlignment,
   Value<TextDirection> textDirection,
   Value<VerticalDirection> verticalDirection,
   Value<List<Widget>> children,
  }) {
    return WrapSetting(
      direction: direction??this.direction,
      alignment: alignment??this.alignment,
      spacing: spacing??this.spacing,
      runAlignment: runAlignment??this.runAlignment,
      runSpacing: runSpacing??this.runSpacing,
      crossAxisAlignment: crossAxisAlignment??this.crossAxisAlignment,
      textDirection: textDirection??this.textDirection,
      verticalDirection: verticalDirection??this.verticalDirection,
      children: children??this.children,
    );
  }
}
