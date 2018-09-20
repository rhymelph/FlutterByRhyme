import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class CupertinoActivityIndicatorDemo extends StatefulWidget {
  static const String routeName='widgets/cupertino/CupertinoActivityIndicator';
  final String detail=''''iOS风格的活动指示器。''';

  @override
  _CupertinoActivityIndicatorDemoState createState() => _CupertinoActivityIndicatorDemoState();
}

class _CupertinoActivityIndicatorDemoState extends ExampleState<CupertinoActivityIndicatorDemo> {
   CupertinoActivityIndicatorSetting setting;

  @override
  void initState() {
    setting = CupertinoActivityIndicatorSetting(
      animating: boolValues[1],
      radius: doubleXlargeValues[0],
    );
    super.initState();
  }
  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoActivityIndicator(
        animating: ${setting.animating?.label??''},
        radius: ${setting.radius?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(title: StringParams.kAnimating, value: setting.animating, onChanged: (value){
        setState(() {
          setting=setting.copyWith(animating: value);
        });
      }),
      DropDownValueTitleWidget(selectList: doubleXlargeValues, title: StringParams.kRadius, value: setting.radius,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(radius: value);

        });
      },)
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoActivityIndicator';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoActivityIndicator(
        animating: setting.animating?.value,
        radius: setting.radius?.value,
      ),
    );
  }
}

class CupertinoActivityIndicatorSetting{
  final Value<bool> animating ;
  final Value<double> radius ;
    CupertinoActivityIndicatorSetting({this.animating, this.radius, });

    CupertinoActivityIndicatorSetting copyWith({
       Value<bool> animating ,
       Value<double> radius ,
}){
    return CupertinoActivityIndicatorSetting(
      animating: animating??this.animating,
      radius: radius??this.radius,

    );
    }
}