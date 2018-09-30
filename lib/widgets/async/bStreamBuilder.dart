import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:async';
import 'dart:math';
class StreamBuilderDemo extends StatefulWidget {
  static const String routeName = 'widgets/async/StreamBuilder';
  final String detail = '''''';

  @override
  _StreamBuilderDemoState createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends ExampleState<StreamBuilderDemo> {
  final StreamController _controller = StreamController();

  @override
  void initState() {
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
    return r''' final StreamController _controller = StreamController();
    
  StreamBuilder(
        initialData: '',
        stream: _controller.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none:${snapshot.data}');
            case ConnectionState.active:
              return Text('active:${snapshot.data}');
            case ConnectionState.waiting:
              return Text('waiting:${snapshot.data}');
            case ConnectionState.done:
              return Text('done:${snapshot.data}');
          }
        },
      )

//发送一条数据
_controller.sink.add('data');''';
  }

  List randomSeek=[
    'Flutter',
    'IOS',
    'Android',
    'Dart',
    'Java',
    'Kotlin',
    'Swift',
    'Object-C',
  ];
  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: '点击发送一条数据',
        onPressed: () {
          _controller.sink.add(randomSeek[Random().nextInt(randomSeek.length)]);
        },
      )
    ];
  }

  @override
  String getTitle() {
    return 'StreamBuilder';
  }

  @override
  Widget getWidget() {
    return Center(
      child: StreamBuilder(
        initialData: '',
        stream: _controller.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none:${snapshot.data}');
            case ConnectionState.active:
              return Text('active:${snapshot.data}');
            case ConnectionState.waiting:
              return Text('waiting:${snapshot.data}');
            case ConnectionState.done:
              return Text('done:${snapshot.data}');
          }
        },
      ),
    );
  }
}
