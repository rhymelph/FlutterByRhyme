import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListTileDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/ListTitle';

  final String detail = '''A single fixed-height row that typically contains some text as well as a leading or trailing icon.
A list tile contains one to three lines of text optionally flanked by icons or other widgets, such as check boxes. The icons (or other widgets) for the tile are defined with the leading and trailing parameters. The first line of text is not optional and is specified with title. The value of subtitle, which is optional, will occupy the space allocated for an additional line of text, or two lines if isThreeLine is true. If dense is true then the overall height of this tile and the size of the DefaultTextStyles that wrap the title and subtitle widget are reduced.
List tiles are always a fixed height (which height depends on how isThreeLine, dense, and subtitle are configured); they do not grow in height based on their contents. If you are looking for a widget that allows for arbitrary layout in a row, consider Row.
List tiles are typically used in ListViews, or arranged in Columns in Drawers and Cards.
Requires one of its ancestors to be a Material widget.''';

  @override
  _ListTileDemoState createState() => _ListTileDemoState();
}

class _ListTileDemoState extends ExampleState<ListTileDemo> {
  ListTileSetting setting;

  @override
  void initState() {
    setting = ListTileSetting(
      title: Value(
        value: Text('This is a ListTile Title.'),
        label: "Text('This is a ListTile Title.')",
      ),
      subtitle: Value(
        value: Text('This is a ListTile SubTitle.'),
        label: "Text('This is a ListTile SubTitle.')",
      ),
      isThreeLine: boolValues[0],
      enabled: boolValues[1],
      selected: boolValues[0],
      leading: Value(
        value: Icon(Icons.accessibility),
        label: 'Icon(Icons.accessibility)',
      ),
      trailing: Value(
        value: Icon(Icons.check_circle),
        label: 'Icon(Icons.check_circle)',
      ),
      onLongPress: Value(
        value: (){
          // todo long press
          exampleKey.currentState.showToast('Long Press');
        },
        label: '''(){
          // todo long press 
        }'''
      ),
      onTap: Value(
        value: (){
          //todo on tap
          exampleKey.currentState.showToast('on Tap');
        },
        label: '''(){
          //todo on tap
        }''',
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
    return '''ListTile(
      leading: ${setting.leading?.label??''},
      title: ${setting.title?.label??''},
      subtitle: ${setting.subtitle?.label??''},
      trailing: ${setting.trailing?.label??''},
      isThreeLine: ${setting.isThreeLine?.label??''},
      dense: ${setting.dense?.label??''},
      contentPadding: ${setting.contentPadding?.label??''},
      enabled: ${setting.enabled?.label??''},
      onTap: ${setting.onTap?.label??''},
      onLongPress: ${setting.onLongPress?.label??''},
      selected: ${setting.selected?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kContentPadding),
      RadioGroupWidget(setting.contentPadding, paddingValues, (value){
        setState(() {
        setting=setting.copyWith(contentPadding: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kIsThreeLine,
        value: setting.isThreeLine,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isThreeLine: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kDense,
        value: setting.dense,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(dense: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kEnabled,
        value: setting.enabled,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(enabled: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kSelected,
        value: setting.selected,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(selected: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'ListTile';
  }

  @override
  Widget getWidget() {
    return ListTile(
      leading: setting.leading?.value,
      title: setting.title?.value,
      subtitle: setting.subtitle?.value,
      trailing: setting.trailing?.value,
      isThreeLine: setting.isThreeLine?.value,
      dense: setting.dense?.value,
      contentPadding: setting.contentPadding?.value,
      enabled: setting.enabled?.value,
      onTap: setting.onTap?.value,
      onLongPress: setting.onLongPress?.value,
      selected: setting.selected?.value,
    );
  }
}

class ListTileSetting {
  final Value<Widget> leading;
  final Value<Widget> title;
  final Value<Widget> subtitle;
  final Value<Widget> trailing;
  final Value<bool> isThreeLine;
  final Value<bool> dense;
  final Value<EdgeInsetsGeometry> contentPadding;
  final Value<bool> enabled;
  final Value<GestureTapCallback> onTap;
  final Value<GestureLongPressCallback> onLongPress;
  final Value<bool> selected;

  ListTileSetting({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.contentPadding,
    this.enabled,
    this.onTap,
    this.onLongPress,
    this.selected,
  });

  ListTileSetting copyWith({
    Value<Widget> leading,
    Value<Widget> title,
    Value<Widget> subtitle,
    Value<Widget> trailing,
    Value<bool> isThreeLine,
    Value<bool> dense,
    Value<EdgeInsetsGeometry> contentPadding,
    Value<bool> enabled,
    Value<GestureTapCallback> onTap,
    Value<GestureLongPressCallback> onLongPress,
    Value<bool> selected,
  }) {
    return ListTileSetting(
      leading: leading ?? this.leading,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      trailing: trailing ?? this.trailing,
      isThreeLine: isThreeLine ?? this.isThreeLine,
      dense: dense ?? this.dense,
      contentPadding: contentPadding ?? this.contentPadding,
      enabled: enabled ?? this.enabled,
      onTap: onTap ?? this.onTap,
      onLongPress: onLongPress ?? this.onLongPress,
      selected: selected ?? this.selected,
    );
  }
}
