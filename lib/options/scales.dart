import 'package:flutter/material.dart';

///字体大小
class MyTextValueScale {
  final double scale;
  final String label;
  const MyTextValueScale(this.scale, this.label);
  @override //判断是否相等
  bool operator ==(other) {
    if (runtimeType != other.runtimeType) return false;
    final MyTextValueScale typeother = other;
    return scale == typeother.scale && label == typeother.label;
  }
  @override //获取hashcode
  int get hashCode => hashValues(scale, label);
  @override//输出当前大小标签
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<MyTextValueScale> kAllMyTextValue = const <MyTextValueScale>[
  const MyTextValueScale(null, '默认'),
  const MyTextValueScale(0.7, '小号'),
  const MyTextValueScale(1.0, '正常'),
  const MyTextValueScale(1.1, '中号'),
  const MyTextValueScale(1.2, '大号'),
];


class ListStyleValue{
  final int listStyle;
  final String label;
  const ListStyleValue(this.listStyle, this.label);

  @override //判断是否相等
  bool operator ==(other) {
    if (runtimeType != other.runtimeType) return false;
    final ListStyleValue typeother = other;
    return listStyle == typeother.listStyle && label == typeother.label;
  }
  @override //获取hashcode
  int get hashCode => hashValues(listStyle, label);
  @override//输出当前大小标签
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<ListStyleValue> kAllListStyleValue=const <ListStyleValue>[
  const ListStyleValue(1, 'Grid'),
  const ListStyleValue(2, 'List'),
];


class MyThemeMode{
  final int themeMode;
  final String label;

  const MyThemeMode(this.themeMode, this.label);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MyThemeMode &&
              runtimeType == other.runtimeType &&
              themeMode == other.themeMode &&
              label == other.label;

  @override
  int get hashCode =>
      themeMode.hashCode ^
      label.hashCode;

  @override
  String toString() {
    return 'MyThemeMode{themeMode: $themeMode, label: $label}';
  }


}
const List<MyThemeMode> kAllThemeModeValue = const <MyThemeMode>[
  MyThemeMode(0, '跟随系统'),
  MyThemeMode(1, '明亮模式'),
  MyThemeMode(2, '黑暗模式'),
];