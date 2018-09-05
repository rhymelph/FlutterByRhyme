import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListBodyDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/ListBody';
  final String detail = '''A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.
This widget is rarely used directly. Instead, consider using ListView, which combines a similar layout algorithm with scrolling behavior, or Column, which gives you more flexible control over the layout of a vertical set of boxes.
See also:
RenderListBody, which implements this layout algorithm and the documentation for which describes some of its subtleties.
SingleChildScrollView, which is sometimes used with ListBody to make the contents scrollable.
Column and Row, which implement a more elaborate version of this layout algorithm (at the cost of being slightly less efficient).
ListView, which implements an efficient scrolling version of this layout algorithm.''';

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
