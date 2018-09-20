import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListBodyDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/ListBody';
  final String detail = '''一个小部件，它沿着给定的轴顺序排列它的子节点，强制它们到另一个轴的父节点的维度。

这个小部件很少直接使用。相反，可以考虑使用ListView，它将类似的布局算法与滚动行为相结合，或者使用 Column，它可以更灵活地控制垂直方框的布局。''';

  @override
  _ListBodyDemoState createState() => _ListBodyDemoState();
}

class _ListBodyDemoState extends ExampleState<ListBodyDemo> {
  ListBodySetting setting;

  @override
  void initState() {
    setting = ListBodySetting(
      mainAxis: axisValues[1],
      reverse: boolValues[0],
      children: Value(
        value: <Widget>[
          Text('I'),
          Text('❤'),
          Text('Love'),
          Text('❤'),
          Text('Flutter'),
          Text('❤'),
          Text('And'),
          Text('❤'),
          Text('Dart'),
        ],
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
    return '''SingleChildScrollView(
      scrollDirection: ${setting.mainAxis?.label??''},
      child: ListBody(
        mainAxis: ${setting.mainAxis?.label??''},
        reverse: ${setting.reverse?.label??''},
        children: ${setting.children?.label??''},
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kMainAxis),
      RadioGroupWidget(setting.mainAxis, axisValues, (value) {
        setState(() {
          setting = setting.copyWith(mainAxis: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kReverse, value: setting.reverse, onChanged: (value){
        setState(() {
          setting = setting.copyWith(reverse: value);
        });
      }),

    ];
  }

  @override
  String getTitle() {
    return 'ListBody';
  }

  @override
  Widget getWidget() {
    return SingleChildScrollView(
      scrollDirection: setting.mainAxis?.value,
      child: ListBody(
        mainAxis: setting.mainAxis?.value,
        reverse: setting.reverse?.value,
        children: setting.children?.value,
      ),
    );
  }
}

class ListBodySetting {
  final Value<Axis> mainAxis;
  final Value<bool> reverse;
  final Value<List<Widget>> children;

  ListBodySetting({
    this.mainAxis,
    this.reverse,
    this.children,
  });

  ListBodySetting copyWith({
    Value<Axis> mainAxis,
    Value<bool> reverse,
    Value<List<Widget>> children,
  }) {
    return ListBodySetting(
      mainAxis: mainAxis ?? this.mainAxis,
      reverse: reverse ?? this.reverse,
      children: children ?? this.children,
    );
  }
}
