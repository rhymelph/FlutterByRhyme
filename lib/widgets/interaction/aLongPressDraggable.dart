import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LongPressDraggableDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/LongPressDraggable';
  final String detail = '从长按开始使其孩子可以拖拽。';

  @override
  _LongPressDraggableDemoState createState() => _LongPressDraggableDemoState();
}

class _LongPressDraggableDemoState
    extends ExampleState<LongPressDraggableDemo> {
  LongPressDraggableSetting setting;

  @override
  void initState() {
    setting = LongPressDraggableSetting(
      child: Value(
        value: SizedBox(
          width: 45.0,
          height: 45.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        label: '''SizedBox(
          width: 45.0,
          height: 45.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        )''',
      ),
      feedback: Value(
          value: SizedBox(
            width: 45.0,
            height: 45.0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          label: '''SizedBox(
          width: 45.0,
          height: 45.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        )'''),
      childWhenDragging: Value(
        value: SizedBox(
          width: 45.0,
          height: 45.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
        label: '''SizedBox(
        width: 45.0,
        height: 45.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
      )''',
      ),
      feedbackOffset: Value(
        value: Offset.zero,
        label: 'Offset.zero',
      ),
      ignoringFeedbackSemantics: boolValues[0],
      dragAnchor: dragAnchorValues[0],
      hapticFeedbackOnStart: boolValues[0],
      onDragStarted: Value(value: () {
        print('onDragStarted');
      },label: '''() {
        //拖拽开始
      }''',),
      onDraggableCanceled: Value(value: (Velocity velocity, Offset offset) {
        print(
            'onDraggableCanceled: \nvelocity:${velocity.pixelsPerSecond}\noffset:$offset');
      },label: '''(Velocity velocity, Offset offset) {
        //velocity.pixelsPerSecond 实际屏幕的位置
        //offset 与拖拽前的相对位置
      }''',),
      onDragCompleted: Value(value: () {
        print('onDragCompleted');
      },label: '''() {
       // 拖拽结束
      }''',),
      axis: axisValues[0],
      data: Value(
        value: 'Hello！',
        label: 'Hello！',
      ),
      maxSimultaneousDrags: intMiniValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''LongPressDraggable(
        child: ${setting.child?.label??''},
        feedback: ${setting.feedback?.label??''},
        data: "${setting.data?.label??''}",
        axis: ${setting.axis?.label??''},
        childWhenDragging: ${setting.childWhenDragging?.label??''},
        feedbackOffset: ${setting.feedbackOffset?.label??''},
        dragAnchor: ${setting.dragAnchor?.label??''},
        maxSimultaneousDrags: ${setting.maxSimultaneousDrags?.label??''},
        onDragStarted: ${setting.onDragStarted?.label??''},
        onDraggableCanceled: ${setting.onDraggableCanceled?.label??''},
        onDragCompleted: ${setting.onDragCompleted?.label??''},
        hapticFeedbackOnStart: ${setting.hapticFeedbackOnStart?.label??''},
        ignoringFeedbackSemantics: ${setting.ignoringFeedbackSemantics?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAxis),
      RadioGroupWidget(
          setting.axis,
          <Value<Axis>>[Value(name: 'null', value: null, label: 'null')]
            ..addAll(axisValues), (value) {
        setState(() {
          setting = setting.copyWith(axis: value);
        });
      }),
      ValueTitleWidget(StringParams.kDragAnchor),
      RadioGroupWidget(setting.dragAnchor, dragAnchorValues, (value) {
        setState(() {
          setting = setting.copyWith(dragAnchor: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kHapticFeedbackOnStart,
          value: setting.hapticFeedbackOnStart,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(hapticFeedbackOnStart: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kIgnoringFeedbackSemantics,
          value: setting.ignoringFeedbackSemantics,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(ignoringFeedbackSemantics: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'LongPressDraggable';
  }

  @override
  Widget getWidget() {
    return Center(
      child: LongPressDraggable(
        child: setting.child?.value,
        feedback: setting.feedback?.value,
        data: setting.data?.value,
        axis: setting.axis?.value,
        childWhenDragging: setting.childWhenDragging?.value,
        feedbackOffset: setting.feedbackOffset?.value,
        dragAnchor: setting.dragAnchor?.value,
        maxSimultaneousDrags: setting.maxSimultaneousDrags?.value,
        onDragStarted: setting.onDragStarted?.value,
        onDraggableCanceled: setting.onDraggableCanceled?.value,
        onDragCompleted: setting.onDragCompleted?.value,
        hapticFeedbackOnStart: setting.hapticFeedbackOnStart?.value,
        ignoringFeedbackSemantics: setting.ignoringFeedbackSemantics?.value,
      ),
    );
  }
}

class LongPressDraggableSetting<T> {
  final Value<Widget> child;
  final Value<Widget> feedback;
  final Value<T> data;
  final Value<Axis> axis;
  final Value<Widget> childWhenDragging;
  final Value<Offset> feedbackOffset;
  final Value<DragAnchor> dragAnchor;
  final Value<int> maxSimultaneousDrags;
  final Value<VoidCallback> onDragStarted;
  final Value<DraggableCanceledCallback> onDraggableCanceled;
  final Value<VoidCallback> onDragCompleted;
  final Value<bool> hapticFeedbackOnStart;
  final Value<bool> ignoringFeedbackSemantics;

  LongPressDraggableSetting({
    this.child,
    this.feedback,
    this.data,
    this.axis,
    this.childWhenDragging,
    this.feedbackOffset,
    this.dragAnchor,
    this.maxSimultaneousDrags,
    this.onDragStarted,
    this.onDraggableCanceled,
    this.onDragCompleted,
    this.hapticFeedbackOnStart,
    this.ignoringFeedbackSemantics,
  });

  LongPressDraggableSetting copyWith({
    Value<Widget> child,
    Value<Widget> feedback,
    Value<T> data,
    Value<Axis> axis,
    Value<Widget> childWhenDragging,
    Value<Offset> feedbackOffset,
    Value<DragAnchor> dragAnchor,
    Value<int> maxSimultaneousDrags,
    Value<VoidCallback> onDragStarted,
    Value<DraggableCanceledCallback> onDraggableCanceled,
    Value<VoidCallback> onDragCompleted,
    Value<bool> hapticFeedbackOnStart,
    Value<bool> ignoringFeedbackSemantics,
  }) {
    return LongPressDraggableSetting(
      child: child ?? this.child,
      feedback: feedback ?? this.feedback,
      data: data ?? this.data,
      axis: axis ?? this.axis,
      childWhenDragging: childWhenDragging ?? this.childWhenDragging,
      feedbackOffset: feedbackOffset ?? this.feedbackOffset,
      dragAnchor: dragAnchor ?? this.dragAnchor,
      maxSimultaneousDrags: maxSimultaneousDrags ?? this.maxSimultaneousDrags,
      onDragStarted: onDragStarted ?? this.onDragStarted,
      onDraggableCanceled: onDraggableCanceled ?? this.onDraggableCanceled,
      onDragCompleted: onDragCompleted ?? this.onDragCompleted,
      hapticFeedbackOnStart:
          hapticFeedbackOnStart ?? this.hapticFeedbackOnStart,
      ignoringFeedbackSemantics:
          ignoringFeedbackSemantics ?? this.ignoringFeedbackSemantics,
    );
  }
}
