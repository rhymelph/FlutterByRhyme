import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class GestureDetectorDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/GestureDetector';
  final String detail = '''检测手势的小部件。

尝试识别与其非空回调相对应的手势。

如果此窗口小部件具有子项，则它会根据其大小调整行为推迟该子项。如果它没有孩子，它会变得适合父母。

默认情况下，带有不可见子项的GestureDetector会忽略触摸; 这种行为可以被控制的行为。

GestureDetector还会侦听辅助功能事件并将它们映射到回调。要忽略辅助功能事件，请将excludeFromSemantics设置 为true。

材料设计应用通常会对具有墨水飞溅效果的触摸作出反应。该墨水池类实现这种效果，并且可以在一个地方来使用GestureDetector处理水龙头。''';

  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends ExampleState<GestureDetectorDemo> {
  GestureDetectorSetting setting;
  String status = '';

  @override
  void initState() {
    setting = GestureDetectorSetting(
      excludeFromSemantics: boolValues[0],
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      onTap: Value(
        value: () {
          //点击
          setState(() {
            status = 'onTap::点击';
          });
        },
        label: '''() {
        //点击
        });
      }''',
      ),
      onTapUp: Value(
        value: (d) {
          setState(() {
            status = 'onTapUp::抬起\nglobalPosition:${d.globalPosition}';
          });
        },
        label: '''(d) {
      //抬起
      //全局位置:d.globalPosition
      }''',
      ),
      onTapDown: Value(
        value: (d) {
          setState(() {
            status = 'onTapDown::按下\nglobalPosition:${d.globalPosition}';
          });
        },
        label: '''(d) {
      //按下
      //全局位置:d.globalPosition
      }''',
      ),
      onTapCancel: Value(
        value: () {
          setState(() {
            status = 'onTapCancel::点击取消';
          });
        },
        label: '''() {
      //点击取消
      }''',
      ),
      onDoubleTap: Value(
        value: () {
          setState(() {
            status = 'onDoubleTap::双击';
          });
        },
        label: '''() {
      //双击
      }''',
      ),
      onLongPress: Value(
        value: () {
          setState(() {
            status = 'onLongPress::长按';
          });
        },
        label: '''() {
      //长按
      }''',
      ),
      onVerticalDragStart: Value(
        value: (d) {
          setState(() {
            status =
                'onVerticalDragStart::垂直拖拽开始\nglobalPosition:${d.globalPosition}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //垂直拖拽开始
      //全局位置:d.globalPosition
      //时间戳:d.sourceTimeStamp
      }''',
      ),
      onVerticalDragDown: Value(
        value: (d) {
          setState(() {
            status =
                'onVerticalDragDown::垂直拖拽按下\nglobalPosition:${d.globalPosition}';
          });
        },
        label: '''(d) {
      //垂直拖拽按下
      //全局位置:d.globalPosition
      }''',
      ),
      onVerticalDragEnd: Value(
        value: (d) {
          setState(() {
            status =
                'onVerticalDragEnd::垂直拖拽结束\nvelocity.pixelsPerSecond:${d.velocity.pixelsPerSecond}\nprimaryVelocity:${d.primaryVelocity}';
          });
        },
        label: '''(d) {
      //垂直拖拽结束
      //像素秒:d.velocity.pixelsPerSecond
      //初速度:d.primaryVelocity
      }''',
      ),
      onVerticalDragCancel: Value(
        value: () {
          setState(() {
            status = 'onVerticalDragCancel::垂直拖拽取消';
          });
        },
        label: '''(d) {
      //垂直拖拽取消
      }''',
      ),
      onVerticalDragUpdate: Value(
        value: (d) {
          setState(() {
            status =
                'onVerticalDragUpdate::垂直拖拽更新\nglobalPosition:${d.globalPosition}\ndelta:${d.delta}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //垂直拖拽更新
      //全局位置:d.globalPosition
      //偏移量:d.delta
      //时间戳:d.sourceTimeStamp
      }''',
      ),
      onHorizontalDragStart: Value(
        value: (d) {
          setState(() {
            status =
                'onHorizontalDragStart::水平拖拽开始\nglobalPosition:${d.globalPosition}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //水平拖拽开始
      //全局位置:d.globalPosition
      //偏移量:d.delta
      }''',
      ),
      onHorizontalDragDown: Value(
        value: (d) {
          setState(() {
            status = 'onHorizontalDragDown::水平拖拽按下${d.globalPosition}';
          });
        },
        label: '''(d) {
      //水平拖拽按下
      //全局位置:d.globalPosition
      }''',
      ),
      onHorizontalDragEnd: Value(
        value: (d) {
          setState(() {
            status =
                'onHorizontalDragEnd::水平拖拽结束\nvelocity.pixelsPerSecond:${d.velocity.pixelsPerSecond}\nprimaryVelocity:${d.primaryVelocity}';
          });
        },
        label: '''(d) {
      //水平拖拽结束
      //像素秒:d.velocity.pixelsPerSecond
      //初速度:d.primaryVelocity
      }''',
      ),
      onHorizontalDragCancel: Value(
        value: () {
          setState(() {
            status = 'onHorizontalDragCancel::水平拖拽取消';
          });
        },
        label: '''(d) {
      //水平拖拽取消
      }''',
      ),
      onHorizontalDragUpdate: Value(
        value: (d) {
          setState(() {
            status =
                'onHorizontalDragUpdate::水平拖拽更新\nglobalPosition:${d.globalPosition}\ndelta:${d.delta}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //水平拖拽更新
      //全局位置:d.globalPosition
      //偏移量:d.delta
      //时间戳:d.sourceTimeStamp
      }''',
      ),
      onPanStart: Value(
        value: (d) {
          setState(() {
            status =
                'onPanStart::指针移动开始\nglobalPosition:${d.globalPosition}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //指针移动开始
      //全局位置:d.globalPosition
      //时间戳:d.sourceTimeStamp
      }''',
      ),
      onPanDown: Value(
        value: (d) {
          setState(() {
            status = 'onPanDown::指针移动按下${d.globalPosition}';
          });
        },
        label: '''(d) {
      //指针移动按下
      //全局位置:d.globalPosition
      }''',
      ),
      onPanEnd: Value(
        value: (d) {
          setState(() {
            status =
                'onPanEnd::指针移动结束\nvelocity.pixelsPerSecond:${d.velocity.pixelsPerSecond}\nprimaryVelocity:${d.primaryVelocity}';
          });
        },
        label: '''(d) {
      //指针移动结束
      //像素秒:d.velocity.pixelsPerSecond
      //初速度:d.primaryVelocity
      }''',
      ),
      onPanUpdate: Value(
        value: (d) {
          setState(() {
            status =
                'onPanUpdate::指针移动更新\nglobalPosition:${d.globalPosition}\ndelta:${d.delta}\nsourceTimeStamp:${d.sourceTimeStamp.toString()}';
          });
        },
        label: '''(d) {
      //指针移动更新
      //全局位置:d.globalPosition
      //偏移量:d.delta
      //初速度:d.primaryVelocity
      }''',
      ),
      onPanCancel: Value(
        value: () {
          setState(() {
            status = 'onPanCancel::指针移动取消';
          });
        },
        label: '''(d) {
      //指针移动取消
      }''',
      ),
      onScaleStart: Value(
        value: (d) {
          setState(() {
            status = 'onScaleStart::范围开始\nfocalPoint:${d.focalPoint}';
          });
        },
        label: '''(d) {
      //范围开始
      //焦点:d.focalPoint
      }''',
      ),
      onScaleUpdate: Value(
        value: (d) {
          setState(() {
            status =
                'onScaleStart::范围更新\nfocalPoint:${d.focalPoint}\nscale:${d.scale}';
          });
        },
        label: '''(d) {
      //范围更新
      //焦点:d.focalPoint
      //比例:d.scale
      }''',
      ),
      onScaleEnd: Value(
        value: (d) {
          setState(() {
            status =
                'onScaleStart::范围结束\nvelocity.pixelsPerSecond:${d.velocity.pixelsPerSecond}';
          });
        },
        label: '''(d) {
      //范围结束
      //像素秒:d.velocity.pixelsPerSecond
      }''',
      ),
      behavior: behaviorValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''//需要注意
//Vertical与Horizontal不能同时出现
//Pan与Scale不能同时出现
    GestureDetector(
      child: ${setting.child?.label ?? ''},
      onTapDown: ${setting.onTapDown?.label ?? ''},
      onTapUp: ${setting.onTapUp?.label ?? ''},
      onTap: ${setting.onTap?.label ?? ''},
      onTapCancel: ${setting.onTapCancel?.label ?? ''},
      onDoubleTap: ${setting.onDoubleTap?.label ?? ''},
      onLongPress: ${setting.onLongPress?.label ?? ''},
      onVerticalDragDown: ${setting.onVerticalDragDown?.label ?? ''},
      onVerticalDragStart: ${setting.onVerticalDragStart?.label ?? ''},
      onVerticalDragUpdate: ${setting.onVerticalDragUpdate?.label ?? ''},
      onVerticalDragEnd: ${setting.onVerticalDragEnd?.label ?? ''},
      onVerticalDragCancel: ${setting.onVerticalDragCancel?.label ?? ''},
      onHorizontalDragDown: ${setting.onHorizontalDragDown?.label ?? ''},
      onHorizontalDragStart: ${setting.onHorizontalDragStart?.label ?? ''},
      onHorizontalDragUpdate: ${setting.onHorizontalDragUpdate?.label ?? ''},
      onHorizontalDragEnd: ${setting.onHorizontalDragEnd?.label ?? ''},
      onHorizontalDragCancel: ${setting.onHorizontalDragCancel?.label ?? ''},
      onPanDown: ${setting.onPanDown?.label ?? ''},
      onPanStart: ${setting.onPanStart?.label ?? ''},
      onPanUpdate: ${setting.onPanUpdate?.label ?? ''},
      onPanEnd: ${setting.onPanEnd?.label ?? ''},
      onPanCancel: ${setting.onPanCancel?.label ?? ''},
      onScaleStart: ${setting.onScaleStart?.label ?? ''},
      onScaleUpdate: ${setting.onScaleUpdate?.label ?? ''},
      onScaleEnd: ${setting.onScaleEnd?.label ?? ''},
      behavior: ${setting.behavior?.label ?? ''},
      excludeFromSemantics: ${setting.excludeFromSemantics?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kStatus),
      Center(
        child: Text(status),
      ),
      SwitchTitleWidget(
          title: 'Horizontal/Vertical',
          value: veOrHo,
          onChanged: (value) {
            setState(() {
              veOrHo = value;
            });
          }),
      SwitchTitleWidget(
          title: 'Scale/Pan',
          value: paOrSc,
          onChanged: (value) {
            setState(() {
              paOrSc = value;
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kExcludeFromSemantics,
          value: setting.excludeFromSemantics,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(excludeFromSemantics: value);
            });
          }),
      ValueTitleWidget(StringParams.kBehavior),
      RadioGroupWidget(setting.behavior, behaviorValues, (value) {
        setState(() {
          setting = setting.copyWith(behavior: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'GestureDetector';
  }

  bool veOrHo = false;
  bool paOrSc = false;

  @override
  Widget getWidget() {
    GestureDetector gesture;

    if (veOrHo && paOrSc) {
      gesture = GestureDetector(
        child: setting.child?.value,
        onTapDown: setting.onTapDown?.value,
        onTapUp: setting.onTapUp?.value,
        onTap: setting.onTap?.value,
        onTapCancel: setting.onTapCancel?.value,
        onDoubleTap: setting.onDoubleTap?.value,
        onLongPress: setting.onLongPress?.value,
        onVerticalDragDown: setting.onVerticalDragDown?.value,
        onVerticalDragStart: setting.onVerticalDragStart?.value,
        onVerticalDragUpdate: setting.onVerticalDragUpdate?.value,
        onVerticalDragEnd: setting.onVerticalDragEnd?.value,
        onVerticalDragCancel: setting.onVerticalDragCancel?.value,
        onPanDown: setting.onPanDown?.value,
        onPanStart: setting.onPanStart?.value,
        onPanUpdate: setting.onPanUpdate?.value,
        onPanEnd: setting.onPanEnd?.value,
        onPanCancel: setting.onPanCancel?.value,
      );
    } else if (!veOrHo && paOrSc) {
      gesture = GestureDetector(
        child: setting.child?.value,
        onTapDown: setting.onTapDown?.value,
        onTapUp: setting.onTapUp?.value,
        onTap: setting.onTap?.value,
        onTapCancel: setting.onTapCancel?.value,
        onDoubleTap: setting.onDoubleTap?.value,
        onLongPress: setting.onLongPress?.value,
        onHorizontalDragDown: setting.onHorizontalDragDown?.value,
        onHorizontalDragStart: setting.onHorizontalDragStart?.value,
        onHorizontalDragUpdate: setting.onHorizontalDragUpdate?.value,
        onHorizontalDragEnd: setting.onHorizontalDragEnd?.value,
        onHorizontalDragCancel: setting.onHorizontalDragCancel?.value,
        onPanDown: setting.onPanDown?.value,
        onPanStart: setting.onPanStart?.value,
        onPanUpdate: setting.onPanUpdate?.value,
        onPanEnd: setting.onPanEnd?.value,
        onPanCancel: setting.onPanCancel?.value,
      );
    } else if (!veOrHo && !paOrSc) {
      gesture = GestureDetector(
        child: setting.child?.value,
        onTapDown: setting.onTapDown?.value,
        onTapUp: setting.onTapUp?.value,
        onTap: setting.onTap?.value,
        onTapCancel: setting.onTapCancel?.value,
        onDoubleTap: setting.onDoubleTap?.value,
        onLongPress: setting.onLongPress?.value,
        onHorizontalDragDown: setting.onHorizontalDragDown?.value,
        onHorizontalDragStart: setting.onHorizontalDragStart?.value,
        onHorizontalDragUpdate: setting.onHorizontalDragUpdate?.value,
        onHorizontalDragEnd: setting.onHorizontalDragEnd?.value,
        onHorizontalDragCancel: setting.onHorizontalDragCancel?.value,
        onScaleStart: setting.onScaleStart?.value,
        onScaleUpdate: setting.onScaleUpdate?.value,
        onScaleEnd: setting.onScaleEnd?.value,
      );
    } else if (veOrHo && !paOrSc) {
      gesture = GestureDetector(
        child: setting.child?.value,
        onTapDown: setting.onTapDown?.value,
        onTapUp: setting.onTapUp?.value,
        onTap: setting.onTap?.value,
        onTapCancel: setting.onTapCancel?.value,
        onDoubleTap: setting.onDoubleTap?.value,
        onLongPress: setting.onLongPress?.value,
        onVerticalDragDown: setting.onVerticalDragDown?.value,
        onVerticalDragStart: setting.onVerticalDragStart?.value,
        onVerticalDragUpdate: setting.onVerticalDragUpdate?.value,
        onVerticalDragEnd: setting.onVerticalDragEnd?.value,
        onVerticalDragCancel: setting.onVerticalDragCancel?.value,
        onScaleStart: setting.onScaleStart?.value,
        onScaleUpdate: setting.onScaleUpdate?.value,
        onScaleEnd: setting.onScaleEnd?.value,
      );
    }
    return gesture;
  }
}

class GestureDetectorSetting {
  final Value<Widget> child;
  final Value<GestureTapDownCallback> onTapDown;
  final Value<GestureTapUpCallback> onTapUp;
  final Value<GestureTapCallback> onTap;
  final Value<GestureTapCancelCallback> onTapCancel;
  final Value<GestureTapCallback> onDoubleTap;
  final Value<GestureLongPressCallback> onLongPress;
  final Value<GestureDragDownCallback> onVerticalDragDown;
  final Value<GestureDragStartCallback> onVerticalDragStart;
  final Value<GestureDragUpdateCallback> onVerticalDragUpdate;
  final Value<GestureDragEndCallback> onVerticalDragEnd;
  final Value<GestureDragCancelCallback> onVerticalDragCancel;
  final Value<GestureDragDownCallback> onHorizontalDragDown;
  final Value<GestureDragStartCallback> onHorizontalDragStart;
  final Value<GestureDragUpdateCallback> onHorizontalDragUpdate;
  final Value<GestureDragEndCallback> onHorizontalDragEnd;
  final Value<GestureDragCancelCallback> onHorizontalDragCancel;
  final Value<GestureDragDownCallback> onPanDown;
  final Value<GestureDragStartCallback> onPanStart;
  final Value<GestureDragUpdateCallback> onPanUpdate;
  final Value<GestureDragEndCallback> onPanEnd;
  final Value<GestureDragCancelCallback> onPanCancel;
  final Value<GestureScaleStartCallback> onScaleStart;
  final Value<GestureScaleUpdateCallback> onScaleUpdate;
  final Value<GestureScaleEndCallback> onScaleEnd;
  final Value<HitTestBehavior> behavior;
  final Value<bool> excludeFromSemantics;

  GestureDetectorSetting(
      {this.child,
      this.onTapDown,
      this.onTapUp,
      this.onTap,
      this.onTapCancel,
      this.onDoubleTap,
      this.onLongPress,
      this.onVerticalDragDown,
      this.onVerticalDragStart,
      this.onVerticalDragUpdate,
      this.onVerticalDragEnd,
      this.onVerticalDragCancel,
      this.onHorizontalDragDown,
      this.onHorizontalDragStart,
      this.onHorizontalDragUpdate,
      this.onHorizontalDragEnd,
      this.onHorizontalDragCancel,
      this.onPanDown,
      this.onPanStart,
      this.onPanUpdate,
      this.onPanEnd,
      this.onPanCancel,
      this.onScaleStart,
      this.onScaleUpdate,
      this.onScaleEnd,
      this.behavior,
      this.excludeFromSemantics});

  GestureDetectorSetting copyWith({
    Value<Widget> child,
    Value<GestureTapDownCallback> onTapDown,
    Value<GestureTapUpCallback> onTapUp,
    Value<GestureTapCallback> onTap,
    Value<GestureTapCancelCallback> onTapCancel,
    Value<GestureTapCallback> onDoubleTap,
    Value<GestureLongPressCallback> onLongPress,
    Value<GestureDragDownCallback> onVerticalDragDown,
    Value<GestureDragStartCallback> onVerticalDragStart,
    Value<GestureDragUpdateCallback> onVerticalDragUpdate,
    Value<GestureDragEndCallback> onVerticalDragEnd,
    Value<GestureDragCancelCallback> onVerticalDragCancel,
    Value<GestureDragDownCallback> onHorizontalDragDown,
    Value<GestureDragStartCallback> onHorizontalDragStart,
    Value<GestureDragUpdateCallback> onHorizontalDragUpdate,
    Value<GestureDragEndCallback> onHorizontalDragEnd,
    Value<GestureDragCancelCallback> onHorizontalDragCancel,
    Value<GestureDragDownCallback> onPanDown,
    Value<GestureDragStartCallback> onPanStart,
    Value<GestureDragUpdateCallback> onPanUpdate,
    Value<GestureDragEndCallback> onPanEnd,
    Value<GestureDragCancelCallback> onPanCancel,
    Value<GestureScaleStartCallback> onScaleStart,
    Value<GestureScaleUpdateCallback> onScaleUpdate,
    Value<GestureScaleEndCallback> onScaleEnd,
    Value<HitTestBehavior> behavior,
    Value<bool> excludeFromSemantics,
  }) {
    return GestureDetectorSetting(
      child: child ?? this.child,
      onTapDown: onTapDown ?? this.onTapDown,
      onTapUp: onTapUp ?? this.onTapUp,
      onTap: onTap ?? this.onTap,
      onTapCancel: onTapCancel ?? this.onTapCancel,
      onDoubleTap: onDoubleTap ?? this.onDoubleTap,
      onLongPress: onLongPress ?? this.onLongPress,
      onVerticalDragDown: onVerticalDragDown ?? this.onVerticalDragDown,
      onVerticalDragStart: onVerticalDragStart ?? this.onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate ?? this.onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd ?? this.onVerticalDragEnd,
      onVerticalDragCancel: onVerticalDragCancel ?? this.onVerticalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown ?? this.onHorizontalDragDown,
      onHorizontalDragStart:
          onHorizontalDragStart ?? this.onHorizontalDragStart,
      onHorizontalDragUpdate:
          onHorizontalDragUpdate ?? this.onHorizontalDragUpdate,
      onHorizontalDragEnd: onHorizontalDragEnd ?? this.onHorizontalDragEnd,
      onHorizontalDragCancel:
          onHorizontalDragCancel ?? this.onHorizontalDragCancel,
      onPanDown: onPanDown ?? this.onPanDown,
      onPanStart: onPanStart ?? this.onPanStart,
      onPanUpdate: onPanUpdate ?? this.onPanUpdate,
      onPanEnd: onPanEnd ?? this.onPanEnd,
      onPanCancel: onPanCancel ?? this.onPanCancel,
      onScaleStart: onScaleStart ?? this.onScaleStart,
      onScaleUpdate: onScaleUpdate ?? this.onScaleUpdate,
      onScaleEnd: onScaleEnd ?? this.onScaleEnd,
      behavior: behavior ?? this.behavior,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
    );
  }
}
