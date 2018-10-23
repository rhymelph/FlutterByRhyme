import 'package:flutter/cupertino.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoSegmentedControlDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoSegmentedControl';
  final String detail = '''OS风格的分段控件。

在水平列表中显示子映射中提供的小组件。用于在多个互斥选项之间进行选择。当选择分段控件中的一个选项时，将不再选择分段控件中的其他选项。

分段控件可以拥有任何小部件作为其值的一个 地图的儿童。类型T是用于标识每个小部件并确定选择哪个小部件的键的类型。根据Map类的要求，键必须是一致的类型，并且必须具有可比性。键的排序将决定分段控件中小部件的顺序。

当分段控件的状态发生更改时，窗口小部件将调用 onValueChanged回调。在onValueChanged回调中返回与新选择的窗口小部件关联的地图密钥。通常，使用分段控件的窗口小部件将侦听onValueChanged回调并使用新的groupValue重建分段控件以更新当前选择的选项。

该儿童将被显示在按键的顺序地图。分段控件的高度由作为子映射中的值提供的最高窗口小部件的高度确定。除非子项的组合宽度大于可用的水平空间，否则分段控件中每个子项的宽度将等于最宽子项的宽度。在这种情况下，可用的水平空间除以提供的子节点的数量，以确定每个小部件的宽度。儿童地图中 每个小部件的选择区域 然后将展开以填充计算的空间，因此每个小部件看起来都具有相同的尺寸。

可以选择使用自定义颜色创建分段控件。的 unselectedColor，selectedColor，BORDERCOLOR和pressedColor 参数可以被用于改变从所述分段控制的颜色 CupertinoColors.activeBlue和CupertinoColors.white到自定义配置。''';

  @override
  _CupertinoSegmentedControlDemoState createState() =>
      _CupertinoSegmentedControlDemoState();
}

class _CupertinoSegmentedControlDemoState
    extends ExampleState<CupertinoSegmentedControlDemo> {
  CupertinoSegmentedControlSetting setting;

  @override
  void initState() {
    setting = CupertinoSegmentedControlSetting(
        children: Value(
          value: {
            "home":Text('home'),
            "message":Text('message'),
            "person":Text('person'),
          },
          label: '''{
            "home":Text('home'),
            "message":Text('message'),
            "person":Text('person'),
          }'''
        ),
        onValueChanged: Value(
          value: (value){
            setState(() {
              setting=setting.copyWith(groupValue: Value(
                value: value,
                label: '$value',
              ));
            });
          },
          label: '''(value){
            //value 点击对应children的key
          }''',

        ),
      groupValue: Value(
        label: 'home',
        value: 'home',
      ),
      unselectedColor: colorValues[1],
      selectedColor: colorValues[2],
      borderColor: colorValues[3],
      pressedColor: colorValues[4],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoSegmentedControl(
        children: ${setting.children?.label??''},
        onValueChanged: ${setting.onValueChanged?.label??''},
        groupValue: '${setting.groupValue.label??''}',
        unselectedColor: ${setting.unselectedColor?.label??''},
        selectedColor: ${setting.selectedColor?.label??''},
        borderColor: ${setting.borderColor?.label??''},
        pressedColor: ${setting.pressedColor?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kUnselectedColor),
      ColorGroupWidget(setting.unselectedColor, (value){
        setState(() {
          setting=setting.copyWith(unselectedColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kSelectedColor),
      ColorGroupWidget(setting.selectedColor, (value){
        setState(() {
          setting=setting.copyWith(selectedColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kBorderColor),
      ColorGroupWidget(setting.borderColor, (value){
        setState(() {
          setting=setting.copyWith(borderColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kPressedColor),
      ColorGroupWidget(setting.pressedColor, (value){
        setState(() {
          setting=setting.copyWith(pressedColor: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoSegmentedControl';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoSegmentedControl(
        children: setting.children?.value,
        onValueChanged: setting.onValueChanged?.value,
        groupValue: setting.groupValue?.value,
        unselectedColor: setting.unselectedColor?.value,
        selectedColor: setting.selectedColor?.value,
        borderColor: setting.borderColor?.value,
        pressedColor: setting.pressedColor?.value,
      ),
    );
  }
}

class CupertinoSegmentedControlSetting<T> {
  final Value<Map<T, Widget>> children;
  final Value<ValueChanged<T>> onValueChanged;
  final Value<T> groupValue;
  final Value<Color> unselectedColor;
  final Value<Color> selectedColor;
  final Value<Color> borderColor;
  final Value<Color> pressedColor;

  CupertinoSegmentedControlSetting({
    this.children,
    this.onValueChanged,
    this.groupValue,
    this.unselectedColor,
    this.selectedColor,
    this.borderColor,
    this.pressedColor,
  });

  CupertinoSegmentedControlSetting copyWith({
    Value<Map<T, Widget>> children,
    Value<ValueChanged<T>> onValueChanged,
    Value<T> groupValue,
    Value<Color> unselectedColor,
    Value<Color> selectedColor,
    Value<Color> borderColor,
    Value<Color> pressedColor,
  }) {
    return CupertinoSegmentedControlSetting(
      children: children ?? this.children,
      onValueChanged: onValueChanged ?? this.onValueChanged,
      groupValue: groupValue ?? this.groupValue,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      selectedColor: selectedColor ?? this.selectedColor,
      borderColor: borderColor ?? this.borderColor,
      pressedColor: pressedColor ?? this.pressedColor,
    );
  }
}
