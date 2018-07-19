import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//属性实体类
import 'params.dart';
export 'params.dart';

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
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}

class ValueTitleButtonWidget extends StatelessWidget {
  ValueTitleButtonWidget({this.title, this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    bool isDark=Theme.of(context).brightness==Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: onPressed,
        color: isDark?Colors.black87:Colors.white,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: Colors.grey[300],
            width: 1.0,
          )
        ),
        splashColor: Colors.grey[200],
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}

//开关标题
class SwitchValueTitleWidget extends StatelessWidget {
  SwitchValueTitleWidget({this.title, this.value, this.onChanged});

  final Value<bool> value;
  final String title;
  final ValueChanged<Value<bool>> onChanged;

  void _onChanged(bool a){
    final Value<bool> changeValue=Value(
      name: a?'true':'false',
      value: a,
      label: a?'true':'false',
    );
    onChanged(changeValue);
  }
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Switch(
            value: value?.value??false,
            onChanged: _onChanged,
            activeColor: Colors.blue,
            activeTrackColor: isDark ? Colors.white24 : Colors.black26,
          ),
        ],
      ),
    );
  }
}

//下拉选项标题
class DropDownValueTitleWidget<T> extends StatelessWidget {
  DropDownValueTitleWidget(
      {@required this.selectList,
      @required this.title,
      @required this.value,
      this.onChanged});

  final Value<T> value;
  final String title;
  final ValueChanged<Value<T>> onChanged;
  final List<Value<T>> selectList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButtonHideUnderline(
              child: Container(
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: DropdownButton<Value<T>>(
                  onChanged: onChanged,
                  value: value,
                  items: selectList.map((Value<T> selectValue) {
                    return DropdownMenuItem<Value<T>>(
                        value: selectValue,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(selectValue.name),
                        ));
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//二级选择
class ExpansionPanelTitleWidget extends StatelessWidget {
  ExpansionPanelTitleWidget({
    this.titleWidget,
    this.hintWidget,
    this.isExpanded: false,
    this.onChanged,
  });

  final Widget titleWidget;
  final Widget hintWidget;
  final bool isExpanded;
  final ValueChanged<bool> onChanged;

  ExpansionPanelHeaderBuilder get header {
    return (BuildContext context, bool isExpanded) {
      return titleWidget;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          onChanged(!isExpanded);
        },
        children: [
          ExpansionPanel(
              isExpanded: isExpanded, headerBuilder: header, body: hintWidget),
        ],
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
        child: RawMaterialButton(
          onPressed: () {
            onchange(value);
          },
          constraints: const BoxConstraints.tightFor(
            width: 32.0,
            height: 32.0,
          ),
          fillColor: value.value,
          shape: CircleBorder(
              side: BorderSide(
                  color: value == groupValue
                      ? Colors.black
                      : const Color(0xFFD5D7DA),
                  width: 3.0)),
        ),
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
            padding: const EdgeInsets.all(10.0),
            child: ColorWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}

//装饰选择单选按钮
class DecorationWidget extends StatelessWidget {
  DecorationWidget(this.value, this.groupValue, this.onchange);

  final Value<Decoration> groupValue;
  final Value<Decoration> value;
  final ValueChanged<Value<Decoration>> onchange;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MergeSemantics(
      child: Tooltip(
        message: value.label,
        child: GestureDetector(
          onTap: () {
            onchange(value);
          },
          child: DecoratedBox(
            decoration: value.value,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.radio_button_checked,
                size: 10.0,
                color: value == groupValue ? Colors.black : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//装饰选择单选按钮组
class DecorationGroupWidget extends StatelessWidget {
  DecorationGroupWidget(this.groupValue, this.valueList, this.valueChanged);

  final Value<Decoration> groupValue;
  final List<Value<Decoration>> valueList;
  final ValueChanged<Value<Decoration>> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: valueList.map((value) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: DecorationWidget(value, groupValue, valueChanged),
          );
        }).toList(),
      ),
    );
  }
}

class EditTextGroupWidget extends StatelessWidget{
  EditTextGroupWidget(this.value,this.onChanged);
  final Value<Widget> value;
  final ValueChanged<Value<Widget>> onChanged;
  @override
  Widget build(BuildContext context) {
    String oldText='';
    if(value?.name!=null){
      oldText=value.name;
    }
    TextEditingController controller=TextEditingController(text: oldText);
    int selection=0;
    if(value?.name!=null){
      selection=value.name.length;
    }
    controller.selection=TextSelection(baseOffset: selection, extentOffset: selection);
    controller.addListener((){
      String text=controller.text;
      onChanged(Value<Widget>(
        name: text,
        value: Text(text),
        label: 'Text($text)',
      ));
    });
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller,
      ),
    );
  }
}

class SeekBarGroupWidget extends StatelessWidget{
  SeekBarGroupWidget(this.value,this.onChanged);
  final Value<double> value;
  final ValueChanged<Value<double>> onChanged;

  void onChangedValue(double change){
    onChanged(Value(
      name: '$change',
      value: change,
      label: '$change',
    ));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Slider(value: value.value, onChanged: onChangedValue);
  }

}

