import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class ScaffoldDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Scaffold';
  final String detail =
      '''Implements the basic material design visual layout structure.
This class provides APIs for showing drawers, snack bars, and bottom sheets.
To display a snackbar or a persistent bottom sheet, obtain the ScaffoldState for the current BuildContext via Scaffold.of and use the ScaffoldState.showSnackBar and ScaffoldState.showBottomSheet functions.''';

  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends ExampleState<ScaffoldDemo> {
  ScaffoldSetting setting;

  @override
  void initState() {
    setting = ScaffoldSetting(
      body: const Value<Widget>(
        name: '',
        value: Center(
          child: Text('Body'),
        ),
        label: '''Center(
          child: Text('Body'),
        )''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''${setting.bottomNavigationBar?.label ==null? '':'int position=0;'}
    Scaffold(
      appBar: ${setting.appBar?.label ?? ''},
      body: ${setting.body?.label ?? ''},
      floatingActionButton: ${setting.floatingActionButton?.label ?? ''},
      floatingActionButtonLocation: ${setting.floatingActionButtonLocation
        ?.label ?? ''},
      floatingActionButtonAnimator: ${setting.floatingActionButtonAnimator
        ?.label ?? ''},
      persistentFooterButtons: ${setting.persistentFooterButtons?.label ?? ''},
      drawer: ${setting.drawer?.label ?? ''},
      endDrawer: ${setting.endDrawer?.label ?? ''},
      bottomNavigationBar: ${setting.bottomNavigationBar?.label ?? ''},
      backgroundColor: ${setting.backgroundColor?.label ?? ''},
      resizeToAvoidBottomPadding: ${setting.resizeToAvoidBottomPadding?.label ??
        ''},
      primary: ${setting.primary?.label ?? ''},
    )''';
  }


  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kAppBar,
        onPressed: () async {
          dynamic changeValue= await Navigator.pushNamed(context, 'widgets/basics/AppBar');
          if(changeValue!=null){
            setState(() {
              setting=setting.copyWith(appBar: changeValue);
            });
          }
        },
      ),
      ValueTitleButtonWidget(
        title: StringParams.kFloatingActionButton,
        onPressed: () async {
          dynamic changeValue =await Navigator.pushNamed(context, 'widgets/material/FloatingActionButton');
          if(changeValue!=null){
            setState(() {
              setting=setting.copyWith(floatingActionButton: changeValue);
            });
          }
        },
      ),
      ValueTitleWidget(StringParams.kFloatingActionButtonLocation),
      RadioGroupWidget(setting.floatingActionButtonLocation, floatingActionButtonLocationValues, (value){
        setState(() {
          setting=setting.copyWith(floatingActionButtonLocation: value);
        });
      }),
      ValueTitleWidget(StringParams.kFloatingActionButtonAnimator),
      RadioGroupWidget(setting.floatingActionButtonAnimator, floatingActionButtonAnimatorValues, (value){
        setState(() {
          setting=setting.copyWith(floatingActionButtonAnimator: value);
        });
      }),
      ValueTitleButtonWidget(
        title: StringParams.kDrawer,
        onPressed: () async {
          exampleKey.currentState.showToast('尚未完成!');

//          dynamic changeValue =await Navigator.pushNamed(context, 'widgets/material/Drawer');
//          if(changeValue!=null){
//            setState(() {
//              setting=setting.copyWith(drawer: changeValue);
//            });
//          }
        },
      ),
      ValueTitleButtonWidget(
        title: StringParams.kEndDrawer,
        onPressed: () async{
          dynamic changeValue =await Navigator.pushNamed(context, 'widgets/material/Drawer');
          if(changeValue!=null){
            setState(() {
              setting=setting.copyWith(endDrawer: changeValue);
            });
          }
        },
      ),
      ValueTitleButtonWidget(
        title: StringParams.kBottomNavigationBar,
        onPressed: () async{
          dynamic changeValue =await Navigator.pushNamed(context, 'widgets/material/BottomNavigationBar');
          if(changeValue!=null){
            setState(() {
              setting=setting.copyWith(bottomNavigationBar: changeValue);
            });
          }
        },
      ),
      ValueTitleWidget(StringParams.kBackground),
      ColorGroupWidget(setting.backgroundColor,  (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      SwitchValueTitleWidget(
        title: StringParams.kResizeToAvoidBottomPadding,
        value: setting.resizeToAvoidBottomPadding,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(resizeToAvoidBottomPadding: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kPrimary,
        value: setting.primary,
        onChanged: (value){
          setState(() {
            setting=setting.copyWith(primary: value);
          });
        },
      )
    ];
  }

  @override
  String getTitle() {
    return 'Scaffold';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      appBar: setting.appBar?.value,
      body: setting.body?.value,
      floatingActionButton: setting.floatingActionButton?.value,
      floatingActionButtonLocation: setting.floatingActionButtonLocation?.value,
      floatingActionButtonAnimator: setting.floatingActionButtonAnimator?.value,
      persistentFooterButtons: setting.persistentFooterButtons?.value,
      drawer: setting.drawer?.value,
      endDrawer: setting.endDrawer?.value,
      bottomNavigationBar: setting.bottomNavigationBar?.value,
      backgroundColor: setting.backgroundColor?.value,
      resizeToAvoidBottomPadding: setting.resizeToAvoidBottomPadding?.value,
      primary: setting.primary?.value,
    );
  }
}

class ScaffoldSetting {
  final Value<PreferredSizeWidget> appBar;
  final Value<Widget> body;
  final Value<Widget> floatingActionButton;
  final Value<FloatingActionButtonLocation> floatingActionButtonLocation;
  final Value<FloatingActionButtonAnimator> floatingActionButtonAnimator;
  final Value<List<Widget>> persistentFooterButtons;
  final Value<Widget> drawer;
  final Value<Widget> endDrawer;
  final Value<Widget> bottomNavigationBar;
  final Value<Color> backgroundColor;
  final Value<bool> resizeToAvoidBottomPadding;
  final Value<bool> primary;

  ScaffoldSetting({
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding: const Value<bool>(
      name: 'true',
      value: true,
      label: 'true',
    ),
    this.primary: const Value<bool>(
      name: 'true',
      value: true,
      label: 'true',
    ),
  });

  ScaffoldSetting copyWith({
    Value<PreferredSizeWidget> appBar,
    Value<Widget> body,
    Value<Widget> floatingActionButton,
    Value<FloatingActionButtonLocation> floatingActionButtonLocation,
    Value<FloatingActionButtonAnimator> floatingActionButtonAnimator,
    Value<List<Widget>> persistentFooterButtons,
    Value<Widget> drawer,
    Value<Widget> endDrawer,
    Value<Widget> bottomNavigationBar,
    Value<Color> backgroundColor,
    Value<bool> resizeToAvoidBottomPadding,
    Value<bool> primary,
  }) {
    return new ScaffoldSetting(
      appBar: appBar ?? this.appBar,
      body: body ?? this.body,
      floatingActionButton: floatingActionButton ?? this.floatingActionButton,
      floatingActionButtonLocation:
          floatingActionButtonLocation ?? this.floatingActionButtonLocation,
      floatingActionButtonAnimator:
          floatingActionButtonAnimator ?? this.floatingActionButtonAnimator,
      persistentFooterButtons:
          persistentFooterButtons ?? this.persistentFooterButtons,
      drawer: drawer ?? this.drawer,
      endDrawer: endDrawer ?? this.drawer,
      bottomNavigationBar: bottomNavigationBar ?? this.bottomNavigationBar,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      resizeToAvoidBottomPadding:
          resizeToAvoidBottomPadding ?? this.resizeToAvoidBottomPadding,
      primary: primary ?? this.primary,
    );
  }
}
