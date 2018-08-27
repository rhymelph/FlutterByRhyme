import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CenterDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/Center';
  final String detail = '''A widget that centers its child within itself.
This widget will be as big as possible if its dimensions are constrained and widthFactor and heightFactor are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.
See also:
Align, which lets you arbitrarily position a child within itself, rather than just centering it.
Row, a widget that displays its children in a horizontal array.
Column, a widget that displays its children in a vertical array.
Container, a convenience widget that combines common painting, positioning, and sizing widgets.
The catalog of layout widgets.''';

  @override
  _CenterDemoState createState() => _CenterDemoState();
}

class _CenterDemoState extends ExampleState<CenterDemo> {
  CenterSetting setting;

  @override
  void initState() {
    setting = CenterSetting(
      widthFactor: doubleOneValues[0],
      heightFactor: doubleOneValues[0],
      child:  Value(
        value: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        ),
        label: '''SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        )''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Center(
      widthFactor: ${setting.widthFactor?.label??''},
      heightFactor: ${setting.heightFactor?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: doubleOneValues,
        title: StringParams.kWidthFactor,
        value: setting.widthFactor,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(widthFactor: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleOneValues,
        title: StringParams.kHeightFactor,
        value: setting.heightFactor,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(heightFactor: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Center';
  }

  @override
  Widget getWidget() {
    return Center(
      widthFactor: setting.widthFactor?.value,
      heightFactor: setting.heightFactor?.value,
      child: setting.child?.value,
    );
  }
}

class CenterSetting {
  final Value<double> widthFactor;
  final Value<double> heightFactor;
  final Value<Widget> child;

  CenterSetting({
    this.heightFactor,
    this.widthFactor,
    this.child,
  });

  CenterSetting copyWith({
    Value<double> widthFactor,
    Value<double> heightFactor,
  }) {
    return CenterSetting(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
    );
  }
}
