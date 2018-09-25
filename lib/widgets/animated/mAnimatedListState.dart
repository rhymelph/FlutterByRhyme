import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AnimatedListStateDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AnimatedListState';
  final String detail = '''滚动容器的状态，在插入或移除项目时为其设置动画。

使用insertItem插入项目时，动画开始运行。只要需要项目的小部件，动画就会传递给AnimatedList.itemBuilder。

使用removeItem删除项目时，其动画将反转。已删除项目的动画将传递给removeItem构建器参数。

需要插入或删除项目以响应事件的应用程序可以使用全局键来引用AnimatedList的状态：

''';

  @override
  _AnimatedListStateDemoState createState() => _AnimatedListStateDemoState();
}

class _AnimatedListStateDemoState extends ExampleState<AnimatedListStateDemo> {
  AnimatedListStateSetting setting;
  GlobalKey<AnimatedListState> _key = new GlobalKey();

  List<String> items = [
    "Flutter",
    "Dart",
    "Android",
    "IOS",
  ];

  @override
  void initState() {
    setting = AnimatedListStateSetting(
      initialItemCount: Value(
        value: items.length,
      ),
      itemBuilder: Value(
        value: (BuildContext context, int position, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SizedBox(
              width: 60.0,
              height: 30.0,
              child: Center(child: Text(items[position])),
            ),
          );
        },
        label: '''(BuildContext context, int position, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SizedBox(
              width: 60.0,
              height: 30.0,
              child: Center(child: Text(items[position])),
            ),
          );
        }''',
      ),
      reverse: boolValues[0],
      shrinkWrap: boolValues[0],
      scrollDirection: axisValues[1],
      primary: boolValues[0],
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''//等于AnimatedList.of(context)
GlobalKey<AnimatedListState> _key = new GlobalKey();

List<String> items = [
    "Flutter",
    "Dart",
    "Android",
    "IOS",
  ];
  
AnimatedList(
      key: _key,
      itemBuilder: ${setting.itemBuilder?.label??''},
      initialItemCount: ${setting.initialItemCount?.label??''},
      scrollDirection: ${setting.scrollDirection?.label??''},
      reverse: ${setting.reverse?.label??''},
      controller: ${setting.controller?.label??''},
      primary: ${setting.primary?.label??''},
      physics: ${setting.physics?.label??''},
      shrinkWrap: ${setting.shrinkWrap?.label??''},
      padding: ${setting.padding?.label??''},
    )
//插入一项
items.insert(0, 'Hello World!');
_key.currentState.insertItem(0, duration: Duration(seconds: 1));
//移除一项
items.removeAt(0);
 _key.currentState.removeItem(
      0,
      (BuildContext context, Animation<double> animation) => FadeTransition(
         opacity: animation,
         child: Center(child: Text('删除')),
      ),
      duration: Duration(seconds: 1));''';
  }

  @override
  List<Widget> getSetting() {

    return [
      ValueTitleButtonWidget(
        title: '插入一条数据',
        onPressed: () {
          items.insert(0, 'Hello World!');
          _key.currentState.insertItem(0, duration: Duration(seconds: 1));
        },
      ),
      ValueTitleButtonWidget(
        title: '删除一条数据',
        onPressed: () {
          items.removeAt(0);
          _key.currentState.removeItem(
              0,
              (BuildContext context, Animation<double> animation) => FadeTransition(
                    opacity: animation,
                    child: Center(child: Text('删除')),
                  ),
              duration: Duration(seconds: 1));
        },
      ),
      ValueTitleWidget(StringParams.kScrollDirection),
      RadioGroupWidget(setting.scrollDirection, axisValues, (value) {
        setState(() {
          setting = setting.copyWith(scrollDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      SwitchValueTitleWidget(
          title: StringParams.kReverse,
          value: setting.reverse,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(reverse: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kShrinkWrap,
          value: setting.shrinkWrap,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(shrinkWrap: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kPrimary,
          value: setting.primary,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(primary: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'AnimatedListState';
  }

  @override
  Widget getWidget() {
    return AnimatedList(
      key: _key,
      itemBuilder: setting.itemBuilder?.value,
      initialItemCount: setting.initialItemCount?.value,
      scrollDirection: setting.scrollDirection?.value,
      reverse: setting.reverse?.value,
      controller: setting.controller?.value,
      primary: setting.primary?.value,
      physics: setting.physics?.value,
      shrinkWrap: setting.shrinkWrap?.value,
      padding: setting.padding?.value,
    );
  }
}

class AnimatedListStateSetting {
  final Value<AnimatedListItemBuilder> itemBuilder;
  final Value<int> initialItemCount;
  final Value<Axis> scrollDirection;
  final Value<bool> reverse;
  final Value<ScrollController> controller;
  final Value<bool> primary;
  final Value<ScrollPhysics> physics;
  final Value<EdgeInsetsGeometry> padding;
  final Value<bool> shrinkWrap;

  AnimatedListStateSetting({
    this.itemBuilder,
    this.initialItemCount,
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
  });

  AnimatedListStateSetting copyWith({
    Value<AnimatedListItemBuilder> itemBuilder,
    Value<int> initialItemCount,
    Value<Axis> scrollDirection,
    Value<bool> reverse,
    Value<ScrollController> controller,
    Value<bool> primary,
    Value<ScrollPhysics> physics,
    Value<EdgeInsetsGeometry> padding,
    Value<bool> shrinkWrap,
  }) {
    return AnimatedListStateSetting(
      itemBuilder: itemBuilder ?? this.itemBuilder,
      initialItemCount: initialItemCount ?? this.initialItemCount,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      controller: controller ?? this.controller,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      padding: padding ?? this.padding,
    );
  }
}
