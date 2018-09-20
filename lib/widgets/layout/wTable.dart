import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:math';
class TableDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Table';
  final String detail = '''为其子项使用表布局算法的窗口小部件。

如果您只有一行，则Row小部件更合适。如果您只有一列，则SliverList或Column小部件将更合适。

行的大小根据其内容垂直排列。要控制列宽，请使用columnWidths属性。

有关表格布局算法的更多详细信息，请参阅RenderTable。要控制子对齐，请参阅TableCell。''';

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
      defaultColumnWidth: tableColumnWidthValues[0],
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
        ],
        label: '''<TableRow>[
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
        ]''',
      )
    );
    setting=setting.copyWith(child: _formatValue());

    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return setting.child?.label??'';
  }

  Value<Widget> _formatValue(){
    return Value(
      value: _formatWidget(),
      label: _formatLabel(),
    );
  }

  Widget _formatWidget(){
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


  String _formatLabel(){
    return '''Table(
      children: ${setting.children?.label??''},
      columnWidths: ${setting.columnWidths?.label??''},
      defaultColumnWidth: ${setting.defaultColumnWidth?.label??''},
      textDirection: ${setting.textDirection?.label??''},
      border: ${setting.border?.label??''},
      defaultVerticalAlignment: ${setting.defaultVerticalAlignment?.label??''},
      textBaseline: ${setting.textBaseline?.label??''},
    )
//自定义实现栏宽
class ColumnWidth extends TableColumnWidth{
  @override//最大的宽度,cell子项的大小，containerWidget父项宽度
  double maxIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double maxWidth=containerWidth/3;
    for(RenderBox box in lists){
      if(box.hasSize){
        maxWidth=max(maxWidth, box.size.width);
      }
    }
    maxWidth=min(containerWidth, maxWidth);
    return maxWidth;
  }

  @override//最小的宽度
  double minIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double minWidth=containerWidth/4;
    for(RenderBox box in lists){
      if(box.hasSize){
        minWidth=max(minWidth, box.size.width);
      }
    }
    return minWidth;
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDefaultColumnWidth),
      RadioGroupWidget(setting.defaultColumnWidth, tableColumnWidthValues, (value){
        setting=setting.copyWith(defaultColumnWidth: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget(setting.textDirection, textDirectionValues, (value){
        setting=setting.copyWith(textDirection: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
      ValueTitleWidget(StringParams.kBorder),
      RadioGroupWidget(setting.border, tableBorderValues, (value){
        setting=setting.copyWith(border: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());

        });
      }),
      ValueTitleWidget(StringParams.kDefaultVerticalAlignment),
      RadioGroupWidget(setting.defaultVerticalAlignment, tableCellVerticalAlignmentValues, (value){
        if(value.value==TableCellVerticalAlignment.baseline&&setting.textBaseline==null){
          exampleKey.currentState.showToast('请先选择textBaseline属性才能使用该值');
          return;
        }
        setting=setting.copyWith(defaultVerticalAlignment: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
      ValueTitleWidget(StringParams.kTextBaseline),
      RadioGroupWidget(setting.textBaseline, TextBaselineValues, (value){
        setting=setting.copyWith(textBaseline: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
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
    return setting.child?.value;
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
  final Value<Widget> child;

  TableSetting({
    this.children ,
    this.columnWidths,
    this.defaultColumnWidth,
    this.textDirection,
    this.border,
    this.defaultVerticalAlignment,
    this.textBaseline,
    this.child
  });
  TableSetting copyWith({
    Value<List<TableRow>> children,
    Value<Map<int, TableColumnWidth>> columnWidths,
    Value<TableColumnWidth> defaultColumnWidth,
    Value<TextDirection> textDirection,
    Value<TableBorder> border,
    Value<TableCellVerticalAlignment> defaultVerticalAlignment,
    Value<TextBaseline > textBaseline,
    Value<Widget> child,
  }) {
    return TableSetting(
      children: children??this.children,
      columnWidths: columnWidths??this.columnWidths,
      defaultColumnWidth: defaultColumnWidth??this.defaultColumnWidth,
      textDirection: textDirection??this.textDirection,
      border: border??this.border,
      defaultVerticalAlignment: defaultVerticalAlignment??this.defaultVerticalAlignment,
      textBaseline: textBaseline??this.textBaseline,
      child: child??this.child,
    );
  }
}

class ColumnWidth extends TableColumnWidth{
  @override//最大的宽度,cell子项的大小，containerWidget父项宽度
  double maxIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double maxWidth=containerWidth/3;
    for(RenderBox box in lists){
      if(box.hasSize){
        maxWidth=max(maxWidth, box.size.width);
      }
    }
    maxWidth=min(containerWidth, maxWidth);
    return maxWidth;
  }

  @override//最小的宽度
  double minIntrinsicWidth(Iterable<RenderBox> cells, double containerWidth) {
    List<RenderBox> lists=cells.toList();
    double minWidth=containerWidth/4;
    for(RenderBox box in lists){
      if(box.hasSize){
        minWidth=max(minWidth, box.size.width);
      }
    }
    return minWidth;
  }
}