import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AppBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/AppBar';
  final String detail='''A material design app bar.
An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar. App bars typically expose one or more common actions with IconButtons which are optionally followed by a PopupMenuButton for less common operations (sometimes called the "overflow menu").
App bars are typically used in the Scaffold.appBar property, which places the app bar as a fixed-height widget at the top of the screen. For a scrollable app bar, see SliverAppBar, which embeds an AppBar in a sliver for use in a CustomScrollView.
The AppBar displays the toolbar widgets, leading, title, and actions, above the bottom (if any). The bottom is usually used for a TabBar. If a flexibleSpace widget is specified then it is stacked behind the toolbar and the bottom widget. The following diagram shows where each of these slots appears in the toolbar when the writing language is left-to-right (e.g. English):''';

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
        title: ${setting.title?.label ?? ''},
        actions: ${setting.actions?.label ?? ''},
        flexibleSpace: ${setting.flexibleSpace?.label ?? ''},
        bottom: ${setting.bottom?.label ?? ''},
        elevation: ${setting.elevation?.label ?? ''},
        backgroundColor: ${setting.backgroundColor?.label ?? ''},
        brightness: ${setting.brightness?.label ?? ''},
        iconTheme: ${setting.iconTheme?.label ?? ''},
        textTheme: ${setting.textTheme?.label ?? ''},
        primary: ${setting.primary?.label ?? ''},
        centerTitle: ${setting.centerTitle?.label ?? ''},
        titleSpacing: ${setting.titleSpacing?.label ?? ''},
        toolbarOpacity: ${setting.toolbarOpacity?.label ?? ''},
        bottomOpacity: ${setting.bottomOpacity?.label ?? ''},
      )''';
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
      ValueTitleWidget(StringParams.kLeading),
      RadioGroupWidget(setting.leading, iconButtonValues, (value) {
        setState(() {
          setting = setting.copyWith(leading: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kAutomaticallyImplyLeading,
        value: setting.automaticallyImplyLeading,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(automaticallyImplyLeading: value);
          });
        },
      ),
      EditTextTitleWidget(StringParams.kTitle, setting.title, (value) {
        setState(() {
          setting = setting.copyWith(title: value);
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
      ValueTitleWidget(StringParams.kBottom),
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
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, colorValues, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kBrightness),
      RadioGroupWidget(setting.brightness, colorBrightnessValues, (value) {
        setState(() {
          setting = setting.copyWith(brightness: value);
        });
      }),
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
      ValueTitleWidget(StringParams.kTextTheme),
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
      title: setting.title?.value,
      actions: setting.actions?.value,
      flexibleSpace: setting.flexibleSpace?.value,
      bottom: setting.bottom?.value,
      elevation: setting.elevation?.value,
      backgroundColor: setting.backgroundColor?.value,
      brightness: setting.brightness?.value,
      iconTheme: setting.iconTheme?.value,
      textTheme: setting.textTheme?.value,
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
  final Value<Widget> title;
  final Value<List<Widget>> actions;
  final Value<Widget> flexibleSpace;
  final Value<PreferredSizeWidget> bottom;
  final Value<double> elevation;
  final Value<Color> backgroundColor;
  final Value<Brightness> brightness;
  final Value<IconThemeData> iconTheme;
  final Value<TextTheme> textTheme;
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
    this.textTheme,
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
    Value<Widget> title,
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
      textTheme: textTheme ?? this.textTheme,
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
        ColorGroupWidget(setting.color, colorValues, (value) {
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
