import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LimitedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/LimitedBox';
  final String detail = '''A box that limits its size only when it's unconstrained.
If this widget's maximum width is unconstrained then its child's width is limited to maxWidth. Similarly, if this widget's maximum height is unconstrained then its child's height is limited to maxHeight.
This has the effect of giving the child a natural dimension in unbounded environments. For example, by providing a maxHeight to a widget that normally tries to be as big as possible, the widget will normally size itself to fit its parent, but when placed in a vertical list, it will take on the given height.
This is useful when composing widgets that normally try to match their parents' size, so that they behave reasonably in lists (which are unbounded).
See also:
ConstrainedBox, which applies its constraints in all cases, not just when the incoming constraints are unbounded.
SizedBox, which lets you specify tight constraints by explicitly specifying the height or width.
The catalog of layout widgets.''';

  @override
  _LimitedBoxDemoState createState() =>
      _LimitedBoxDemoState();
}

class _LimitedBoxDemoState extends ExampleState<LimitedBoxDemo> {
  LimitedBoxSetting setting;

  @override
  void initState() {
    setting = LimitedBoxSetting(
      maxHeight: doubleXlargeValues[0],
      maxWidth: doubleXlargeValues[0],
      child: Value(
        value: SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        label: '''SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
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
    return '''LimitedBox(
      maxWidth: ${setting.maxWidth?.label??''},
      maxHeight: ${setting.maxHeight?.label??''},
      child:${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMaxWidth,
        value: setting.maxWidth,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxWidth: value);
//            setting=setting.copyWith(child: _formatValue());
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMaxHeight,
        value: setting.maxHeight,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(maxHeight: value);
//            setting=setting.copyWith(child: _formatValue());
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'LimitedBox';
  }


  @override
  Widget getWidget() {
    return LimitedBox(
      maxWidth: setting.maxWidth?.value,
      maxHeight: setting.maxHeight?.value,
      child:setting.child?.value,
    );
  }
}

class LimitedBoxSetting {
  final Value<double> maxWidth;
  final Value<double> maxHeight;
  final Value<Widget> child;

  LimitedBoxSetting({this.maxWidth, this.maxHeight, this.child,
  });

  LimitedBoxSetting copyWith
      ({
    Value<double> maxWidth,
    Value<double> maxHeight,
    Value<Widget> child,
  }) {
    return LimitedBoxSetting(
      maxWidth: maxWidth??this.maxWidth,
      maxHeight: maxHeight??this.maxHeight,
      child: child??this.child,
    );
  }
}
