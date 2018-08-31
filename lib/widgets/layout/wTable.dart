import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

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
    setting = TableSetting();
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
    return [];
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
