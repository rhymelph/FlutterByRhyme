import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LimitedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/LimitedBox';
  final String detail = '''只有当它不受约束时才限制其大小的盒子。

如果此窗口小部件的最大宽度不受约束，则其子窗口的宽度将限制为maxWidth。同样，如果此窗口小部件的最大高度不受约束，则其子窗口的高度将限制为maxHeight。

这具有使儿童在无界环境中具有自然维度的效果。例如，通过向通常尝试尽可能大的窗口小部件提供maxHeight，窗口小部件通常会调整其大小以适合其父窗口，但是当放置在垂直列表中时，它将采用给定的高度。

这在编写通常尝试匹配其父项大小的小部件时很有用，这样它们在列表中是合理的行为（无限制）。''';

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
