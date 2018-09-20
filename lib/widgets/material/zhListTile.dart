import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ListTileDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/ListTitle';

  final String detail = '''单个固定高度的行，通常包含一些文本以及前导或尾随图标。

列表磁贴包含一到三行文本，可选地两侧是图标或其他小部件，例如复选框。使用前导和尾随参数定义图块的图标（或其他小部件）。第一行文本不是可选的，并使用标题指定。的价值 字幕，这是可选的，将占据两行分配额外的文字行的空间，或者如果isThreeLine是真实的。如果密集 为真，那么此图块的整体高度和包装标题和副标题窗口小部件的DefaultTextStyle的大小 将减少。

列表图块始终是固定高度（高度取决于如何配置 三个线条，密集和字幕）; 它们的高度不会根据其内容增长。如果您正在寻找允许连续任意布局的小部件，请考虑Row。

列表切片通常在ListView中使用，或者安排在Drawer和Card中的Column中 。

需要其中一个祖先成为Material小部件。''';

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
