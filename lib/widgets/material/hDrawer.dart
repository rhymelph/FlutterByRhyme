import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DrawerDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Drawer';
  final String detail = '''A material design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.
Drawers are typically used with the Scaffold.drawer property. The child of the drawer is usually a ListView whose first child is a DrawerHeader that displays status information about the current user. The remaining drawer children are often constructed with ListTiles, often concluding with an AboutListTile.
An open drawer can be closed by calling Navigator.pop. For example a drawer item might close the drawer when tapped:''';

  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends ExampleState<DrawerDemo> {
  DrawerSetting setting;
  DrawerLayoutSetting layoutSetting;

  bool isExpaned = false;

  @override
  void initState() {
    layoutSetting = DrawerLayoutSetting(
      curve: curveValues[0],
      padding: paddingValues[0],
      margin: marginValues[0],
      duration: durationValues[0],
    );

    setting = DrawerSetting(
      elevation: doubleLargeValues[0],
      widget: Value(
        name: 'child',
        value: DrawerLayout(setting: layoutSetting,),
        label: getChild(),
      ),

    );
    super.initState();
  }

  String getChild() {
    return '''ListView(
      children: <Widget>[
        DrawerHeader(
          padding: ${layoutSetting.padding?.label ?? ''},
            margin: ${layoutSetting.margin?.label ?? ''},
            curve: ${layoutSetting.curve?.label ?? ''},
            duration: ${layoutSetting.duration?.label ?? ''},
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/burgers.jpg'),
              ),
            )),
        ListTile(
          title: Text('person'),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text('about'),
          leading: Icon(Icons.info),
        ),
      ],
    )''';
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Drawer(
        elevation: ${setting.elevation?.label??''},
        semanticLabel: 'Drawer',
        child: ${setting.widget?.label??''},
      )''';
  }
  Widget returnWidget(){
    return Drawer(
      elevation: setting.elevation?.value,
      semanticLabel: 'Drawer',
      child: setting.widget?.value,
    );
  }
  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kSave,
        onPressed: () {
          Navigator.pop(
              context,
              Value<Widget>(
                name: 'Drawer',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ExpansionPanelTitleWidget(
        isExpanded: isExpaned,
        titleWidget: ValueTitleWidget(StringParams.kDrawerHeader),
        hintWidget: getExpansionLast(),
        onChanged: (value) {
          setState(() {
            isExpaned = value;
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

  Widget getExpansionLast() {
    return Column(
      children: <Widget>[
        ValueTitleWidget(StringParams.kMargin),
        RadioGroupWidget(layoutSetting.margin, marginValues, (value) {
          setState(() {
            layoutSetting = layoutSetting.copyWith(margin: value);
            setting = setting.copyWith(
              widget: Value(
                name: setting.widget.name,
                value: DrawerLayout(setting: layoutSetting,),
                label: getChild(),
              ),
            );
          });
        }),
        ValueTitleWidget(StringParams.kPadding),
        RadioGroupWidget(layoutSetting.padding, paddingValues, (value) {
          setState(() {
            layoutSetting = layoutSetting.copyWith(padding: value);
            setting = setting.copyWith(
              widget: Value(
                name: setting.widget.name,
                value: DrawerLayout(setting: layoutSetting,),
                label: getChild(),
              ),
            );
          });
        }),
        ValueTitleWidget(StringParams.kDuration),
        RadioGroupWidget(layoutSetting.duration, durationValues, (value) {
          setState(() {
            layoutSetting = layoutSetting.copyWith(duration: value);
            setting = setting.copyWith(
              widget: Value(
                name: setting.widget.name,
                value: DrawerLayout(setting: layoutSetting,),
                label: getChild(),
              ),
            );
          });
        }),
        ValueTitleWidget(StringParams.kCurve),
        RadioGroupWidget(layoutSetting.curve, curveValues, (value) {
          setState(() {
            layoutSetting = layoutSetting.copyWith(curve: value);
            setting = setting.copyWith(
              widget: Value(
                name: setting.widget.name,
                value: DrawerLayout(setting: layoutSetting,),
                label: getChild(),
              ),
            );
          });
        }),
      ],
    );
  }

  @override
  String getTitle() {
    return 'Drawer';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        elevation: setting.elevation?.value,
        semanticLabel: 'Drawer',
        child: setting.widget?.value,
      ),
    );
  }
}

class DrawerSetting {
  final Value<double> elevation;
  final Value<bool> isOpen;
  final Value<Widget> widget;
  final Value<bool> isEnd;

  DrawerSetting({
    this.elevation,
    this.isOpen,
    this.widget,
    this.isEnd,
  });

  DrawerSetting copyWith({
    Value<double> elevation,
    Value<bool> isOpen,
    Value<Widget> widget,
    Value<bool> isEnd,
  }) {
    return DrawerSetting(
      elevation: elevation ?? this.elevation,
      isOpen: isOpen ?? this.isOpen,
      widget: widget ?? this.widget,
      isEnd: isEnd ?? this.isOpen,
    );
  }
}

class DrawerLayout extends StatelessWidget {
  final DrawerLayoutSetting setting;

  const DrawerLayout({Key key, this.setting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
            padding: setting.padding?.value,
            margin: setting.margin?.value,
            curve: setting.curve?.value,
            duration: setting.duration?.value,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/burgers.jpg'),
              ),
            )),
        ListTile(
          title: Text('person'),
          leading: Icon(Icons.person),
        ),
        ListTile(
          title: Text('about'),
          leading: Icon(Icons.info),
        ),
      ],
    );
  }
}

class DrawerLayoutSetting {
  final Value<EdgeInsetsGeometry> padding;
  final Value<EdgeInsetsGeometry> margin;
  final Value<Curve> curve;
  final Value<Duration> duration;

  DrawerLayoutSetting({this.padding, this.margin, this.curve, this.duration});

  DrawerLayoutSetting copyWith({
    Value<EdgeInsetsGeometry> padding,
    Value<EdgeInsetsGeometry> margin,
    Value<Curve> curve,
    Value<Duration> duration,
  }) {
    return DrawerLayoutSetting(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}