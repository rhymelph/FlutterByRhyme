import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DividerDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Divider';
  final String detail = '''A one device pixel thick horizontal line, with padding on either side.
In the material design language, this represents a divider.
Dividers can be used in lists, Drawers, and elsewhere to separate content vertically. To create a one-pixel divider between items in a list, consider using ListTile.divideTiles, which is optimized for this case.
The box's total height is controlled by height. The appropriate padding is automatically computed from the height.
See also:
PopupMenuDivider, which is the equivalent but for popup menus.
ListTile.divideTiles, another approach to dividing widgets in a list.
material.google.com/components/dividers.html''';

  @override
  _DividerDemoState createState() => _DividerDemoState();
}

class _DividerDemoState extends ExampleState<DividerDemo> {
  DividerSetting setting;

  @override
  void initState() {
    setting = DividerSetting(
      height: doubleXlargeValues[0],
      indent: doubleMiniValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Divider(
        height: ${setting.height?.label??''},
        indent: ${setting.indent?.label??''},
        color: ${setting.color?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(selectList: doubleXlargeValues, title: StringParams.kHeight, value: setting.height,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(height: value);
        });
      },),
      DropDownValueTitleWidget(selectList: doubleMiniValues, title: StringParams.kIndent, value: setting.indent,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(indent: value);
          });
        },),
    ];
  }

  @override
  String getTitle() {
    return 'Divider';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Divider(
        height: setting.height?.value,
        indent: setting.indent?.value,
        color: setting.color?.value,
      ),
    );
  }
}

class DividerSetting {
  final Value<double> height;
  final Value<double> indent;
  final Value<Color> color;

  DividerSetting({this.height, this.indent, this.color});

  DividerSetting copyWith({
    Value<double> height,
    Value<double> indent,
    Value<Color> color,
  }) {
    return DividerSetting(
      height: height ?? this.height,
      indent: indent ?? this.indent,
      color: color ?? this.color,
    );
  }
}
