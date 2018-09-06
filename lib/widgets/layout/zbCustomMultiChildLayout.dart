import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

enum Custom {
  up,
  center,
  down,
  left,
  right,
}

class CustomMultiChildLayoutDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/CustomMultiChildLayout';
  final String detail = '''A widget that uses a delegate to size and position multiple children.
The delegate can determine the layout constraints for each child and can decide where to position each child. The delegate can also determine the size of the parent, but the size of the parent cannot depend on the sizes of the children.
CustomMultiChildLayout is appropriate when there are complex relationships between the size and positioning of a multiple widgets. To control the layout of a single child, CustomSingleChildLayout is more appropriate. For simple cases, such as aligning a widget to one or another edge, the Stack widget is more appropriate.
Each child must be wrapped in a LayoutId widget to identify the widget for the delegate.
See also:
MultiChildLayoutDelegate, for details about how to control the layout of the children.
CustomSingleChildLayout, which uses a delegate to control the layout of a single child.
Stack, which arranges children relative to the edges of the container.
Flow, which provides paint-time control of its children using transform matrices.''';

  @override
  _CustomMultiChildLayoutDemoState createState() =>
      _CustomMultiChildLayoutDemoState();
}

class _CustomMultiChildLayoutDemoState
    extends ExampleState<CustomMultiChildLayoutDemo> {
  CustomMultiChildLayoutSetting setting;
  @override
  void initState() {
    setting = CustomMultiChildLayoutSetting(
        delegate: Value(
          value: _CustomLayout(margin: 5.0),
          label: '_CustomLayout()',
        ),
        children: Value(
          value: <Widget>[
            LayoutId(id: Custom.up,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.blue,
                  )),
                ),
            ),
            LayoutId(id: Custom.center,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.red,
                  )),
                ),),
            LayoutId(id: Custom.down,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.green,
                  )),
                ),),
            LayoutId(id: Custom.right,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.limeAccent,
                )),
              ),),
            LayoutId(id: Custom.left,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.deepOrange,
                )),
              ),),
          ],
          label: '''<Widget>[
            LayoutId(id: Custom.up,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.blue,
                  )),
                ),
            ),
            LayoutId(id: Custom.center,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.red,
                  )),
                ),),
            LayoutId(id: Custom.down,
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: Colors.green,
                  )),
                ),),
            LayoutId(id: Custom.right,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.limeAccent,
                )),
              ),),
            LayoutId(id: Custom.left,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: DecoratedBox(decoration: BoxDecoration(
                  color: Colors.deepOrange,
                )),
              ),),
          ]''',
        ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CustomMultiChildLayout(
      delegate: ${setting.delegate?.label??''},
      children: ${setting.children?.label??''},
    );
    
//定义一个枚举，用于标识id
enum Custom {
  up,
  center,
  down,
  left,
  right,
}

//自定义布局代理
class _CustomLayout extends MultiChildLayoutDelegate {
  _CustomLayout({this.margin:3.0});
  //外边距
  final double margin;
  @override//性能布局
  void performLayout(Size size) {
    // TODO: implement performLayout
    final BoxConstraints box = BoxConstraints.loose(size);
    Size upSize;
    Size centerSize;
    Size downSize;
    Size leftSize;
    Size rightSize;
    if(hasChild(Custom.up)){
      upSize=layoutChild(Custom.up, box);
      final dx=(size.width-upSize.width)/2;
      final dy=(size.height-upSize.height)/2-upSize.height-margin;
      positionChild(Custom.up, Offset(dx, dy));
    }
    if(hasChild(Custom.center)){
      centerSize=layoutChild(Custom.center, box);
      final dx=(size.width-centerSize.width)/2;
      final dy=(size.height-centerSize.height)/2;
      positionChild(Custom.center, Offset(dx, dy));
    }
    if(hasChild(Custom.down)){
      downSize=layoutChild(Custom.down, box);
      final dx=(size.width-downSize.width)/2;
      final dy=(size.height-downSize.height)/2+downSize.height+margin;
      positionChild(Custom.down, Offset(dx, dy));
    }
    if(hasChild(Custom.left)){
      leftSize=layoutChild(Custom.left, box);
      final dx=(size.width-leftSize.width)/2-leftSize.width-margin;
      final dy=(size.height-leftSize.height)/2;
      positionChild(Custom.left, Offset(dx, dy));
    }
    if(hasChild(Custom.right)){
      rightSize=layoutChild(Custom.right, box);
      final dx=(size.width-rightSize.width)/2+rightSize.width+margin;
      final dy=(size.height-rightSize.height)/2;
      positionChild(Custom.right, Offset(dx, dy));
    }
  }
  @override //是否应该重绘
  bool shouldRelayout(_CustomLayout oldDelegate) {
    // TODO: implement shouldRelayout
    return oldDelegate.margin!=margin;
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'CustomMultiChildLayout';
  }

  @override
  Widget getWidget() {
    return CustomMultiChildLayout(
      delegate: setting.delegate?.value,
      children: setting.children?.value,
    );
  }
}

class CustomMultiChildLayoutSetting {
  final Value<MultiChildLayoutDelegate> delegate;
  final Value<List<Widget>> children;

  CustomMultiChildLayoutSetting({
    this.delegate,
    this.children,
  });

  CustomMultiChildLayoutSetting copyWith({
    Value<MultiChildLayoutDelegate> delegate,
    Value<List<Widget>> children,
  }) {
    return CustomMultiChildLayoutSetting(
      delegate: delegate ?? this.delegate,
      children: children ?? this.children,
    );
  }
}

class _CustomLayout extends MultiChildLayoutDelegate {
  _CustomLayout({this.margin:3.0});
  //外边距
  final double margin;
  @override//性能布局
  void performLayout(Size size) {
    final BoxConstraints box = BoxConstraints.loose(size);
    Size upSize;
    Size centerSize;
    Size downSize;
    Size leftSize;
    Size rightSize;
    if(hasChild(Custom.up)){
      upSize=layoutChild(Custom.up, box);
      final dx=(size.width-upSize.width)/2;
      final dy=(size.height-upSize.height)/2-upSize.height-margin;
      positionChild(Custom.up, Offset(dx, dy));
    }
    if(hasChild(Custom.center)){
      centerSize=layoutChild(Custom.center, box);
      final dx=(size.width-centerSize.width)/2;
      final dy=(size.height-centerSize.height)/2;
      positionChild(Custom.center, Offset(dx, dy));
    }
    if(hasChild(Custom.down)){
      downSize=layoutChild(Custom.down, box);
      final dx=(size.width-downSize.width)/2;
      final dy=(size.height-downSize.height)/2+downSize.height+margin;
      positionChild(Custom.down, Offset(dx, dy));
    }
    if(hasChild(Custom.left)){
      leftSize=layoutChild(Custom.left, box);
      final dx=(size.width-leftSize.width)/2-leftSize.width-margin;
      final dy=(size.height-leftSize.height)/2;
      positionChild(Custom.left, Offset(dx, dy));
    }
    if(hasChild(Custom.right)){
      rightSize=layoutChild(Custom.right, box);
      final dx=(size.width-rightSize.width)/2+rightSize.width+margin;
      final dy=(size.height-rightSize.height)/2;
      positionChild(Custom.right, Offset(dx, dy));
    }
  }
  @override //是否应该重绘
  bool shouldRelayout(_CustomLayout oldDelegate) {
    return oldDelegate.margin!=margin;
  }
}