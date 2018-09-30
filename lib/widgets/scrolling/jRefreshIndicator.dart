import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class RefreshIndicatorDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/RefreshIndicator';
  final String detail = '''''';

  @override
  _RefreshIndicatorDemoState createState() =>
      _RefreshIndicatorDemoState();
}

class _RefreshIndicatorDemoState
    extends ExampleState<RefreshIndicatorDemo> {
  RefreshIndicatorSetting setting;

  @override
  void initState() {
    setting = RefreshIndicatorSetting(
      color: colorValues[1],
      backgroundColor: colorValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''RefreshIndicator(
      child: ${setting.child?.label??''},
      displacement: ${setting.displacement?.label??''},
      onRefresh: ${setting.onRefresh?.label??''},
      color: ${setting.color?.label??''},
      backgroundColor:${setting.backgroundColor?.label??''},
      notificationPredicate:${setting.notificationPredicate?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
          setState(() {
            setting = setting.copyWith(color: value);
          });
      }),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor,  (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'RefreshIndicator';
  }


  @override
  Widget getWidget() {
    return RefreshIndicator(
      child: setting.child?.value,
      displacement: setting.displacement?.value,
      onRefresh: setting.onRefresh?.value,
      color: setting.color?.value,
      backgroundColor:setting.backgroundColor?.value,
      notificationPredicate:setting.notificationPredicate?.value,
    );
  }
}

class RefreshIndicatorSetting {
  final Value<Widget> child;
  final Value<double> displacement;
  // ignore: ambiguous_import
  final Value<RefreshCallback> onRefresh;
  final Value<Color> color;
  final Value<Color> backgroundColor;
  final Value<ScrollNotificationPredicate> notificationPredicate;
  
  RefreshIndicatorSetting({
     this.child,
    this.displacement,
     this.onRefresh,
    this.color,
    this.backgroundColor,
    this.notificationPredicate ,
  });

  RefreshIndicatorSetting copyWith({
     Value<Widget> child,
     Value<double> displacement,
     // ignore: ambiguous_import
     Value<RefreshCallback> onRefresh,
     Value<Color> color,
     Value<Color> backgroundColor,
     Value<ScrollNotificationPredicate> notificationPredicate,
  }) {
    return RefreshIndicatorSetting(
      child: child??this.child,
      displacement: displacement??this.displacement,
      onRefresh: onRefresh??this.onRefresh,
      color: color??this.color,
      backgroundColor:backgroundColor??this.backgroundColor,
      notificationPredicate:notificationPredicate??this.notificationPredicate,
    );
  }
}
