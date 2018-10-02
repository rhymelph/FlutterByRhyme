import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:async';
class RefreshIndicatorDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/RefreshIndicator';
  final String detail = '''支持Material“刷卡以刷新”成语的小部件。

当孩子的Scrollable后代过度滚动时，动画循环进度指示器会淡入视图。当滚动结束时，如果指针被拖得足够远以使其变得完全不透明，则调用onRefresh回调。预期回调将更新可滚动内容，然后完成它返回的Future。回调的Future完成后，刷新指示消失。

如果Scrollable可能没有足够的内容来过度滚动，请考虑将其physics属性设置为AlwaysScrollableScrollPhysics

使用AlwaysScrollableScrollPhysics将确保滚动视图始终可滚动，因此可以触发RefreshIndicator。

甲RefreshIndicator只能与垂直滚动视图中使用。''';

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
        displacement: doubleXlargeValues[0],
        child: Value(
          value: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text('ListTile:$position'),
              );
            },
            itemCount: 30,
          ),
          label: r'''ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                title: Text('ListTile:$position'),
              );
            },
            itemCount: 30,
          )''',
        ),
      notificationPredicate: Value(
        value: defaultScrollNotificationPredicate,

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
    return '''RefreshIndicator(
      child: ${setting.child?.label??''},
      displacement: ${setting.displacement?.label??''},
      onRefresh: (){
        final Completer<Null> completer = new Completer<Null>();
        
        //延迟一秒加载数据
        new Timer(Duration(seconds: 1), () {
          // 加载数据
          //返回值,即将指示器消失
          completer.complete(null);
        });
        return completer.future;
      },
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
      DropDownValueTitleWidget(selectList: doubleXlargeValues, title: StringParams.kDisplacement, value: setting.displacement,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(displacement: value);
        });
      },)
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
      onRefresh: (){
        final Completer<Null> completer = new Completer<Null>();
        new Timer(Duration(seconds: 1), () {
          // 添加数据
          exampleKey.currentState.showToast('加载数据');
          //返回值,即将指示器消失
          completer.complete(null);
        });
        return completer.future;
      },
      color: setting.color?.value,
      backgroundColor:setting.backgroundColor?.value,
    );
  }
}

class RefreshIndicatorSetting {
  final Value<Widget> child;
  final Value<double> displacement;
  final Value<Color> color;
  final Value<Color> backgroundColor;
  final Value<ScrollNotificationPredicate> notificationPredicate;
  
  RefreshIndicatorSetting({
     this.child,
    this.displacement,
    this.color,
    this.backgroundColor,
    this.notificationPredicate ,
  });

  RefreshIndicatorSetting copyWith({
     Value<Widget> child,
     Value<double> displacement,
     Value<Color> color,
     Value<Color> backgroundColor,
     Value<ScrollNotificationPredicate> notificationPredicate,
  }) {
    return RefreshIndicatorSetting(
      child: child??this.child,
      displacement: displacement??this.displacement,
      color: color??this.color,
      backgroundColor:backgroundColor??this.backgroundColor,
      notificationPredicate:notificationPredicate??this.notificationPredicate,
    );
  }
}
