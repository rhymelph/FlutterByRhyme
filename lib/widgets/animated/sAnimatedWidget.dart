import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedWidgetDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedWidget';
  final String detail = '''在给定的Listenable更改值时重建的窗口小部件。

AnimatedWidget是最常见的使用动画对象，这是 可听的，但它可以与任何使用收听，包括 ChangeNotifier和ValueNotifier。

AnimatedWidget对于无状态的小部件最有用。要使用AnimatedWidget，只需将其子类化并实现构建函数。

对于涉及附加状态的更复杂的情况，请考虑使用 AnimatedBuilder。''';

  @override
  _AnimatedWidgetDemoState createState() => _AnimatedWidgetDemoState();
}

class _AnimatedWidgetDemoState extends ExampleState<AnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  AnimatedWidgetSetting setting;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    setting = AnimatedWidgetSetting(
        rightWidget: Value(
          value: Container(
            width: 45.0,
            height: 45.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Text('right'),
          ),
        ),
        leftWidget: Value(
          value: Container(
            width: 45.0,
            height: 45.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Text('left'),
          ),
        ),
        spaceFactor: Value(
          value: _controller,
        ),
        spacing: Value(
          value: 60.0,
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''class IdeaWidget extends AnimatedWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final double spacing;

  const IdeaWidget({
    Key key,
    this.spacing,
    @required this.leftWidget,
    @required this.rightWidget,
    @required Animation<double> spaceFactor,
  }) : super(key: key, listenable: spaceFactor);

  Animation<double> get spaceFactor => listenable;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _IdeaDelegate(spacing -  spacing * spaceFactor.value),
      children: <Widget>[
        LayoutId(id: _IdeaId.left, child: leftWidget),
        LayoutId(id: _IdeaId.right, child: rightWidget),
      ],
    );
  }
}

enum _IdeaId {
  left,
  right,
}

class _IdeaDelegate extends MultiChildLayoutDelegate {
  final double spacing;

  _IdeaDelegate(this.spacing);

  @override
  void performLayout(Size size) {
    final BoxConstraints box = BoxConstraints.loose(size);
    Size leftSize;
    Size rightSize;
    leftSize = layoutChild(_IdeaId.left, box);
    rightSize = layoutChild(_IdeaId.right, box);

    positionChild(
        _IdeaId.left,
        Offset((size.width / 2) - leftSize.width -spacing,
            (size.height - leftSize.height) / 2));

    positionChild(
        _IdeaId.right,
        Offset((size.width / 2 )+spacing,
            (size.height - rightSize.height) / 2));
  }

  @override
  bool shouldRelayout(_IdeaDelegate oldDelegate) =>
      this.spacing != oldDelegate.spacing;
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: '动画启动',
        onPressed: () {
          _controller.reset();
          _controller.forward();
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedWidget';
  }

  @override
  Widget getWidget() {
    return IdeaWidget(
      leftWidget: setting.leftWidget?.value,
      rightWidget: setting.rightWidget?.value,
      spacing: setting.spacing?.value,
      spaceFactor: setting.spaceFactor?.value,
    );
  }
}

class AnimatedWidgetSetting {
  final Value<Widget> leftWidget;
  final Value<Widget> rightWidget;
  final Value<double> spacing;
  final Value<Animation<double>> spaceFactor;

  AnimatedWidgetSetting({
    this.spacing,
    @required this.leftWidget,
    @required this.rightWidget,
    this.spaceFactor,
  });

  AnimatedWidgetSetting copyWith({
    Value<Widget> leftWidget,
    Value<Widget> rightWidget,
    Value<double> spacing,
    Value<Animation<double>> spaceFactor,
  }) {
    return AnimatedWidgetSetting(
      leftWidget: leftWidget ?? this.leftWidget,
      rightWidget: rightWidget ?? this.rightWidget,
      spacing: spacing ?? this.spacing,
    );
  }
}

class IdeaWidget extends AnimatedWidget {
  final Widget leftWidget;
  final Widget rightWidget;
  final double spacing;

  const IdeaWidget({
    Key key,
    this.spacing,
    @required this.leftWidget,
    @required this.rightWidget,
    @required Animation<double> spaceFactor,
  }) : super(key: key, listenable: spaceFactor);

  Animation<double> get spaceFactor => listenable;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _IdeaDelegate(spacing -  spacing * spaceFactor.value),
      children: <Widget>[
        LayoutId(id: _IdeaId.left, child: leftWidget),
        LayoutId(id: _IdeaId.right, child: rightWidget),
      ],
    );
  }
}

enum _IdeaId {
  left,
  right,
}

class _IdeaDelegate extends MultiChildLayoutDelegate {
  final double spacing;

  _IdeaDelegate(this.spacing);

  @override
  void performLayout(Size size) {
    final BoxConstraints box = BoxConstraints.loose(size);
    Size leftSize;
    Size rightSize;
    leftSize = layoutChild(_IdeaId.left, box);
    rightSize = layoutChild(_IdeaId.right, box);


    positionChild(
        _IdeaId.left,
        Offset((size.width / 2) - leftSize.width -spacing,
            (size.height - leftSize.height) / 2));

    positionChild(
        _IdeaId.right,
        Offset((size.width / 2 )+spacing,
            (size.height - rightSize.height) / 2));
  }

  @override
  bool shouldRelayout(_IdeaDelegate oldDelegate) =>
      this.spacing != oldDelegate.spacing;
}
