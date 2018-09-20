import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class RowDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Row';
  final String detail =
      '''一个小部件，用于在水平数组中显示其子项。

要使子项扩展以填充可用的水平空间，请将子项包装在Expanded小部件中。

“ 行”窗口小部件不会滚动（并且通常将行中的子项多于可用空间中的子项被视为错误）。如果您有一系列小部件并希望它们能够在没有足够空间的情况下滚动，请考虑使用ListView。

有关垂直变体，请参见列。

如果您只有一个孩子，请考虑使用Align或Center来定位孩子.''';

  @override
  _RowDemoState createState() => _RowDemoState();
}

class _RowDemoState extends ExampleState<RowDemo> {
  RowSetting setting;

  void _showSyncSelectTip() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Use CrossAxisAlignment.baseline should select one textBaseline item!\n使用CrossAxisAlignment.baseline这个属性需要先选择textBaseline属性')));
  }

  @override
  void initState() {
    // TODO: implement initState
    setting = RowSetting(
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
    return '''Row(
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
      RadioGroupWidget(setting.mainAxisAlignment, mainAxisAlignmentValues, (value){
        setState(() {
          setting=setting.copyWith(mainAxisAlignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kMainAxisSize),
      RadioGroupWidget(setting.mainAxisSize, mainAxisSizeValues, (value){
        setState(() {
          setting=setting.copyWith(mainAxisSize: value);
        });
      }),
      ValueTitleWidget(StringParams.kCrossAxisAlignment),
      RadioGroupWidget(setting.crossAxisAlignment, crossAxisAlignmentValues, (value){
        if(value.value==CrossAxisAlignment.baseline&&setting.textBaseline==null){
          _showSyncSelectTip();
        }else{
          setState(() {
            setting=setting.copyWith(crossAxisAlignment: value);
          });
        }
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value){
        setState(() {
          setting=setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kVerticalDirection),
      RadioGroupWidget(setting.verticalDirection, verticalDirectionValues, (value){
        setState(() {
          setting=setting.copyWith(verticalDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextBaseline),
      RadioGroupWidget(setting.textBaseline, TextBaselineValues, (value){
        setState(() {
          setting=setting.copyWith(textBaseline: value);
        });
      }),
    ];
  }


  @override
  String getTitle() {
    return 'Row';
  }

  @override
  Widget getWidget() {
    return Row(
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

class RowSetting {
  final Value<MainAxisAlignment> mainAxisAlignment;
  final Value<MainAxisSize> mainAxisSize;
  final Value<CrossAxisAlignment> crossAxisAlignment;
  final Value<TextDirection> textDirection;
  final Value<VerticalDirection> verticalDirection;
  final Value<TextBaseline> textBaseline;
  RowSetting({
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  RowSetting copyWith({
    Value<MainAxisAlignment> mainAxisAlignment,
    Value<MainAxisSize> mainAxisSize,
    Value<CrossAxisAlignment> crossAxisAlignment,
    Value<TextDirection> textDirection,
    Value<VerticalDirection> verticalDirection,
    Value<TextBaseline> textBaseline,
  }) {
    return new RowSetting(
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      textDirection: textDirection ?? this.textDirection,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      textBaseline: textBaseline ?? this.textBaseline,
    );
  }
}
