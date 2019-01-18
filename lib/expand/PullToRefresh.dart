import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'RhyRefreshIndicator.dart';
import 'dart:async';
//import 'PullDown2.dart';

class PullToRefreshDemo extends StatefulWidget {
  static const String routeName = 'expand/PullToRefreshDemo';

  @override
  _PullToRefreshDemoState createState() => _PullToRefreshDemoState();
}

class _PullToRefreshDemoState extends State<PullToRefreshDemo> {
  List<String> bodyList;

  @override
  void initState() {
    // TODO: implement initState
    bodyList = [];
    for (int i = 0; i < 5; i++) {
      bodyList.add('This item is $i');
    }
    print('initState');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上拉下拉'),
      ),
      body: body,
    );
  }

  get body => RhyRefreshIndicator(
        refreshHeight: 60.0,
        header: RefreshMyBody(),
        child: ListView.builder(
          itemCount: bodyList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(bodyList[index]),
            );
          },
        ),
        onRefresh: () {
          final Completer<Null> comparator = new Completer();

          new Timer(Duration(seconds: 2), () {
            setState(() {
              bodyList.insert(0, '新增');
            });
            comparator.complete(null);
          });
          return comparator.future;
        },
        footer: new RefreshMyBody2(),
        onLoading: () {
          final Completer<Null> comparator = new Completer();

          new Timer(Duration(seconds: 2), () {
            setState(() {
              bodyList.add('新加');
            });
            comparator.complete(null);
          });

          return comparator.future;
        },
      );
}

class RefreshMyBody extends RefreshBody {
  @override
  Widget onArmed() {
    return Text('松开刷新',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onCancel() {
    return Text('刷新取消',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onDone() {
    return Text('刷新完成',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onDrag() {
    return Text('下拉刷新',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onRefresh() {
    return Text('刷新中',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onSnap() {
    return Text('松开状态',style: TextStyle(color: Colors.white),);
  }
}

class RefreshMyBody2 extends RefreshBody {
  @override
  Widget onArmed() {
    return Text('松开加载',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onCancel() {
    return Text('加载取消',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onDone() {
    return Text('加载完成',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onDrag() {
    return Text('上拉加载',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onRefresh() {
    return Text('加载中',style: TextStyle(color: Colors.white),);
  }

  @override
  Widget onSnap() {
    return Text('松开状态',style: TextStyle(color: Colors.white),);
  }
}
