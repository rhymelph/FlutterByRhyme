import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AppBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/AppBar';
  final String detail='''材料设计应用栏。

应用栏由工具栏和可能的其他小部件组成，例如 TabBar和FlexibleSpaceBar。应用程序栏通常会使用IconButton公开一个或多个常见操作，对于不太常见的操作（有时称为“溢出菜单”），可选地后跟 PopupMenuButton。

应用栏通常用于Scaffold.appBar属性，该属性将应用栏放置在屏幕顶部的固定高度小部件中。对于可滚动的应用栏，请参阅SliverAppBar，它将AppBar嵌入到条子中以便在CustomScrollView中使用。

AppBar 在底部（如果有）上方显示工具栏小部件，前导，标题和操作。所述底部通常用于一个的TabBar。如果指定了flexibleSpace窗口小部件，则它将堆叠在工具栏和底部窗口小部件后面''';

  @override
  _AppBarDemoState createState() => _AppBarDemoState();
}

class _AppBarDemoState extends ExampleState<AppBarDemo> {
  AppBarSetting setting;

  bool isExpanded = false;

  @override
  void initState() {
    setting = AppBarSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AppBar(
        leading: ${setting.leading?.label ?? ''},
        automaticallyImplyLeading: ${setting.automaticallyImplyLeading?.label ??
        ''},
        title: Text('${setting.title?.label ?? ''}'),
        actions: ${setting.actions?.label ?? ''},
        flexibleSpace: ${setting.flexibleSpace?.label ?? ''},
        bottom: ${setting.bottom?.label ?? ''},
        elevation: ${setting.elevation?.label ?? ''},
        backgroundColor: ${setting.backgroundColor?.label ?? ''},
        brightness: ${setting.brightness?.label ?? ''},
        iconTheme: ${setting.iconTheme?.label ?? ''},
        primary: ${setting.primary?.label ?? ''},
        centerTitle: ${setting.centerTitle?.label ?? ''},
        titleSpacing: ${setting.titleSpacing?.label ?? ''},
        toolbarOpacity: ${setting.toolbarOpacity?.label ?? ''},
        bottomOpacity: ${setting.bottomOpacity?.label ?? ''},
      )''';
//        textTheme: ${setting.textTheme?.label ?? ''},
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kSave,
        onPressed: () {
          Navigator.pop(
              context,
              Value<PreferredSizeWidget>(
                name: 'AppBar',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ValueTitleButtonWidget(
        title: StringParams.kBottom,
        onPressed: () {
          Navigator.pushNamed(context, 'widgets/material/TabBar');
        },
      ),
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        titleWidget: ValueTitleWidget(StringParams.kIconTheme),
        hintWidget: IconThemeDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(iconTheme: value);
            });
          },
        ),
        onChanged: (isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
      ),
//      ValueTitleWidget(StringParams.kTextTheme),

      ValueTitleWidget(StringParams.kLeading),
      RadioGroupWidget(setting.leading, iconButtonValues, (value) {
        setState(() {
          setting = setting.copyWith(leading: value);
        });
      }),
      ValueTitleWidget(StringParams.kActions),
      RadioGroupWidget(setting.actions, actionsValues, (value) {
        setState(() {
          setting = setting.copyWith(actions: value);
        });
      }),
      ValueTitleWidget(StringParams.kFlexibleSpace),
      RadioGroupWidget(setting.flexibleSpace, flexibleSpaceValues, (value) {
        setState(() {
          setting = setting.copyWith(flexibleSpace: value);
        });
      }),
      ValueTitleWidget(StringParams.kBrightness),
      RadioGroupWidget(setting.brightness, colorBrightnessValues, (value) {
        setState(() {
          setting = setting.copyWith(brightness: value);
        });
      }),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor,  (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),

      EditTextTitleWidget(StringParams.kTitle, setting.title, (value) {
        setState(() {
          setting = setting.copyWith(title: value);
        });
      }),

      DropDownValueTitleWidget(
        selectList: sizeValues,
        title: StringParams.kElevation,
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kPrimary,
        value: setting.primary,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(primary: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kAutomaticallyImplyLeading,
        value: setting.automaticallyImplyLeading,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(automaticallyImplyLeading: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kCenterTitle,
        value: setting.centerTitle,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(centerTitle: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: sizeValues,
        title: StringParams.kTitleSpacing,
        value: setting.titleSpacing,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(titleSpacing: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kToolbarOpacity),
      SeekBarGroupWidget(setting.toolbarOpacity, (value) {
        setState(() {
          setting = setting.copyWith(toolbarOpacity: value);
        });
      }),
      ValueTitleWidget(StringParams.kBottomOpacity),
      SeekBarGroupWidget(setting.bottomOpacity, (value) {
        setState(() {
          setting = setting.copyWith(bottomOpacity: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AppBar';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: returnWidget(),
      body: Center(
        child: Text('Body'),
      ),
    );
  }

  PreferredSizeWidget returnWidget() {
    return AppBar(
      leading: setting.leading?.value,
      automaticallyImplyLeading: setting.automaticallyImplyLeading?.value,
      title: Text(setting.title?.value??''),
      actions: setting.actions?.value,
      flexibleSpace: setting.flexibleSpace?.value,
      bottom: setting.bottom?.value,
      elevation: setting.elevation?.value,
      backgroundColor: setting.backgroundColor?.value,
      brightness: setting.brightness?.value,
      iconTheme: setting.iconTheme?.value,
//      textTheme: setting.textTheme?.value,
      primary: setting.primary?.value,
      centerTitle: setting.centerTitle?.value,
      titleSpacing: setting.titleSpacing?.value,
      toolbarOpacity: setting.toolbarOpacity?.value,
      bottomOpacity: setting.bottomOpacity?.value,
    );
  }
}

class AppBarSetting {
  final Value<Widget> leading;
  final Value<bool> automaticallyImplyLeading;
  final Value<String> title;
  final Value<List<Widget>> actions;
  final Value<Widget> flexibleSpace;
  final Value<PreferredSizeWidget> bottom;
  final Value<double> elevation;
  final Value<Color> backgroundColor;
  final Value<Brightness> brightness;
  final Value<IconThemeData> iconTheme;
//  final Value<TextTheme> textTheme;
  final Value<bool> primary;
  final Value<bool> centerTitle;
  final Value<double> titleSpacing;
  final Value<double> toolbarOpacity;
  final Value<double> bottomOpacity;

  AppBarSetting({
    this.leading,
    this.automaticallyImplyLeading: const Value<bool>(
      name: 'true',
      value: true,
      label: 'true',
    ),
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation: const Value<double>(
      name: '4.0',
      value: 4.0,
      label: '4.0',
    ),
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
//    this.textTheme,
    this.primary: const Value<bool>(
      name: 'true',
      value: true,
      label: 'true',
    ),
    this.centerTitle,
    this.titleSpacing: const Value<double>(
      name: '16.0',
      value: 16.0,
      label: '16.0',
    ),
    this.toolbarOpacity: const Value<double>(
      name: '1.0',
      value: 1.0,
      label: '1.0',
    ),
    this.bottomOpacity: const Value<double>(
      name: '1.0',
      value: 1.0,
      label: '1.0',
    ),
  });

  AppBarSetting copyWith({
    Value<Widget> leading,
    Value<bool> automaticallyImplyLeading,
    Value<String> title,
    Value<List<Widget>> actions,
    Value<Widget> flexibleSpace,
    Value<PreferredSizeWidget> bottom,
    Value<double> elevation,
    Value<Color> backgroundColor,
    Value<Brightness> brightness,
    Value<IconThemeData> iconTheme,
    Value<TextTheme> textTheme,
    Value<bool> primary,
    Value<bool> centerTitle,
    Value<double> titleSpacing,
    Value<double> toolbarOpacity,
    Value<double> bottomOpacity,
  }) {
    return AppBarSetting(
      leading: leading ?? this.leading,
      automaticallyImplyLeading:
          automaticallyImplyLeading ?? this.automaticallyImplyLeading,
      title: title ?? this.title,
      actions: actions ?? this.actions,
      flexibleSpace: flexibleSpace ?? this.flexibleSpace,
      bottom: bottom ?? this.bottom,
      elevation: elevation ?? this.elevation,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      brightness: brightness ?? this.brightness,
      iconTheme: iconTheme ?? this.iconTheme,
//      textTheme: textTheme ?? this.textTheme,
      primary: primary ?? this.primary,
      centerTitle: centerTitle ?? this.centerTitle,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      toolbarOpacity: toolbarOpacity ?? this.toolbarOpacity,
      bottomOpacity: bottomOpacity ?? this.bottomOpacity,
    );
  }
}

class IconThemeDemo extends StatefulWidget {
  IconThemeDemo({Key key, this.onchange}) : super(key: key);

  final ValueChanged<Value<IconThemeData>> onchange;

  @override
  _IconThemeDemoState createState() => _IconThemeDemoState();
}

class _IconThemeDemoState extends State<IconThemeDemo> {
  IconThemeSetting setting;

  @override
  void initState() {
    setting = IconThemeSetting();
    super.initState();
  }

  void changeValue() {
    widget.onchange(
      Value(
        name: '',
        value: setting.onChange(),
        label: getExampleCode(),
      ),
    );
  }

  String getExampleCode() {
    return '''IconThemeData(
      color: ${setting.color?.label ?? ''},
      opacity: ${setting.opacity?.label ?? ''},
      size: ${setting.size?.label ?? ''},
    )''';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ValueTitleWidget(StringParams.kColor),
        ColorGroupWidget(setting.color,  (value) {
          setState(() {
            setting = setting.copyWith(color: value);
            changeValue();
          });
        }),
        ValueTitleWidget(StringParams.kOpacity),
        SeekBarGroupWidget(setting.opacity, (value) {
          setState(() {
            setting = setting.copyWith(opacity: value);
            changeValue();
          });
        }),
        DropDownValueTitleWidget(
          selectList: sizeValues,
          title: StringParams.kSize,
          value: setting.size,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(size: value);
              changeValue();
            });
          },
        )
      ],
    );
  }
}

class IconThemeSetting {
  final Value<Color> color;
  final Value<double> opacity;
  final Value<double> size;

  IconThemeSetting({
    this.color,
    this.opacity: const Value(name: '1.0', value: 1.0, label: '1.0'),
    this.size,
  });

  IconThemeSetting copyWith({
    Value<Color> color,
    Value<double> opacity,
    Value<double> size,
  }) {
    return IconThemeSetting(
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      size: size ?? this.size,
    );
  }

  IconThemeData onChange() {
    return IconThemeData(
      color: color?.value,
      opacity: opacity?.value,
      size: size?.value,
    );
  }
}
