import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoTabBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoTabBar';
  final String detail = '''iOS风格的底部导航标签栏。

使用BottomNavigationBarItem显示多个选项卡，其中一个选项卡处于活动状态，默认情况下为第一个选项卡。

此StatelessWidget不存储活动选项卡本身。您必须侦听onTap回调并setState使用新的currentIndex调用 以反映新选择。

根据标准iOS设计，选项卡更改通常会触发Navigator之间的切换，每个Navigator都有自己的导航堆栈。

如果给定的backgroundColor的不透明度不是1.0（默认情况下是这种情况），它将对其后面的内容产生模糊效果。''';

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
