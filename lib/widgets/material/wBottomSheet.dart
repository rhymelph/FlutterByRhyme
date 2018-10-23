import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class BottomSheetDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/BottomSheet';
  final String detail = '''材料设计底页。

材料设计中有两种底板：

持久性。持久性底部工作表显示补充应用程序主要内容的信息。即使用户与应用程序的其他部分进行交互，持久性底部工作表仍然可见。可以使用ScaffoldState.showBottomSheet函数或通过指定 Scaffold.bottomSheet构造函数参数来创建和显示持久性底部工作表 。

莫代尔。模态底部工作表是菜单或对话框的替代方案，可防止用户与应用程序的其余部分进行交互。可以使用showModalBottomSheet 函数创建和显示模态底部工作表。

该BottomSheet小部件本身很少直接使用。相反，更喜欢使用ScaffoldState.showBottomSheet或 Scaffold.bottomSheet创建持久性底部工作表，并使用showModalBottomSheet创建模式底部工作表。''';

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
            vsync: this,//class _AState extends State<A> with SingleTickerProviderStateMixin
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
              setting = setting.copyWith(
                animationController: Value(
                  name: 'controller',
                  value: getAnimationController(value.value),
                  label: value.label,
                ),
              );
            });
          },
        ),
      ),
      SwitchValueTitleWidget(
        title: StringParams.kIsShowModal,
        value: setting.isShowModal,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isShowModal: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kEnableDrag,
        value: setting.enableDrag,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(enableDrag: value);
          });
        },
      ),

    ];
  }
  AnimationController getAnimationController(
      AnimationControllerSetting controllSetting) {
    setting.animationController.value.repeat(min: controllSetting.lowerBound?.value,
    max: controllSetting.upperBound?.value,period: controllSetting.duration?.value);
    setting.animationController.value.value=controllSetting.value.value;
    return setting.animationController.value;
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

  BottomSheetSetting(
      {this.onClosing,
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
