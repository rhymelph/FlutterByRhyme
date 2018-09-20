import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CenterDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Center';
  final String detail = '''一个小孩，它将孩子置于其中心。

如果它的尺寸受到约束并且widthFactor和heightFactor为null，则此窗口小部件将尽可能大 。如果维度不受约束且相应的大小因子为null，则窗口小部件将匹配其在该维度中的子项大小。如果尺寸因子为非null，则此窗口小部件的相应尺寸将是子尺寸和尺寸因子的乘积。例如，如果widthFactor是2.0，那么此小部件的宽度将始终是其子宽度的两倍。''';

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
