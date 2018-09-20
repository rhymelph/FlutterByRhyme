import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/BottomNavigationBar';
  final String detail = '''显示在应用程序底部的材料窗口小部件，用于在少量视图中进行选择，通常在3到5之间。

底部导航栏由文本标签，图标或两者形式的多个项目组成，布置在一块材料的顶部。它提供了应用程序顶级视图之间的快速导航。对于较大的屏幕，侧面导航可能更适合。

底部导航栏通常与Scaffold结合使用，它作为Scaffold.bottomNavigationBar参数提供。

底部导航栏的类型更改其项目的显示方式。如果未指定，则 当少于四个项时，它会自动设置为BottomNavigationBarType.fixed， 否则为BottomNavigationBarType.shifting。''';

  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState
    extends ExampleState<BottomNavigationBarDemo> {
  BottomNavigationBarSetting setting;

  @override
  void initState() {
    setting = BottomNavigationBarSetting(
      currentIndex: const Value(
        name: '0',
        value: 0,
        label: 'position',
      ),
      items: bottomNavigationBarItemValues[0],
      onTap: Value(
        name: 'onTap',
        value: (value) {
          if(mounted){
            if (setting.items.value.length > value) {
              setState(() {
                setting = setting.copyWith(
                    currentIndex: Value(
                      name: '$value',
                      value: value,
                      label: '_position',
                    ));
              });
            }
          }
        },
        label: '''(value){
                  setState(() {
                      _position=value;
                  });
                 }''',
      ),
      iconSize: doubleLargeValues[4],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''int _position=0;
    
    BottomNavigationBar(
      items: ${setting.items?.label??''},
      onTap: ${setting.onTap?.label??''},
      currentIndex: ${setting.currentIndex?.label??''},
      type: ${setting.type?.label??''},
      fixedColor: ${setting.fixedColor?.label??''},
      iconSize: ${setting.iconSize?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kSave,
        onPressed: () {
          Navigator.pop(
              context,
              Value<Widget>(
                name: 'BottomNavigationBar',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ValueTitleWidget(StringParams.kType),
      RadioGroupWidget<BottomNavigationBarType>(
        setting.type,
        bottomNavigationBarTypeValues,
            (value) {
          setState(() {
            setting = setting.copyWith(type: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kItems),
      RadioGroupWidget<List<BottomNavigationBarItem>>(
        setting.items,
        bottomNavigationBarItemValues,
        (value) {
          setState(() {
            if (setting.currentIndex.value > value.value.length - 1) {
              setting = setting.copyWith(
                items: value,
                currentIndex: Value(
                  name: '0',
                  value: 0,
                  label: '_position',
                ),
              );
            } else {
              setting = setting.copyWith(items: value);
            }
          });
        },
      ),
      ValueTitleWidget(StringParams.kFixedColor),
      ColorGroupWidget(
        setting.fixedColor,
        (value) {
          setState(() {
            setting = setting.copyWith(fixedColor: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kIconSize,
        value: setting.iconSize,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(
              iconSize: value,
            );
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'BottomNavigationBar';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      bottomNavigationBar: returnWidget(),
    );
  }

  Widget returnWidget() {
    return BottomNavigationBar(
      items: setting.items?.value,
      onTap: setting.onTap?.value,
      currentIndex: setting.currentIndex?.value,
      type: setting.type?.value,
      fixedColor: setting.fixedColor?.value,
      iconSize: setting.iconSize?.value,
    );
  }
}

class BottomNavigationBarSetting {
  final Value<List<BottomNavigationBarItem>> items;
  final Value<ValueChanged<int>> onTap;
  final Value<int> currentIndex;
  final Value<BottomNavigationBarType> type;
  final Value<Color> fixedColor;
  final Value<double> iconSize;

  BottomNavigationBarSetting({
    this.items,
    this.onTap,
    this.currentIndex,
    this.type,
    this.fixedColor,
    this.iconSize,
  });

  BottomNavigationBarSetting copyWith({
    Value<List<BottomNavigationBarItem>> items,
    Value<ValueChanged<int>> onTap,
    Value<int> currentIndex,
    Value<BottomNavigationBarType> type,
    Value<Color> fixedColor,
    Value<double> iconSize,
  }) {
    return BottomNavigationBarSetting(
      items: items ?? this.items,
      onTap: onTap ?? this.onTap,
      currentIndex: currentIndex ?? this.currentIndex,
      type: type ?? this.type,
      fixedColor: fixedColor ?? this.fixedColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }
}
