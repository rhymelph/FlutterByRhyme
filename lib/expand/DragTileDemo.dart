import 'package:flutter/material.dart';
import 'DragTile.dart';


class DragItemDemo extends StatefulWidget {
  static const String routeName = 'expand/DragItemDemo';

  @override
  _DragItemDemoState createState() => _DragItemDemoState();
}

class _DragItemDemoState extends State<DragItemDemo>
with TickerProviderStateMixin{

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
      body: body,
    );
  }

  get body=>ListView.builder(
    itemCount: itemList.length,
    itemBuilder: (BuildContext context, int index) {
      return DragTile(
        dragWidget: MyDragWidget(),
        child: ListTile(
          title: Text(itemList[index],),
        ),
      );
    },);
}

class MyDragWidget extends DragWidget{

  @override
  Widget itemOne() {
    return Text('置顶');
  }

  @override
  Widget itemTwo() {
    return Text('删除');
  }

}


