import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class TooltipDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Tooltip';
  final String detail = '''A material design tooltip.
Tooltips provide text labels that help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action).
Many widgets, such as IconButton, FloatingActionButton, and PopupMenuButton have a tooltip property that, when non-null, causes the widget to include a Tooltip in its build.
Tooltips improve the accessibility of visual widgets by proving a textual representation of the widget, which, for example, can be vocalized by a screen reader.
See also:
material.google.com/components/tooltips.html''';

  @override
  _TooltipDemoState createState() => _TooltipDemoState();
}

class _TooltipDemoState extends ExampleState<TooltipDemo> {
  TooltipSetting setting;

  @override
  void initState() {
    setting = TooltipSetting(
        message: Value(
          value: 'This is Tooltip',
          label: "'This is Tooltip'",
        ),
        height: doubleXlargeValues[0],
        padding: paddingValues[0],
        verticalOffset: doubleXlargeValues[0],
        preferBelow: boolValues[1],
        excludeFromSemantics: boolValues[0],
        child: Value(
          value: Text('long press show tooltip'),
          label: "Text('long press show tooltip')",
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Tooltip(
        message: ${setting.message?.label??''},
        height: ${setting.height?.label??''},
        padding: ${setting.padding?.label??''},
        verticalOffset: ${setting.verticalOffset?.label??''},
        preferBelow: ${setting.preferBelow?.label??''},
        excludeFromSemantics: ${setting.excludeFromSemantics?.label??''},
        child: ${setting.child?.label??''},
      ),
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value){
        setState(() {
          setting=setting.copyWith(padding: value);

        });
      }),
      SwitchValueTitleWidget(title: StringParams.kPreferBelow,
      value: setting.preferBelow,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(preferBelow: value);
        });
      },),
      SwitchValueTitleWidget(title: StringParams.kExcludeFromSemantics,
        value: setting.excludeFromSemantics,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(excludeFromSemantics: value);
          });
        },),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kVerticalOffset,
        value: setting.verticalOffset,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(verticalOffset: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kHeight,
        value: setting.height,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(height: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Tooltip';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Tooltip(
        message: setting.message?.value,
        height: setting.height?.value,
        padding: setting.padding?.value,
        verticalOffset: setting.verticalOffset?.value,
        preferBelow: setting.preferBelow?.value,
        excludeFromSemantics: setting.excludeFromSemantics?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class TooltipSetting {
  final Value<String> message;
  final Value<double> height;
  final Value<EdgeInsetsGeometry> padding;
  final Value<double> verticalOffset;
  final Value<bool> preferBelow;
  final Value<bool> excludeFromSemantics;
  final Value<Widget> child;

  TooltipSetting({
    @required this.message,
    this.height,
    this.padding,
    this.verticalOffset,
    this.preferBelow,
    this.excludeFromSemantics,
    this.child,
  });

  TooltipSetting copyWith({
    Value<String> message,
    Value<double> height,
    Value<EdgeInsetsGeometry> padding,
    Value<double> verticalOffset,
    Value<bool> preferBelow,
    Value<bool> excludeFromSemantics,
    Value<Widget> child,
  }) {
    return TooltipSetting(
      message: message ?? this.message,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      verticalOffset: verticalOffset ?? this.verticalOffset,
      preferBelow: preferBelow ?? this.preferBelow,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      child: child ?? this.child,
    );
  }
}
