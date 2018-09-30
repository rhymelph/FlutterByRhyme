import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'package:http/http.dart';

class FutureBuilderDemo extends StatefulWidget {
  static const String routeName = 'widgets/async/FutureBuilder';
  final String detail = '''基于与Future交互的最新快照构建自己的小部件。

在未来一定是在早期获得，例如State.initState， State.didUpdateConfig或State.didChangeDependencies。在构造FutureBuilder时，不能在State.build或StatelessWidget.build方法调用期间创建它。如果将来与FutureBuilder同时创建，则每次重建FutureBuilder的父级时，都将重新启动异步任务。

一般准则是假设每个build方法都可以调用每个方法，并将省略的调用视为优化。''';

  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends ExampleState<FutureBuilderDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return r'''  Future<String> _loadData() async{
   Response response= await get('https://raw.githubusercontent.com/rhymelph/FlutterByRhyme/master/assets/test.json');
   return response.body;
  }
Center(
      child: FutureBuilder(
        initialData: "加载中，请耐心等待",
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            //连接到活动。
            case ConnectionState.waiting:
            //连接到异步计算和等待交互。
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    snapshot.data,
                  ),
                ],
              );
            case ConnectionState.none:
            //当前没有连接到任何异步计算。
              return FlatButton(
                onPressed: () {
                  if (mounted) setState(() {});
                },
                child: Text('点击重新加载'),
              );
            case ConnectionState.done:
            //连接到终止异步计算。
              if (snapshot.hasError) {
                return FlatButton(
                //snapshot.error获取到的异常
                  onPressed: () {
                    if (mounted) setState(() {});
                  },
                  child: Text('点击重新加载'),
                );
              } else {
                return Text(
                  '${snapshot.data}',
                );
              }
          }
        },
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'FutureBuilder';
  }

  @override
  Widget getWidget() {
    return Center(
      child: FutureBuilder(
        initialData: "加载中，请耐心等待",
        future: _loadData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    snapshot.data,
                  ),
                ],
              );
            case ConnectionState.none:
              print(snapshot.data);
              return FlatButton(
                onPressed: () {
                  if (mounted) setState(() {});
                },
                child: Text('点击重新加载'),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
//                exampleKey.currentState.showToast('请求失败${snapshot.error}');
                return FlatButton(
                  onPressed: () {
                    if (mounted) setState(() {});
                  },
                  child: Text('点击重新加载'),
                );
              } else {
                return Text(
                  '${snapshot.data}',
                );
              }
          }
        },
      ),
    );
  }

  Future<String> _loadData() async {
    Response response = await get(
        'https://raw.githubusercontent.com/rhymelph/FlutterByRhyme/master/assets/test.json');
    return response.body;
  }
}
