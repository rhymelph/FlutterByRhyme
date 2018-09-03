import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:math';
class TableDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Table';
  final String detail = '''''';

  @override
  _TableDemoState createState() =>
      _TableDemoState();
}

class _TableDemoState
    extends ExampleState<TableDemo> {
  TableSetting setting;

  @override
  void initState() {
    setting = TableSetting(

      defaultColumnWidth: Value(
        value: ColumnWidth(),
      ),
      defaultVerticalAlignment: tableCellVerticalAlignmentValues[0],
      children: Value(
        value: <TableRow>[
          TableRow(
            children: <Widget>[
              Text('第一行1'),
              Text('第一行2'),
              Text('第一行3'),
              Text('第一行4'),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            children: <Widget>[
              Text('第二行1'),
              Text('第二行2'),
              Text('第二行3'),
              Text('第二行4'),
            ],
          ),
          TableRow(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            children: <Widget>[
              Text('第三行1'),
              Text('第三行2'),
              Text('第三行3'),
              Text('第三行4'),
            ],
          )
        ]
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
    return '''Table(
      children: ${setting.children?.label??''},
      columnWidths: ${setting.columnWidths?.label??''},
      defaultColumnWidth: ${setting.defaultColumnWidth?.label??''},
      textDirection: ${setting.textDirection?.label??''},
      border: ${setting.border?.label??''},
      defaultVerticalAlignment: ${setting.defaultVerticalAlignment?.label??''},
      textBaseline: ${setting.textBaseline?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value){
        setState(() {
          setting=setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kBorder),
      RadioGroupWidget(setting.border, tableBorderValues, (value){
        setState(() {
          setting=setting.copyWith(border: value);
        });
      }),
      ValueTitleWidget(StringParams.kDefaultVerticalAlignment),
      RadioGroupWidget(setting.border, tableBorderValues, (value){
        setState(() {
          setting=setting.copyWith(border: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'Table';
  }


  @override
  Widget getWidget() {
    return Table(
      children: setting.children?.value,
      columnWidths: setting.columnWidths?.value,
      defaultColumnWidth: setting.defaultColumnWidth?.value,
      textDirection: setting.textDirection?.value,
      border: setting.border?.value,
      defaultVerticalAlignment: setting.defaultVerticalAlignment?.value,
      textBaseline: setting.textBaseline?.value,
    );
  }
}

class TableSetting {
  final Value<List<TableRow>> children;
  final Value<Map<int, TableColumnWidth>> columnWidths;
  final Value<TableColumnWidth> defaultColumnWidth;
  final Value<TextDirection> textDirection;
  final Value<TableBorder> border;
  final Value<TableCellVerticalAlignment> defaultVerticalAlignment;
  final Value<TextBaseline > textBaseline;

  TableSetting({
    this.children ,
    this.columnWidths,
    this.defaultColumnWidth,
    this.textDirection,
    this.border,
    this.defaultVerticalAlignment,
    this.textBaseline,
  });
  TableSetting copyWith({
    Value<List<TableRow>> children,
    Value<Map<int, TableColumnWidth>> columnWidths,
    Value<TableColumnWidth> defaultColumnWidth,
    Value<TextDirection> textDirection,
    Value<TableBorder> border,
    Value<TableCellVerticalAlignment> defaultVerticalAlignment,
    Value<TextBaseline > textBaseline,
  }) {
    return TableSetting(
      children: children??this.children,
      columnWidths: columnWidths??this.columnWidths,
      defaultColumnWidth: defaultColumnWidth??this.defaultColumnWidth,
      textDirection: textDirection??this.textDirection,
      border: border??this.border,
      defaultVerticalAlignment: defaultVerticalAlignment??this.defaultVerticalAlignment,
      textBaseline: textBaseline??this.textBaseline,
    );
  }
}

class ColumnWidth extends TableColumnWidth{
  @override//最大的宽度,cell子项的大小，containerWidget父项宽度
  double maxIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double maxWidth=containerWidth/(lists.length*2);
    print("max:${lists.length}\ncontainerWidget:$containerWidth");
    for(RenderBox box in lists){
      if(box.hasSize){
        print('${box.size}');
        maxWidth=max(maxWidth, box.size.width);
      }
    }
    maxWidth=min(containerWidth, maxWidth);
    return maxWidth;
  }

  @override//最小的宽度
  double minIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double minWidth=containerWidth/(lists.length*2);
    print("min:${lists.length}\ncontainerWidget:$containerWidth");
    for(RenderBox box in lists){
      if(box.hasSize){
        print('${box.size}');
        minWidth=max(minWidth, box.size.width);
      }
    }
    return minWidth;
  }
}