import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IndexedStackDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/IndexedStack';
  final String detail = '''一个堆栈，显示来自子项列表的单个子项。

显示的子项是具有给定索引的子项。堆栈总是和最大的孩子一样大。

如果value为null，则不显示任何内容。''';

  @override
  _IndexedStackDemoState createState() => _IndexedStackDemoState();
}

class _IndexedStackDemoState extends ExampleState<IndexedStackDemo> {
  IndexedStackSetting setting;

  @override
  void initState() {
    setting = IndexedStackSetting(
      index: intMini2Values[0],
      alignment: alignmentValues[0],
      sizing: stackFitValues[0],
      children: Value(
        value: <Widget>[
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.pink),
            ),
          ),
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          SizedBox(
            width: 40.0,
            height: 40.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          SizedBox(
            width: 30.0,
            height: 30.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          Text('text文本'),
        ],
        label: '''<Widget>[
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.pink),
            ),
          ),
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          SizedBox(
            width: 40.0,
            height: 40.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
          SizedBox(
            width: 30.0,
            height: 30.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          Text('text文本'),
        ]''',
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
    return '''IndexedStack(
      alignment: ${setting.alignment?.label??''},
      textDirection: ${setting.textDirection?.label??''},
      sizing: ${setting.sizing?.label??''},
      children: ${setting.children?.label??''},
      index: ${setting.index?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kSizing),
      RadioGroupWidget(setting.sizing, stackFitValues, (value) {
        setState(() {
          setting = setting.copyWith(sizing: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      DropDownValueTitleWidget(selectList: intMini2Values, title: StringParams.kIndex, value: setting.index,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(index: value);
        });
      },)
    ];
  }

  @override
  String getTitle() {
    return 'IndexedStack';
  }

  @override
  Widget getWidget() {
    return IndexedStack(
      alignment: setting.alignment?.value,
      textDirection: setting.textDirection?.value,
      sizing: setting.sizing?.value,
      children: setting.children?.value,
      index: setting.index?.value,
    );
  }
}

class IndexedStackSetting {
  final Value<AlignmentGeometry> alignment;
  final Value<TextDirection> textDirection;
  final Value<StackFit> sizing;
  final Value<List<Widget>> children;
  final Value<int> index;

  IndexedStackSetting({
    this.alignment,
    this.textDirection,
    this.sizing,
    this.children,
    this.index,
  });

  IndexedStackSetting copyWith(
      {Value<AlignmentGeometry> alignment,
      Value<TextDirection> textDirection,
      Value<StackFit> sizing,
      Value<List<Widget>> children,
      Value<int> index}) {
    return IndexedStackSetting(
      alignment: alignment ?? this.alignment,
      textDirection: textDirection ?? this.textDirection,
      sizing: sizing ?? this.sizing,
      children: children ?? this.children,
      index: index ?? this.index,
    );
  }
}
