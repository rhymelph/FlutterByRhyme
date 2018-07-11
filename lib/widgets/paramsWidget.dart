import 'package:flutter/material.dart';

//属性实体类
class Value<T> {
  final String name;
  final String label;
  final T value;

  const Value(this.name, this.value, this.label);

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    Value typeOther = other;
    return typeOther.label == label && typeOther.name == name;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(name, label);
}

//标题控件
class ValueTitleWidget extends StatelessWidget {
  ValueTitleWidget(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
      child: Text(
        title,
        style: Theme
            .of(context)
            .textTheme
            .title,
      ),
    );
  }
}

//单选控件
class RadioWidget<T> extends StatelessWidget {
  RadioWidget(this.value, this.groupValue, this.onchange);

  final Value<T> groupValue;
  final Value<T> value;
  final ValueChanged<Value<T>> onchange;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Tooltip(
        message: value.label,
        child: Row(children: [
          Radio<Value<T>>(
              value: value, groupValue: groupValue, onChanged: onchange),
          Text(value.name),
        ]),
      ),
    );
  }
}
//单选控件组
class RadioGroupWidget<T> extends StatelessWidget {
  RadioGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<T> groupValue;
  final List<Value<T>> valueList;
  final ValueChanged<Value<T>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return RadioWidget(value, groupValue, valueChanged);
        }).toList(),
      ),
    );
  }
}

//颜色选择单选按钮
class ColorWidget extends StatelessWidget {
  ColorWidget(this.value, this.groupValue, this.onchange);

  final Value<Color> groupValue;
  final Value<Color> value;
  final ValueChanged<Value<Color>> onchange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MergeSemantics(
      child: Tooltip(
        message: value.label,
        child: RawMaterialButton(onPressed: () {
          onchange(value);
        },constraints: const BoxConstraints.tightFor(
          width: 32.0,
          height: 32.0,
        ),fillColor: value.value,
        shape: CircleBorder(
          side: BorderSide(
            color: value==groupValue?Colors.black:const Color(0xFFD5D7DA),
            width: 3.0
          )
        ),),
      ),
    );
  }
}
//颜色选择单选按钮组
class ColorGroupWidget extends StatelessWidget {
  ColorGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<Color> groupValue;
  final List<Value<Color>> valueList;
  final ValueChanged<Value<Color>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}
