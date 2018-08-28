import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CenterDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Center';
  final String detail = '''A widget that centers its child within itself.
This widget will be as big as possible if its dimensions are constrained and widthFactor and heightFactor are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.
See also:
Align, which lets you arbitrarily position a child within itself, rather than just centering it.
Row, a widget that displays its children in a horizontal array.
Column, a widget that displays its children in a vertical array.
Container, a convenience widget that combines common painting, positioning, and sizing widgets.
The catalog of layout widgets.''';

  @override
  _CenterDemoState createState() => _CenterDemoState();
}

class _CenterDemoState extends ExampleState<CenterDemo> {
  CenterSetting setting;

  @override
  void initState() {
    setting = CenterSetting(
      widthFactor: doubleMiniValues[0],
      heightFactor: doubleMiniValues[0],
      child:  _formatValue(),
    );
    super.initState();
  }


  Widget _formatWidget(){
    return Center(
      widthFactor: setting?.widthFactor?.value??null,
      heightFactor: setting?.heightFactor?.value??null,
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
        ),
        ),
      ),
    );
  }
  
  String _formatLabel(){
    return '''Center(
      widthFactor: ${setting?.widthFactor?.label??''},
      heightFactor: ${setting?.heightFactor?.label??''},
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey,
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
    return setting?.child?.label;
  }

  @override
  List<Widget> getSetting() {
    return [
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
    return 'Center';
  }


  @override
  Widget getWidget() {
    return setting.child?.value;
  }
}

class CenterSetting {
  final Value<double> widthFactor;
  final Value<double> heightFactor;
  final Value<Widget> child;

  CenterSetting({
    this.heightFactor,
    this.widthFactor,
    this.child,
  });

  CenterSetting copyWith({
    Value<double> widthFactor,
    Value<double> heightFactor,
     Value<Widget> child,

  }) {
    return CenterSetting(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      child: child??this.child,
    );
  }
}
