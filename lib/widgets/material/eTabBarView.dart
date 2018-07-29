import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TabBarViewDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/TabBarView';
  final String detail = '';

  @override
  _TabBarViewDemoState createState() => _TabBarViewDemoState();
}

class _TabBarViewDemoState extends ExampleState<TabBarViewDemo>
    with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    controller = TabController(length: tabValues[0].value.length, vsync: this,
    );
    super.initState();
  }

  @override
  String getDetail() {
    return '';
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'TabBarView';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: TabBar(
        controller: controller,
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.green,
        tabs: tabValues[0].value,),
      body: TabBarView(
          controller: controller,
          children: tabValues[0].value.map((v){
        return  _PageWidget(v.hashCode);
      }).toList()),
    );
  }
}

class _PageWidget extends StatefulWidget {

   _PageWidget(this.v);
  final int v;
  @override
  __PageWidgetState createState() => __PageWidgetState();
}

class __PageWidgetState extends State<_PageWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: PageStorageKey<int>(widget.v),
      itemBuilder: (BuildContext context ,int index){
      return ListTile(
        title: Text('Item:$index'),
      );
    },itemCount: 30,);
  }
}

