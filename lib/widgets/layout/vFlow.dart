import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlowDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Flow';
  final String detail = '''根据FlowDelegate中的逻辑，可以有效地调整和定位子项的小部件。

优化流布局以使用转换矩阵重新定位子项。

通过委托的FlowDelegate.getSize函数，流容器的大小独立于子容器 。然后根据FlowDelegate.getConstraintsForChild函数的约束，独立调整子项的大小 。

不是在布局期间定位子项，而是使用FlowDelegate.paintChildren函数中的矩阵在绘制阶段使用变换矩阵定位子项。通过简单地重新绘制流动就可以有效地重新定位孩子，这种情况在孩子不再被布置的情况下发生（与Stack相反，在布局期间进行尺寸调整和定位）。

触发重绘流的最有效方法是向FlowDelegate的构造函数提供动画。流动将监听此动画并在动画滴答时重新绘制，从而避免管道的构建和布局阶段。''';

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
    return '''Flow(delegate: ${setting.delegate?.label??''},
      children: ${setting.children?.label??''},
    )
    
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
      //调用方法画子Widget，paintChild(int i, { Matrix4 transform, double opacity = 1.0 } i传入
      context.paintChild(i,transform: Matrix4.translationValues(10.0*i, 10.0*i, 0.0),opacity: i/count);
    } 
  }
  @override //是否应该重新画
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}