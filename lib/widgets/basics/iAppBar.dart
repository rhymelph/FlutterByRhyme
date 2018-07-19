import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AppBarDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/AppBar';

  @override
  _AppBarDemoState createState() => _AppBarDemoState();
}

class _AppBarDemoState extends ExampleState<AppBarDemo> {
  AppBarSetting setting;

  @override
  void initState() {
    setting = AppBarSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return '';
  }

  @override
  String getExampleCode() {
    return '';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kLeading),
      SwitchValueTitleWidget(
        title: StringParams.kAutomaticallyImplyLeading,
        value: setting.automaticallyImplyLeading,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(automaticallyImplyLeading: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kTitle),
      EditTextGroupWidget(setting.title, (value) {
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
      ValueTitleWidget(StringParams.kIconTheme),
      ValueTitleWidget(StringParams.kTextTheme),
      ValueTitleWidget(StringParams.kPrimary),
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
    CircularProgressIndicator();
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Center(
        child: Text('Body'),
      ),
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

  final ValueChanged<IconThemeData> onchange;

  @override
  _IconThemeDemoState createState() => _IconThemeDemoState();
}

class _IconThemeDemoState extends State<IconThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IconThemeSetting {
  final Value<Color> color;
  final Value<double> opacity;
  final Value<double> size;

  IconThemeSetting({this.color, this.opacity, this.size});

  IconThemeSetting copyWith(
    Value<Color> color,
    Value<double> opacity,
    Value<double> size,
  ) {
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
