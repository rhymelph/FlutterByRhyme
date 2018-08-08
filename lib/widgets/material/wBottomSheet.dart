import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BottomSheetDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/BottomSheet';
  final String detail = '''A material design bottom sheet.
There are two kinds of bottom sheets in material design:
Persistent. A persistent bottom sheet shows information that supplements the primary content of the app. A persistent bottom sheet remains visible even when the user interacts with other parts of the app. Persistent bottom sheets can be created and displayed with the ScaffoldState.showBottomSheet function.
Modal. A modal bottom sheet is an alternative to a menu or a dialog and prevents the user from interacting with the rest of the app. Modal bottom sheets can be created and displayed with the showModalBottomSheet function.
The BottomSheet widget itself is rarely used directly. Instead, prefer to create a persistent bottom sheet with ScaffoldState.showBottomSheet and a modal bottom sheet with showModalBottomSheet.
See also:
ScaffoldState.showBottomSheet
showModalBottomSheet
material.google.com/components/bottom-sheets.html''';

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends ExampleState<BottomSheetDemo>
    with SingleTickerProviderStateMixin {
  BottomSheetSetting setting;

  @override
  void initState() {
    setting = BottomSheetSetting(
      onClosing: Value(
        name: 'onClose',
        value: () {
          //todo closing listener
        },
        label: '''(){
          //todo 关闭监听
        }''',
      ),
      builder: Value(
        name: 'builder',
        value: (BuildContext context) {
          return Center(
            child: Image.asset('images/burgers.jpg'),
          );
        },
        label: '''(BuildContext context){
          return Center(
            child: Image.asset('images/burgers.jpg'),
          );
        }''',
      ),
      enableDrag: boolValues[1],
      isShowModal: boolValues[0],
      animationController: Value(
        name: 'controller',
        value: AnimationController(
          vsync: this,
          lowerBound: 0.0,
          upperBound: 1.0,
          duration: durationValues[0].value,
        ),
        label: '''AnimationController(
            vsync: this,
            lowerBound: 0.0,
            upperBound: 1.0,
            duration: durationValues[0].value,
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
    String onPressed = setting.isShowModal.value
        ? '''showModalBottomSheet(context: scaffoldKey.currentContext, builder: (BuildContext context){
              return getBottomSheet();
            });'''
        : '''scaffoldKey.currentState.showBottomSheet((BuildContext context) {
              return getBottomSheet();
            });''';
    return '''FlatButton(
        onPressed: () {
//scaffoldKey is Scallold key
          $onPressed
        },
        child: Text('${setting.isShowModal.value
        ? 'Show Modal BottomSheet'
        : 'Show BottomSheet'}'),
      )
Widget getBottomSheet() {
  return BottomSheet(
      onClosing: ${setting.onClosing?.label ?? ''},
      builder: ${setting.builder?.label ?? ''},
      animationController: ${setting.animationController?.label ?? ''},
      enableDrag: ${setting.enableDrag?.label ?? ''},
   );
}''';
  }

  bool isExpanded = false;

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
        title: 'Use Modal',
        value: setting.isShowModal,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isShowModal: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: 'enableDrag',
        value: setting.enableDrag,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(enableDrag: value);
          });
        },
      ),
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (value) {
          setState(() {
            this.isExpanded = value;
          });
        },
        titleWidget: ValueTitleWidget('AnimationController'),
        hintWidget: AnimationControllerDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(animationController: Value(
                  name: 'controller',
                  value: AnimationController(vsync: this,
                    value: value.value.value.value,
                    lowerBound: value.value.lowerBound.value,
                    upperBound: value.value.upperBound.value,
                    duration: value.value.duration.value,),
                  label: value.label,
              ),);
            });
          },
        ),
      )
    ];
  }

  @override
  String getTitle() {
    return 'BottomSheet';
  }

  Widget getBottomSheet() {
    return BottomSheet(
      onClosing: setting.onClosing?.value,
      builder: setting.builder?.value,
      animationController: setting.animationController?.value,
      enableDrag: setting.enableDrag?.value,
    );
  }

  @override
  Widget getWidget() {
    return Center(
      child: FlatButton(
        onPressed: () {
          if (setting.isShowModal.value) {
            showModalBottomSheet(
                context: scaffoldKey.currentContext,
                builder: (BuildContext context) {
                  return getBottomSheet();
                });
          } else {
            scaffoldKey.currentState.showBottomSheet((BuildContext context) {
              return getBottomSheet();
            });
          }
        },
        child: Text(setting.isShowModal.value
            ? 'Show Modal BottomSheet'
            : 'Show BottomSheet'),
      ),
    );
  }
}

class BottomSheetSetting {
  final Value<bool> isShowModal;
  final Value<VoidCallback> onClosing;
  final Value<WidgetBuilder> builder;
  final Value<AnimationController> animationController;
  final Value<bool> enableDrag;

  BottomSheetSetting({this.onClosing,
    this.isShowModal,
    this.builder,
    this.animationController,
    this.enableDrag});

  BottomSheetSetting copyWith({
    Value<bool> isShowModal,
    Value<VoidCallback> onClosing,
    Value<WidgetBuilder> builder,
    Value<AnimationController> animationController,
    Value<bool> enableDrag,
  }) {
    return BottomSheetSetting(
      isShowModal: isShowModal ?? this.isShowModal,
      onClosing: onClosing ?? this.onClosing,
      builder: builder ?? this.builder,
      animationController: animationController ?? this.animationController,
      enableDrag: enableDrag ?? this.enableDrag,
    );
  }
}
