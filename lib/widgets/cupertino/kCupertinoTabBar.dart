import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTabBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabBar';
  final String detail = '''An iOS-styled bottom navigation tab bar.
Displays multiple tabs using BottomNavigationBarItem with one tab being active, the first tab by default.
This StatelessWidget doesn't store the active tab itself. You must listen to the onTap callbacks and call setState with a new currentIndex for the new selection to reflect.
Tab changes typically trigger a switch between Navigators, each with its own navigation stack, per standard iOS design.
If the given backgroundColor's opacity is not 1.0 (which is the case by default), it will produce a blurring effect to the content behind it.
See also:
CupertinoTabScaffold, which hosts the CupertinoTabBar at the bottom.
BottomNavigationBarItem, an item in a CupertinoTabBar.''';

  @override
  _CupertinoTabBarDemoState createState() => _CupertinoTabBarDemoState();
}

class _CupertinoTabBarDemoState extends ExampleState<CupertinoTabBarDemo> {
  CupertinoTabBarSetting setting;

  @override
  void initState() {
    setting = CupertinoTabBarSetting(
      items: bottomNavigationBarItemValues[0],
      currentIndex: Value(
        value: 0,
        label: '0',
      ),
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
      activeColor: colorValues[1],
      inactiveColor: colorValues[2],
      backgroundColor: colorValues[3],
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
    
CupertinoTabBar(
        items: ${setting.items?.label??''},
        onTap: ${setting.onTap?.label??''},
        currentIndex: ${setting.currentIndex?.label??''},
        backgroundColor: ${setting.backgroundColor?.label??''},
        activeColor: ${setting.activeColor?.label??''},
        inactiveColor: ${setting.inactiveColor?.label??''},
        iconSize: ${setting.iconSize?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
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
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),

      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kActiveColor),
      ColorGroupWidget(setting.activeColor, (value) {
        setState(() {
          setting = setting.copyWith(activeColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kInActiveColor),
      ColorGroupWidget(setting.inactiveColor, (value) {
        setState(() {
          setting = setting.copyWith(inactiveColor: value);
        });
      }),
      DropDownValueTitleWidget(title: StringParams.kIconSize,value: setting.iconSize,
      selectList: doubleLargeValues,
      onChanged: (value){
        setState(() {
          setting = setting.copyWith(iconSize: value);
        });
      },)
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoTabBar';
  }

  @override
  Widget getWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: CupertinoTabBar(
        items: setting.items?.value,
        onTap: setting.onTap?.value,
        currentIndex: setting.currentIndex?.value,
        backgroundColor: setting.backgroundColor?.value,
        activeColor: setting.activeColor?.value,
        inactiveColor: setting.inactiveColor?.value,
        iconSize: setting.iconSize?.value,
      ),
    );
  }
}

class CupertinoTabBarSetting {
  final Value<List<BottomNavigationBarItem>> items;
  final Value<ValueChanged<int>> onTap;
  final Value<int> currentIndex;
  final Value<Color> backgroundColor;
  final Value<Color> activeColor;
  final Value<Color> inactiveColor;
  final Value<double> iconSize;

  CupertinoTabBarSetting({
    this.items,
    this.onTap,
    this.currentIndex,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.iconSize,
  });

  CupertinoTabBarSetting copyWith({
    Value<List<BottomNavigationBarItem>> items,
    Value<ValueChanged<int>> onTap,
    Value<int> currentIndex,
    Value<Color> backgroundColor,
    Value<Color> activeColor,
    Value<Color> inactiveColor,
    Value<double> iconSize,
  }) {
    return CupertinoTabBarSetting(
      items: items ?? this.items,
      onTap: onTap ?? this.onTap,
      currentIndex: currentIndex ?? this.currentIndex,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }
}
