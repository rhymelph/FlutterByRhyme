import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/PopupMenuButton';
  final String detail = '''Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected. The value passed to onSelected is the value of the selected menu item.
One of child or icon may be provided, but not both. If icon is provided, then PopupMenuButton behaves like an IconButton.
If both are null, then a standard overflow icon is created (depending on the platform).''';

  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends ExampleState<PopupMenuButtonDemo> {
  PopupMenuButtonSetting setting;

  @override
  void initState() {
    setting = PopupMenuButtonSetting(
      itemBuilder: popupMenuItemBuilderValues[0],
      initialValue: const Value(
        name: 'appe',
        value: 'apple',
        label: 'apple',
      ),
      onSelected:  Value(
        name: 'onSelect',
        value: (value){
          setState(() {
            setting=setting.copyWith(initialValue:  Value(
              value: value,
              name: value,
              label: value,
            ),child: Value(
                  name: 'child',
                  value: Text(value),
                  label: "Text(value)",
            ));
          });
        },
        label: '''(value){
          setState(() {
            // todo 一般设置child为选中的value
            this.value=value;
          });
        }'''
      ),
      elevation: doubleLargeValues[0],
      padding: paddingValues[0],
      child: const Value(
        name: 'child',
        value: Text('please select'),
        label: "Text(value)",
      ),
      icon: const Value(
        name: 'null',
        value: null,
        label: 'null',
      )
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''String value='please select';
    PopupMenuButton<String>(
        itemBuilder: ${setting.itemBuilder?.label??''},
        initiallabel: ${setting.initialValue?.label??''},
        onSelected: ${setting.onSelected?.label??''},
        onCanceled: (){
          //if you click the button,but you no click item
        },
        tooltip: ${setting.tooltip?.label??''},
        elevation: ${setting.elevation?.label??''},
        padding: ${setting.padding?.label??''},
        //icon or child only one not null,
        child: ${setting.child?.label??''},
        icon: ${setting.icon?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kItemBuilder),
      RadioGroupWidget(setting.itemBuilder, popupMenuItemBuilderValues, (value){
        setState(() {
          setting=setting.copyWith(itemBuilder: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kTooltip,
        value: setting.tooltip,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(tooltip: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kElevation,
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'PopupMenuBUtton';
  }

  @override
  Widget getWidget() {
    return Center(
      child: PopupMenuButton<String>(
        itemBuilder: setting.itemBuilder?.value,
        initialValue: setting.initialValue?.value,
        onSelected: setting.onSelected?.value,
        onCanceled: (){
          //if you click the button,but you no click item
        },
        tooltip: setting.tooltip?.label,
        elevation: setting.elevation?.value,
        padding: setting.padding?.value,
        child: setting.child?.value,
        icon: setting.icon?.value,
      ),
    );
  }
}

class PopupMenuButtonSetting {
  final Value<PopupMenuItemBuilder<String>> itemBuilder;
  final Value<String> initialValue;
  final Value<PopupMenuItemSelected<String>> onSelected;
  final Value<bool> tooltip;
  final Value<double> elevation;
  final Value<EdgeInsetsGeometry> padding;
  final Value<Widget> child;
  final Value<Icon> icon;

  PopupMenuButtonSetting({
    this.itemBuilder,
    this.initialValue,
    this.onSelected,
    this.tooltip,
    this.elevation,
    this.padding,
    this.child,
    this.icon,
  });

  PopupMenuButtonSetting copyWith({
    Value<PopupMenuItemBuilder<String>> itemBuilder,
    Value<String> initialValue,
    Value<PopupMenuItemSelected<String>> onSelected,
    Value<bool> tooltip,
    Value<double> elevation,
    Value<EdgeInsetsGeometry> padding,
    Value<Widget> child,
    Value<Icon> icon,
  }) {
    return PopupMenuButtonSetting(
      itemBuilder: itemBuilder ?? this.itemBuilder,
      initialValue: initialValue ?? this.initialValue,
      onSelected: onSelected ?? this.onSelected,
      tooltip: tooltip ?? this.tooltip,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      child: child ?? this.child,
      icon: icon ?? this.icon,
    );
  }
}
