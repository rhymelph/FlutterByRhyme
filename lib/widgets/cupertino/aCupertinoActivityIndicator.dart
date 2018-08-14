import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class CupertinoActivityIndicatorDemo extends StatefulWidget {
  static const String routeName='widgets/cupertino/CupertinoActivityIndicator';
  final String detail=''''n iOS-styled navigation bar.
The navigation bar is a toolbar that minimally consists of a widget, normally a page title, in the middle of the toolbar.
It also supports a leading and trailing widget before and after the middle widget while keeping the middle widget centered.
The leading widget will automatically be a back chevron icon button (or a close button in case of a fullscreen dialog) to pop the current route if none is provided and automaticallyImplyLeading is true (true by default).
It should be placed at top of the screen and automatically accounts for the OS's status bar.
If the given backgroundColor's opacity is not 1.0 (which is the case by default), it will produce a blurring effect to the content behind it.
See also:
CupertinoPageScaffold, a page layout helper typically hosting the CupertinoNavigationBar.
CupertinoSliverNavigationBar for a navigation bar to be placed in a scrolling list and that supports iOS-11-style large titles.''';

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