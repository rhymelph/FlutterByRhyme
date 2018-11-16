import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'PullDownIndicator.dart';
import 'dart:async';
import 'PullDown2.dart';

class PullToRefreshDemo extends StatefulWidget {
  static const String routeName = 'expand/PullToRefreshDemo';

  @override
  _PullToRefreshDemoState createState() => _PullToRefreshDemoState();
}

class _PullToRefreshDemoState extends State<PullToRefreshDemo> {
  List<Widget> bodyList;

  @override
  void initState() {
    // TODO: implement initState
    bodyList = [];
    for (int i = 0; i < 15; i++) {
      bodyList.add(ListTile(
        title: Text('This item is $i'),
      ));
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

//  get body =>PullDownIndicator(
//    refreshHeight: 60.0,
//    header: Container(
//      color: Colors.blue,
//      alignment: Alignment.center,
//      child: Text('刷新界面'),
//    ),
//    child: ListView(
//      children: bodyList,
//    ),
//    onRefresh: () {
//      final Completer<Null> comparator
//      =new Completer();
//
//      new Timer(Duration(seconds: 2),(){
//        comparator.complete(null);
//      });
//      return comparator.future;
//    },
//  );

  get body => RhyPullToRefreshIndicator(
      header: RefreshMyBody(),
        footer: RefreshMyBody(),
        child: ListView(
          children: bodyList,
        ),
      );
}

class RefreshMyBody extends RefreshBody{
  @override
  Widget onArmed() {
    return Text('下拉加载');
  }
  @override
  Widget onCancel() {
    return Text('刷新取消');
  }

  @override
  Widget onDone() {
    return Text('刷新完成');

  }
  @override
  Widget onDrag() {
    return Text('下拉刷新');
  }

  @override
  Widget onRefresh() {
    return Text('刷新中');

  }

  @override
  Widget onSnap() {
    return Text('松开刷新');

  }

}
