import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FlowDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Flow';
  final String detail = '''A widget that sizes and positions children efficiently, according to the logic in a FlowDelegate.
Flow layouts are optimized for repositioning children using transformation matrices.
The flow container is sized independently from the children by the FlowDelegate.getSize function of the delegate. The children are then sized independently given the constraints from the FlowDelegate.getConstraintsForChild function.
Rather than positioning the children during layout, the children are positioned using transformation matrices during the paint phase using the matrices from the FlowDelegate.paintChildren function. The children can be repositioned efficiently by simply repainting the flow, which happens without the children being laid out again (contrast this with a Stack, which does the sizing and positioning together during layout).
The most efficient way to trigger a repaint of the flow is to supply an animation to the constructor of the FlowDelegate. The flow will listen to this animation and repaint whenever the animation ticks, avoiding both the build and layout phases of the pipeline.
See also:
Wrap, which provides the layout model that some other frameworks call "flow", and is otherwise unrelated to Flow.
FlowDelegate, which controls the visual presentation of the children.
Stack, which arranges children relative to the edges of the container.
CustomSingleChildLayout, which uses a delegate to control the layout of a single child.
CustomMultiChildLayout, which uses a delegate to position multiple children.
The catalog of layout widgets.''';

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
      Size size=context.getChildSize(i);
      //调用方法画子Widget，paintChild(int i, { Matrix4 transform, double opacity = 1.0 } i传入
      context.paintChild(i,transform: Matrix4.translationValues(10.0*i, 10.0*i, 0.0),opacity: i/count);
    } 
  }
  @override //是否应该重新画
  bool shouldRepaint(FlowDelegate oldDelegate) => false;
}