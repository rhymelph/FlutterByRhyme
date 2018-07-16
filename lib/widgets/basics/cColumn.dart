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


  void _showSyncSelectTip() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            'Use CrossAxisAlignment.baseline should select one textBaseline item!\n使用CrossAxisAlignment.baseline这个属性需要先选择textBaseline属性')));
  }

  @override
  void initState() {
    // TODO: implement initState
    setting = ColumnSetting(
      mainAxisAlignment: mainAxisAlignmentValues[0],
      mainAxisSize: mainAxisSizeValues[0],
      crossAxisAlignment: crossAxisAlignmentValues[0],
      verticalDirection: verticalDirectionValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Column(
      mainAxisAlignment: ${setting.mainAxisAlignment?.value??''},
      mainAxisSize: ${setting.mainAxisSize?.value??''},
      crossAxisAlignment: ${setting.crossAxisAlignment?.value??''},
      textDirection: ${setting.textDirection?.value??''},
      verticalDirection: ${setting.verticalDirection?.value??''},
      textBaseline: ${setting.textBaseline?.value??''},
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
      ValueTitleWidget(StringParams.kMainAxisAlignment),
      RadioGroupWidget(setting.mainAxisAlignment, mainAxisAlignmentValues,
          (value) {
        setState(() {
          setting = setting.copyWith(mainAxisAlignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kMainAxisSize),
      RadioGroupWidget(setting.mainAxisSize, mainAxisSizeValues, (value) {
        setState(() {
          setting = setting.copyWith(mainAxisSize: value);
        });
      }),
      ValueTitleWidget(StringParams.kCrossAxisAlignment),
      RadioGroupWidget(setting.crossAxisAlignment, crossAxisAlignmentValues,
          (value) {
        if (value.value == CrossAxisAlignment.baseline &&
            setting.textBaseline == null) {
          _showSyncSelectTip();
        } else {
          setState(() {
            setting = setting.copyWith(crossAxisAlignment: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value) {
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kVerticalDirection),
      RadioGroupWidget(setting.verticalDirection, verticalDirectionValues,
          (value) {
        setState(() {
          setting = setting.copyWith(verticalDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextBaseline),
      RadioGroupWidget(setting.textBaseline, TextBaselineValues, (value) {
        setState(() {
          setting = setting.copyWith(textBaseline: value);
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
      mainAxisAlignment: setting.mainAxisAlignment?.value,
      mainAxisSize: setting.mainAxisSize?.value,
      crossAxisAlignment: setting.crossAxisAlignment?.value,
      textDirection: setting.textDirection?.value,
      verticalDirection: setting.verticalDirection?.value,
      textBaseline: setting.textBaseline?.value,
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
  final Value<MainAxisAlignment> mainAxisAlignment;
  final Value<MainAxisSize> mainAxisSize;
  final Value<CrossAxisAlignment> crossAxisAlignment;
  final Value<TextDirection> textDirection;
  final Value<VerticalDirection> verticalDirection;
  final Value<TextBaseline> textBaseline;
  ColumnSetting({
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  ColumnSetting copyWith({
    Value<MainAxisAlignment> mainAxisAlignment,
    Value<MainAxisSize> mainAxisSize,
    Value<CrossAxisAlignment> crossAxisAlignment,
    Value<TextDirection> textDirection,
    Value<VerticalDirection> verticalDirection,
    Value<TextBaseline> textBaseline,
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
