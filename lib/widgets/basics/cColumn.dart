import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ColumnDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Column';
  final String detail =
      '''A widget that displays its children in a vertical array.
To cause a child to expand to fill the available vertical space, wrap the child in an Expanded widget.
The Column widget does not scroll (and in general it is considered an error to have more children in a Column than will fit in the available room). If you have a line of widgets and want them to be able to scroll if there is insufficient room, consider using a ListView.
For a horizontal variant, see Row.
If you only have one child, then consider using Align or Center to position the child.''';

  @override
  _ColumnDemoState createState() => _ColumnDemoState();
}

class _ColumnDemoState extends ExampleState<ColumnDemo> {
  ColumnSetting setting;

  Value<MainAxisAlignment> _firstMainAxisAlignment;
  Value<MainAxisSize> _firstMainAxisSize;
  Value<CrossAxisAlignment> _firstCrossAxisAlignment;
  Value<TextDirection> _firstTextDirection;
  Value<VerticalDirection> _firstVerticalDirection;
  Value<TextBaseline> _firstTextBaseline;

  void _showSyncSelectTip() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            'Use CrossAxisAlignment.baseline should select one textBaseline item!\n使用CrossAxisAlignment.baseline这个属性需要先选择textBaseline属性')));
  }

  @override
  void initState() {
    // TODO: implement initState
    setting = ColumnSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Column(
      mainAxisAlignment: ${_firstMainAxisAlignment?.value??''},
      mainAxisSize: ${_firstMainAxisSize?.value??''},
      crossAxisAlignment: ${_firstCrossAxisAlignment?.value??''},
      textDirection: ${_firstTextDirection?.value??''},
      verticalDirection: ${_firstVerticalDirection?.value??''},
      textBaseline: ${_firstTextBaseline?.value??''},
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 40.0,
            height: 40.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('text文本'),
        ),
      ],
    )''';
  }

  @override
  List<Widget> getSetting() {
    return <Widget>[
      ValueTitleWidget('mainAxisAlignment(主轴对齐)'),
      RadioGroupWidget(_firstMainAxisAlignment, mainAxisAlignmentValues,
          (value) {
        setState(() {
          _firstMainAxisAlignment = value;
          setting = setting.copyWith(mainAxisAlignment: value.value);
        });
      }),
      ValueTitleWidget('mainAxisSize(主轴尺寸)'),
      RadioGroupWidget(_firstMainAxisSize, mainAxisSizeValues, (value) {
        setState(() {
          _firstMainAxisSize = value;
          setting = setting.copyWith(mainAxisSize: value.value);
        });
      }),
      ValueTitleWidget('crossAxisAlignment(横轴对齐)'),
      RadioGroupWidget(_firstCrossAxisAlignment, crossAxisAlignmentValues,
          (value) {
        if (value.value == CrossAxisAlignment.baseline &&
            setting.textBaseline == null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            _firstCrossAxisAlignment = value;
            setting = setting.copyWith(crossAxisAlignment: value.value);
          });
        }
      }),
      ValueTitleWidget('textDirection(文本方向)'),
      RadioGroupWidget(_firstTextDirection, textDirectionValues, (value) {
        setState(() {
          _firstTextDirection = value;
          setting = setting.copyWith(textDirection: value.value);
        });
      }),
      ValueTitleWidget('verticalDirection(垂直方向)'),
      RadioGroupWidget(_firstVerticalDirection, verticalDirectionValues,
          (value) {
        setState(() {
          _firstVerticalDirection = value;
          setting = setting.copyWith(verticalDirection: value.value);
        });
      }),
      ValueTitleWidget('textBaseline(文本基线)'),
      RadioGroupWidget(_firstTextBaseline, TextBaselineValues, (value) {
        setState(() {
          _firstTextBaseline = value;
          setting = setting.copyWith(textBaseline: value.value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'Column';
  }
  @override
  Widget getWidget() {
    return Column(
      mainAxisAlignment: setting.mainAxisAlignment,
      mainAxisSize: setting.mainAxisSize,
      crossAxisAlignment: setting.crossAxisAlignment,
      textDirection: setting.textDirection,
      verticalDirection: setting.verticalDirection,
      textBaseline: setting.textBaseline,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 40.0,
            height: 40.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('text文本'),
        ),
      ],
    );
  }
}
class ColumnSetting {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;

  ColumnSetting({
    this.mainAxisAlignment: MainAxisAlignment.center,
    this.mainAxisSize: MainAxisSize.min,
    this.crossAxisAlignment: CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection: VerticalDirection.down,
    this.textBaseline,
  });

  ColumnSetting copyWith({
    MainAxisAlignment mainAxisAlignment,
    MainAxisSize mainAxisSize,
    CrossAxisAlignment crossAxisAlignment,
    TextDirection textDirection,
    VerticalDirection verticalDirection,
    TextBaseline textBaseline,
  }) {
    return new ColumnSetting(
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      textDirection: textDirection ?? this.textDirection,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      textBaseline: textBaseline ?? this.textBaseline,
    );
  }
}
