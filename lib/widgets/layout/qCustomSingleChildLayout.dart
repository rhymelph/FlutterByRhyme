import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CustomSingleChildLayoutDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/CustomSingleChildLayout';
  final String detail = '''e delegate can determine the layout constraints for the child and can decide where to position the child. The delegate can also determine the size of the parent, but the size of the parent cannot depend on the size of the child.
See also:
SingleChildLayoutDelegate, which controls the layout of the child.
Align, which sizes itself based on its child's size and positions the child according to an Alignment value.
FractionallySizedBox, which sizes its child based on a fraction of its own size and positions the child according to an Alignment value.
CustomMultiChildLayout, which uses a delegate to position multiple children.''';

  @override
  _CustomSingleChildLayoutDemoState createState() =>
      _CustomSingleChildLayoutDemoState();
}

class _CustomSingleChildLayoutDemoState
    extends ExampleState<CustomSingleChildLayoutDemo> {
  CustomSingleChildLayoutSetting setting;

  @override
  void initState() {
    setting = CustomSingleChildLayoutSetting(
      delegate: Value(
        value: _SingleChildDelegate(),
        label: '_SingleChildDelegate()',
      ),
      child: Value(
        value: Text('CustomSingleChildLayout'),
        label: "Text('CustomSingleChildLayout')",
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
    return '''CustomSingleChildLayout(
      delegate: ${setting.delegate?.label??''},
      child: ${setting.child?.label??''},
    )
    
//自定义布局代理
class _SingleChildDelegate extends SingleChildLayoutDelegate{
  const _SingleChildDelegate();

  @override //设置子Widget约束
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override//设置大小
  Size getSize(BoxConstraints constraints) {
    return new Size(constraints.maxWidth, kToolbarHeight);
  }

  @override//偏移
  Offset getPositionForChild(Size size, Size childSize) {
    return new Offset(10.0, size.height - childSize.height);
  }

  @override//是否应该重新布局
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) => false;
}''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'CustomSingleChildLayout';
  }

  @override
  Widget getWidget() {
    return CustomSingleChildLayout(
      delegate: setting.delegate?.value,
      child: setting.child?.value,
    );
  }
}

class CustomSingleChildLayoutSetting {
  final Value<SingleChildLayoutDelegate> delegate;
  final Value<Widget> child;

  CustomSingleChildLayoutSetting({@required this.delegate, this.child});

  CustomSingleChildLayoutSetting copyWith({
    Value<SingleChildLayoutDelegate> delegate,
    Value<Widget> child,
  }) {
    return CustomSingleChildLayoutSetting(
      delegate: delegate ?? this.delegate,
      child: child ?? this.child,
    );
  }
}


class _SingleChildDelegate extends SingleChildLayoutDelegate{
  const _SingleChildDelegate();

  @override //设置子Widget约束
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override//设置大小
  Size getSize(BoxConstraints constraints) {
    return new Size(constraints.maxWidth, kToolbarHeight);
  }

  @override//偏移
  Offset getPositionForChild(Size size, Size childSize) {
    return new Offset(10.0, size.height - childSize.height);
  }

  @override//是否应该重新布局
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) => false;
}