import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class SemanticsDemo extends StatefulWidget {
  static const String routeName='widgets/access/Semantics';
  final String detail='''一个小部件，用小部件含义的描述来注释小部件树。

由可访问性工具，搜索引擎和其他语义分析软件使用，以确定应用程序的含义。''';

  @override
  _SemanticsDemoState createState() => _SemanticsDemoState();
}

class _SemanticsDemoState extends ExampleState<SemanticsDemo> {
   SemanticsSetting setting;

  @override
  void initState() {
    setting = SemanticsSetting();
    super.initState();
  }
  @override
  String getDetail() {
    return widget.detail;
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
    return 'Semantics';
  }

  @override
  Widget getWidget() {
    return Semantics(
      child: GestureDetector( onTap:(){},child: Text('hello')),
      onTap: (){
        exampleKey.currentState.showToast('hello');
      },
      onLongPress: (){

      },
    );
  }
}

class SemanticsSetting{

//    SemanticsSetting({});
//
//    SemanticsSetting copyWith({}){
//    return SemanticsSetting();
//    }
}