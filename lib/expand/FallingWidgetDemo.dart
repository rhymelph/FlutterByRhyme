import 'package:flutter/material.dart';
import 'FallingWidget.dart';


class FallingWidgetDemo extends StatefulWidget {
  static const String routeName = 'expand/FallingWidgetDemo';

  @override
  _FallingWidgetDemoState createState() => _FallingWidgetDemoState();
}

class _FallingWidgetDemoState extends State<FallingWidgetDemo> {
  
  @override
  void initState() {
//    Image.asset(name)
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('飘雪'),
      ),
      backgroundColor: Colors.grey,
      body: FallingWidget(
        count: 50,
//        imagePath: 'images/gold.png',
      ),
    );
  }
}
