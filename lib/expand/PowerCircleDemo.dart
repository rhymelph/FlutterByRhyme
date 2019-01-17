import 'package:flutter/material.dart';
import 'PowerCircle.dart';


class PowerCircleDemo extends StatefulWidget {
  static const String routeName = 'expand/PowerCircleDemo';

  @override
  _PowerCircleDemoState createState() => _PowerCircleDemoState();
}

class _PowerCircleDemoState extends State<PowerCircleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('能量球'),
      ),
      body: Center(
        child: PowerCircle(
          circleColor: Colors.grey[200],
          progress: 0.4,
          child: Center(
            child: Text('40%'),
          ),
        ),
      ),
    );
  }
}



