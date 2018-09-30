import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:async';
class NotificationListenerDemo extends StatefulWidget {
  static const String routeName = 'widgets/scrolling/NotificationListener';
  final String detail = '''一个小部件，用于侦听通知冒泡树。

仅当其runtimeType是其子类型时，通知才会触发onNotification回调 。T

要分派通知，请使用Notification.dispatch方法。''';

  @override
  _NotificationListenerDemoState createState() =>
      _NotificationListenerDemoState();
}

class _NotificationListenerDemoState
    extends ExampleState<NotificationListenerDemo> {
  NotificationListenerSetting setting;
  final StreamController<String> _controller=new StreamController();

  @override
  void initState() {
    setting = NotificationListenerSetting(
        child: Value(
          value: ListView.builder(
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
        onNotification: Value(value: (Notification notification) {
          ScrollNotification scrolln = notification as ScrollNotification;
          _controller.add('depth:${scrolln.depth}\n'
              'metrics\n'
              '-axisDirection:${scrolln.metrics.axisDirection}\n'
              '-axis:${scrolln.metrics.axis}\n'
              '-extentAfter:${scrolln.metrics.extentAfter}\n'
              '-extentBefore:${scrolln.metrics.extentBefore}\n'
              '-extentInside:${scrolln.metrics.extentInside}\n'
              '-minScrollExtent:${scrolln.metrics.minScrollExtent}\n'
              '-maxScrollExtent:${scrolln.metrics.maxScrollExtent}\n'
              '-atEdge:${scrolln.metrics.atEdge}\n'
              '-outOfRange:${scrolln.metrics.outOfRange}\n'
              '-pixels:${scrolln.metrics.pixels}\n'
              '-viewportDimension:${scrolln.metrics.viewportDimension}\n'
          );

          return false;
        },label: r'''(Notification notification) {
          ScrollNotification scrolln = notification as ScrollNotification;
          //返回false继续通知，true取消通知
          return false;
        }'''));
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''NotificationListener<ScrollNotification>(
      child: ${setting.child?.label??''},
      onNotification: ${setting.onNotification?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kStatus),
      Center(
        child: StreamBuilder(
          initialData: '',
          stream: _controller.stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text(snapshot.data);
          },
        ),
      )
    ];
  }

  @override
  String getTitle() {
    return 'NotificationListener';
  }

  @override
  Widget getWidget() {
    return NotificationListener<ScrollNotification>(
      child: setting.child?.value,
      onNotification: setting.onNotification?.value,
    );
  }
}

class NotificationListenerSetting {
  final Value<Widget> child;
  final Value<NotificationListenerCallback> onNotification;

  NotificationListenerSetting({
    this.child,
    this.onNotification,
  });

  NotificationListenerSetting copyWith({
    Value<Widget> child,
    Value<NotificationListenerCallback> onNotification,
  }) {
    return NotificationListenerSetting(
      child: child ?? this.child,
      onNotification: onNotification ?? this.onNotification,
    );
  }
}
