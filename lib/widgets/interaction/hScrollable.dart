import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ScrollableDemo extends StatefulWidget {
  static const String routeName = 'widgets/interaction/Scrollable';
  final String detail = '''滚动的小部件。

Scrollable实现可滚动窗口小部件的交互模型，包括手势识别，但没有关于如何构造实际显示子窗口的视口的意见。

很难直接构造Scrollable。相反，请考虑ListView 或GridView，它们结合了滚动，视口和布局模型。要组合布局模型（或使用自定义布局模式），请考虑使用 CustomScrollView。

静态Scrollable.of和Scrollable.ensureVisible函数通常用于与ListView或GridView中的Scrollable小部件进行交互。

要使用Scrollable进一步自定义滚动行为：

您可以提供viewportBuilder来自定义子模型。例如，SingleChildScrollView使用一个显示单个盒子项的视口，而CustomScrollView使用一个Viewport或一个 ShrinkWrappingViewport，它们都显示一个条子列表。

您可以提供自定义ScrollController，以创建自定义 ScrollPosition子类。例如，PageView使用 PageController，它创建一个面向页面的滚动位置子类，在Scrollable调整大小时保持同一页面可见''';

  @override
  _ScrollableDemoState createState() => _ScrollableDemoState();
}

class _ScrollableDemoState extends ExampleState<ScrollableDemo> {
  ScrollableSetting setting;
  ScrollController _controller;

  @override
  void initState() {
    _controller = new ScrollController();

    setting = ScrollableSetting(
      axisDirection: axisDirectionValues[0],
      controller: Value(
        value: _controller,
        label: '_controller',
      ),
      physics: physicsValues[0],
      viewportBuilder: Value(
        value: (BuildContext context, ViewportOffset position) {
          position.addListener((){
            print('${position.pixels}');
          });
          return Viewport(offset: position,cacheExtent: 0.0,
          slivers: <Widget>[
            SliverFillViewport(delegate: SliverChildListDelegate([
              Image.asset('images/burgers.jpg'),
              Image.asset('images/pazzer.jpg'),
            ])),
          ],);
        },
        label: '',
      ),
      excludeFromSemantics: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Scrollable(
      axisDirection: ${setting.axisDirection?.label ?? ''},
      controller: ${setting.controller?.label ?? ''},
      physics: ${setting.physics?.label ?? ''},
      viewportBuilder: ${setting.viewportBuilder?.label ?? ''},
      excludeFromSemantics: ${setting.excludeFromSemantics?.label ?? ''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAxisDirection),
      RadioGroupWidget(
        setting.axisDirection,
        axisDirectionValues,
        (value) {
          setState(() {
            setting = setting.copyWith(axisDirection: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kPhysics),
      RadioGroupWidget(
        setting.physics,
        physicsValues,
            (value) {
          setState(() {
            setting = setting.copyWith(physics: value);
          });
        },
      ),
      SwitchValueTitleWidget(title: StringParams.kExcludeFromSemantics, value: setting.excludeFromSemantics, onChanged: (value){
        setState(() {
          setting=setting.copyWith(excludeFromSemantics: value);
        });
      })
    ];
  }

  @override
  String getTitle() {
    return 'Scrollable';
  }

  @override
  Widget getWidget() {
    return Scrollable(
      axisDirection: setting.axisDirection?.value,
      controller: setting.controller?.value,
      physics: setting.physics?.value,
      viewportBuilder: setting.viewportBuilder?.value,
      excludeFromSemantics: setting.excludeFromSemantics?.value,
    );
  }
}

class ScrollableSetting {
  final Value<AxisDirection> axisDirection;
  final Value<ScrollController> controller;
  final Value<ScrollPhysics> physics;
  final Value<ViewportBuilder> viewportBuilder;
  final Value<bool> excludeFromSemantics;

  ScrollableSetting({
    this.axisDirection,
    this.controller,
    this.physics,
    this.viewportBuilder,
    this.excludeFromSemantics,
  });

  ScrollableSetting copyWith({
    Value<AxisDirection> axisDirection,
    Value<ScrollController> controller,
    Value<ScrollPhysics> physics,
    Value<ViewportBuilder> viewportBuilder,
    Value<bool> excludeFromSemantics,
  }) {
    return ScrollableSetting(
      axisDirection: axisDirection ?? this.axisDirection,
      controller: controller ?? this.controller,
      physics: physics ?? this.physics,
      viewportBuilder: viewportBuilder ?? this.viewportBuilder,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
    );
  }
}
