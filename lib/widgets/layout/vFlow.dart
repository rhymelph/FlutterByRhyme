import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlowDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Flow';
  final String detail = '''''';

  @override
  _FlowDemoState createState() =>
      _FlowDemoState();
}

class _FlowDemoState
    extends ExampleState<FlowDemo> {
  FlowSetting setting;

  @override
  void initState() {
    setting = FlowSetting(
      delegate: Value(
        value: _MyFlowDelegate(),
        label: '_MyFlowDelegate()',
      ),
      children: Value(
        value: [
          Image.asset('images/chewCrispyChicken.9.jpg'),
          Image.asset('images/burgers.jpg'),
          Image.asset('images/pazzer.jpg'),
        ]
      )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''
    
class _MyFlowDelegate extends FlowDelegate{
  @override
  void paintChildren(FlowPaintingContext context) {
    //有多少个子Widget
    int count=context.childCount;
    for(int i=0;i<count;i++){
      //获取子Widget的宽高
      Size size=context.getChildSize(i);
      //调用方法画子Widget，paintChild(int i, { Matrix4 transform, double opacity = 1.0 } i传入
      context.paintChild(i,transform: Matrix4.translationValues(10.0*i, 10.0*i, 0.0),opacity: i/count);
    } 
  }
  @override //是否应该重新画
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'Flow';
  }


  @override
  Widget getWidget() {
    return Flow(delegate: setting.delegate?.value,
      children: setting.children?.value,
    );
  }
}

class FlowSetting {
  final Value<FlowDelegate> delegate;
  final Value<List<Widget>> children;

  FlowSetting({
    @required this.delegate,
    this.children
  });

  FlowSetting copyWith({
   Value<FlowDelegate> delegate,
   Value<List<Widget>> children,
  }) {
    return FlowSetting(
      delegate: delegate??this.delegate,
      children: children??this.children,
    );
  }
}

class _MyFlowDelegate extends FlowDelegate{
  @override
  void paintChildren(FlowPaintingContext context) {
    //有多少个子Widget
    int count=context.childCount;
    for(int i=0;i<count;i++){
      //获取子Widget的宽高
      Size size=context.getChildSize(i);
      //调用方法画子Widget，paintChild(int i, { Matrix4 transform, double opacity = 1.0 } i传入
      context.paintChild(i,transform: Matrix4.translationValues(10.0*i, 10.0*i, 0.0),opacity: i/count);
    } 
  }
  @override //是否应该重新画
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}