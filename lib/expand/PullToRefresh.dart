import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class PullToRefreshDemo extends StatefulWidget {
  static const String routeName = 'expand/PullToRefreshDemo';

  @override
  _PullToRefreshDemoState createState() => _PullToRefreshDemoState();
}

class _PullToRefreshDemoState extends State<PullToRefreshDemo> {
  List<Widget> bodys;

  @override
  void initState() {
    // TODO: implement initState
    bodys = [];
    for (int i = 0; i < 5; i++) {
      bodys.add(ListTile(
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
      body: RefreshIndicator(
        child: ListView(
          children: bodys,
        ),
        onRefresh: () {
          return Future.value(null);
        },
      ),
    );
  }
}
