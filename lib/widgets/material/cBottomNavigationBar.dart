import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/BottomNavigationBar';

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
        value: (value){
          if(setting.items.value.length>value){
            print(value);
            setState(() {
              setting.copyWith(currentIndex: Value(
                name: '$value',
                value: value,
                label: 'position',
              ));
            });
          }
        },
        label: '(value){'
            'setState(() {'
            'position=value;'
            '});'
      ),
      iconSize: doubleLargeValues[0],

    );
    super.initState();
  }

  @override
  String getDetail() {
    return '''int position=0;''';
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: 'Save(from scaffold)',
        onPressed: () {
          Navigator.pop(
              context,
              Value<PreferredSizeWidget>(
                name: 'BottomNavigationBar',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ValueTitleWidget('Items'),
      RadioGroupWidget(setting.items, bottomNavigationBarItemValues, (value){
        setState(() {
          setting=setting.copyWith(items: value);
        });
      }),
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
