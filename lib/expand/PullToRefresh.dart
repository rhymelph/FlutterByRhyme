import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'PullDownIndicator.dart';
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
    for (int i = 0; i < 5; i++) {
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
      body: PullDownIndicator(
        header: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('刷新界面'),
        ),
        child: ListView(
          children: bodyList,
        ),
        onRefresh: () {
          return Future.value(null);
        },
      ),
    );
  }
}
