import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ButtonBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/ButtonBar';
  final String detail = '''A horizontal arrangement of buttons.
Places the buttons horizontally according to the padding in the current ButtonTheme.
Used by Dialog to arrange the actions at the bottom of the dialog.
See also:
RaisedButton, a kind of button.
FlatButton, another kind of button.
Card, at the bottom of which it is common to place a ButtonBar.
Dialog, which uses a ButtonBar for its actions.
ButtonTheme, which configures the ButtonBar.''';

  @override
  _ButtonBarDemoState createState() => _ButtonBarDemoState();
}

class _ButtonBarDemoState extends ExampleState<ButtonBarDemo> {
  ButtonBarSetting setting;

  @override
  void initState() {
    setting = ButtonBarSetting(
      children: buttonValues[0],
      alignment: mainAxisAlignmentValues[0],
      mainAxisSize: mainAxisSizeValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''ButtonBar(
      alignment: ${setting.alignment?.label??''},
      mainAxisSize: ${setting.mainAxisSize?.label??''},
      children: ${setting.children?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kChildren),
      RadioGroupWidget(setting.children, buttonValues, (value){
        setState(() {
          setting=setting.copyWith(children: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, mainAxisAlignmentValues, (value){
        setState(() {
          setting=setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kMainAxisSize),
      RadioGroupWidget(setting.mainAxisSize, mainAxisSizeValues, (value){
        setState(() {
          setting=setting.copyWith(mainAxisSize: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ButtonBar';
  }
  @override
  Widget getWidget() {
    return ButtonBar(
      alignment: setting.alignment?.value,
      mainAxisSize: setting.mainAxisSize?.value,
      children: setting.children?.value,
    );
  }
}

class ButtonBarSetting {
  final Value<MainAxisAlignment> alignment;
  final Value<MainAxisSize> mainAxisSize;
  final Value<List<Widget>> children;

  ButtonBarSetting({
    this.alignment,
    this.mainAxisSize,
    this.children,
  });

  ButtonBarSetting copyWith({
    Value<MainAxisAlignment> alignment,
    Value<MainAxisSize> mainAxisSize,
    Value<List<Widget>> children,
  }) {
    return ButtonBarSetting(
      alignment: alignment ?? this.alignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      children: children ?? this.children,
    );
  }
}
