import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DismissibleDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/Dismissible';
  final String detail = '''可以通过在指示的方向上拖动来解除的小部件。

在DismissDirection中拖动或投掷此窗口小部件会导致子窗体滑出视图。以下滑动动画，如果resizeDuration为非空，则可取消插件在动画其高度（或宽度，取垂直于驳回方向）为零resizeDuration。

背景可用于实现“留守”的习语。如果指定了背景，则它会堆叠在Dismissible's child的后面，并在孩子移动时暴露。

小部件在其大小折叠为零（如果resizeDuration为非null）之后或在幻灯片动画之后立即（如果resizeDuration为null）调用onDismissed回调。如果Dismissible是一个列表项，它必须有一个键区别于其他项，并且它的onDismissed回调必须从列表中删除该项。''';

  @override
  _DismissibleDemoState createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends ExampleState<DismissibleDemo> {
  DismissibleSetting setting;

  @override
  void initState() {
    setting = DismissibleSetting(
      child: Value(
        value: ListTile(
          leading: CircleAvatar(
            child: Text('R'),
          ),
          title: Text('Rhyme'),
          subtitle: Text('A Flutter Senior Development Engineer'),
        ),
        label: '''ListTile(
          leading: CircleAvatar(
            child: Text('R'),
          ),
          title: Text('Rhyme'),
          subtitle: Text('A Flutter Senior Development Engineer'),
        )''',
      ),
      background: Value(
        value: DecoratedBox(decoration: BoxDecoration(color: Colors.grey[600])),
          label: 'DecoratedBox(decoration: BoxDecoration(color: Colors.grey[600]))'
      ),
      secondaryBackground: Value(
        value:  DecoratedBox(decoration: BoxDecoration(color: Colors.red)),
        label: 'DecoratedBox(decoration: BoxDecoration(color: Colors.red))'
      ),
      onResize: Value(
        value: (){
          //调整大小，拖动完成后不断调用
          //调用完成后会调用onDismissed
        },
        label: '''(){
          //调整大小，拖动完成后不断调用
          //调用完成后会调用onDismissed
        }''',
      ),
      onDismissed: Value(
        value: (DismissDirection direction){
          //取消的方向
          //2 右向左
          //3 左向右
          //4 下向上
          //5 上向下
          isExist=false;
        },
        label: '''(DismissDirection direction){
          //取消的方向
          //2 右向左
          //3 左向右
          //4 下向上
          //5 上向下
        }''',
      ),
      resizeDuration: durationValues[0],
      dismissThresholds: Value(
        value: {}
      ),
      direction: directionValues[0],
      movementDuration: durationValues[0],
      crossAxisEndOffset: doubleMiniValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Dismissible(
        key: key,
        child: ${setting.child?.label??''},
        background: ${setting.background?.label??''},
        secondaryBackground: ${setting.secondaryBackground?.label??''},
        onResize: ${setting.onResize?.label??''},
        onDismissed: ${setting.onDismissed?.label??''},
        direction: ${setting.direction?.label??''},
        resizeDuration: ${setting.resizeDuration?.label??''},
        dismissThresholds: ${setting.dismissThresholds?.label??''},
        movementDuration: ${setting.movementDuration?.label??''},
        crossAxisEndOffset: ${setting.crossAxisEndOffset?.label??''},
      )''';
  }

  bool isExist=true;

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(selectList: doubleMiniValues, title: StringParams.kCrossAxisEndOffset, value: setting.crossAxisEndOffset,
      onChanged: (value){
        if(!isExist){ exampleKey.currentState.showToast('部件已消失');return;}
        setState(() {
          setting=setting.copyWith(crossAxisEndOffset: value);
        });
      },),
      ValueTitleWidget(StringParams.kDirection),
      RadioGroupWidget(setting.direction, directionValues, (value){
        if(!isExist){ exampleKey.currentState.showToast('部件已消失');return;}
        setState(() {
          setting=setting.copyWith(direction: value);
        });
      }),
      ValueTitleWidget(StringParams.kResizeDuration),
      RadioGroupWidget(setting.resizeDuration, durationValues, (value){
        if(!isExist){ exampleKey.currentState.showToast('部件已消失');return;}
        setState(() {
          setting=setting.copyWith(resizeDuration: value);
        });
      }),
      ValueTitleWidget(StringParams.kMovementDuration),
      RadioGroupWidget(setting.movementDuration, durationValues, (value){
        if(!isExist){ exampleKey.currentState.showToast('部件已消失');return;}
        setState(() {
          setting=setting.copyWith(movementDuration: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'Dismissible';
  }

  GlobalObjectKey key=new GlobalObjectKey('hello');

  @override
  Widget getWidget() {
    return Center(
      child: isExist?Dismissible(
        key: key,
        child: setting.child?.value,
        background: setting.background?.value,
        secondaryBackground: setting.secondaryBackground?.value,
        onResize: setting.onResize?.value,
        onDismissed: setting.onDismissed?.value,
        direction: setting.direction?.value,
        resizeDuration: setting.resizeDuration?.value,
        dismissThresholds: setting.dismissThresholds?.value,
        movementDuration: setting.movementDuration?.value,
        crossAxisEndOffset: setting.crossAxisEndOffset?.value,
      ):Text(''),
    );
  }
}

class DismissibleSetting {
  final Value<Widget> child;
  final Value<Widget> background;
  final Value<Widget> secondaryBackground;
  final Value<VoidCallback> onResize;
  final Value<DismissDirectionCallback> onDismissed;
  final Value<DismissDirection> direction;
  final Value<Duration> resizeDuration;
  final Value<Map<DismissDirection, double>> dismissThresholds;
  final Value<Duration> movementDuration;
  final Value<double> crossAxisEndOffset;

  DismissibleSetting({
    @required this.child,
    this.background,
    this.secondaryBackground,
    this.onResize,
    this.onDismissed,
    this.direction,
    this.resizeDuration,
    this.dismissThresholds,
    this.movementDuration,
    this.crossAxisEndOffset,
  });

  DismissibleSetting copyWith({
    Value<Widget> child,
    Value<Widget> background,
    Value<Widget> secondaryBackground,
    Value<VoidCallback> onResize,
    Value<DismissDirectionCallback> onDismissed,
    Value<DismissDirection> direction,
    Value<Duration> resizeDuration,
    Value<Map<DismissDirection, double>> dismissThresholds,
    Value<Duration> movementDuration,
    Value<double> crossAxisEndOffset,
  }) {
    return DismissibleSetting(
      child: child??this.child,
      background: background??this.background,
      secondaryBackground: secondaryBackground??this.secondaryBackground,
      onResize: onResize??this.onResize,
      onDismissed: onDismissed??this.onDismissed,
      direction: direction??this.direction,
      resizeDuration: resizeDuration??this.resizeDuration,
      dismissThresholds: dismissThresholds??this.dismissThresholds,
      movementDuration: movementDuration??this.movementDuration,
      crossAxisEndOffset: crossAxisEndOffset??this.crossAxisEndOffset,
    );
  }
}
