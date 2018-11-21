import 'package:flutter/material.dart';
import 'DragItem.dart';


class DragItemDemo extends StatefulWidget {
  static const String routeName = 'expand/DragItemDemo';

  @override
  _DragItemDemoState createState() => _DragItemDemoState();
}

class _DragItemDemoState extends State<DragItemDemo> {

  List<String> itemList = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      itemList.add('This is item $i');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('侧滑删除'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return DragItem(
            left: Text('置顶'),
            right: Text('删除'),
            child: ListTile(
              title: Text(itemList[index],),
            ),
          );
        },),
    );
  }
}
