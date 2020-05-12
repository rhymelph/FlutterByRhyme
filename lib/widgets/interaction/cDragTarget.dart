import 'package:flutter/material.dart' hide Page;
import 'package:flutterbyrhyme/code/example_code.dart';

class DragTargetDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/DragTarget';
  final String detail = '''删除Draggable小部件时接收数据的小部件。

当拖动目标拖动到拖动目标顶部时，将询问拖动目标是否接受拖动目标所携带的数据。如果用户确实将拖动目标放在拖动目标的顶部（并且拖动目标已指示它将接受可拖动的数据），则要求拖动目标接受可拖动的数据。''';

  @override
  _DragTargetDemoState createState() => _DragTargetDemoState();
}

class _DragTargetDemoState extends ExampleState<DragTargetDemo> {
  DragTargetSetting setting;
  String status = '';

  @override
  void initState() {
    setting = DragTargetSetting(
      builder: Value(
        value: (BuildContext context, List<dynamic> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            width: 80.0,
            height: 80.0,
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('Target'),
          );
        },
        label: '''(BuildContext context, List<dynamic> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            width: 80.0,
            height: 80.0,
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('Target'),
          );
        }''',
      ),
//      onWillAccept: Value(
//        value: (value) {
//          print('将接收数据$value');
//        },
//      ),
//      onAccept: Value(
//        value: (value){
//
//        },
//      ),
//      onLeave: Value(
//        value: (value) {
//          print('离开数据$value');
//        },
//      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Stack(
      children: <Widget>[
        Positioned(
          top: offset.dy,
          left: offset.dx,
          child: Draggable(
            onDraggableCanceled: (v, f) {
//            print(v.pixelsPerSecond);
//            print(f);
              offset = new Offset(f.dx, f.dy);
            },
            data: 1.0,
            child: Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text('Drag'),
            ),
            feedback: Opacity(
              opacity: 0.5,
              child: Container(
                width: 45.0,
                height: 45.0,
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text(
                  'Drag',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: DragTarget(
            builder: ${setting.builder?.label??''},
              onWillAccept: (double value){
//表示将要接收，拖动Widget已接触target
              return true;
            },
            onAccept: (double value){
              //接收到的值
            },
            onLeave: (double value){
              //进入后又离开的值
            },
          ),
        ),
      ],
    )''';
  }

  Offset offset = Offset.zero;

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kStatus),
      Center(
        child: Text(status),
      ),
    ];
  }

  @override
  String getTitle() {
    return 'DragTarget';
  }

  @override
  Widget getWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: offset.dy,
          left: offset.dx,
          child: Draggable(
            onDraggableCanceled: (v, f) {
//            print(v.pixelsPerSecond);
//            print(f);
              offset = new Offset(f.dx, f.dy);
            },
            data: 1.0,
            child: Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text('Drag'),
            ),
            feedback: Opacity(
              opacity: 0.5,
              child: Container(
                width: 45.0,
                height: 45.0,
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text(
                  'Drag',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: DragTarget(
            builder: setting.builder?.value,
            onWillAccept: (double value){
              setState(() {
                status='将接收:$value';
              });
              return true;
            },
            onAccept: (double value) {
              setState(() {
                status = '接收:$value';
              });
            },
            onLeave: (value) {
              setState(() {
                status = '离开:$value';
              });
            },
          ),
        ),
      ],
    );
  }
}

class DragTargetSetting {
  final Value<DragTargetBuilder> builder;
  final Value<DragTargetWillAccept> onWillAccept;
  final Value<DragTargetAccept> onAccept;
  final Value<DragTargetLeave> onLeave;

  DragTargetSetting({
    this.builder,
    this.onWillAccept,
    this.onAccept,
    this.onLeave,
  });

  DragTargetSetting copyWith({
    Value<DragTargetBuilder> builder,
    Value<DragTargetWillAccept> onWillAccept,
    Value<DragTargetAccept> onAccept,
    Value<DragTargetLeave> onLeave,
  }) {
    return DragTargetSetting(
      builder: builder ?? this.builder,
      onWillAccept: onWillAccept ?? this.onWillAccept,
      onAccept: onAccept ?? this.onAccept,
      onLeave: onLeave ?? this.onLeave,
    );
  }
}
