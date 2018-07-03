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
