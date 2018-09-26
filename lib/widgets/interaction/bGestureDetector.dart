import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class GestureDetectorDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/GestureDetector';
  final String detail = '';

  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends ExampleState<GestureDetectorDemo> {
  GestureDetectorSetting setting;

  @override
  void initState() {
    setting = GestureDetectorSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'GestureDetector';
  }

  @override
  Widget getWidget() {
    return GestureDetector();
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
    return GestureDetectorSetting();
  }
}
