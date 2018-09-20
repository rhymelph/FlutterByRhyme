import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ExpansionPanelDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/ExpansionPanel';
  final String detail = '''材料扩展面板。它有一个标题和一个正文，可以展开或折叠。面板的主体仅在展开时可见。

扩展面板仅用作 ExpansionPanelList的子级。''';

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends ExampleState<ExpansionPanelDemo> {
  ExpansionPanelSetting setting;

  @override
  void initState() {
    setting = ExpansionPanelSetting(
      isExpanded: boolValues[0],
      body: Value(
        name: 'body',
        value: Center(
          child: Text('body'),
        ),
        label: '''Center(
          child: Text('body'),
        )''',
      ),
      headerBuilder: Value(
        name: 'headerBuilder',
        value: (BuildContext context, bool isExpanded) {
          return Center(child: Text(isExpanded?'title open':'title close'));
        },
        label: '''(BuildContext context, bool isExpanded) {
          return Center(child: Text(isExpanded?'title open':'title close'));
        }''',
      ),
      expansionCallback: Value(
        name: 'expansionCallback',
        value: (int position,bool isExpanded){
          //position is in the list
          setState(() {
            setting=setting.copyWith(isExpanded: boolValues[isExpanded?0:1]);
          });
        },
        label: ''' (int position,bool isExpanded){
          //position is in the list
          setState(() {
            this.isExpanded=isExpanded;
          });
        }''',
      ),
      animationDuration: durationValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''bool isExpanded=false;
ExpansionPanelList(
        children: [
          ExpansionPanel(
            headerBuilder: ${setting.headerBuilder.label??''},
            body: ${setting.body.label??''},
            isExpanded: isExpanded,
          ),
        ],
        expansionCallback: ${setting.expansionCallback?.label??''},
        animationDuration: ${setting.animationDuration?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    // TODO: implement getSetting
    return [
      ValueTitleWidget(StringParams.kAnimationDuration),
      RadioGroupWidget(setting.animationDuration, durationValues, (value){
        setState(() {
          setting=setting.copyWith(animationDuration: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kIsExpanded,
      value: setting.isExpanded,
      onChanged: (value){
        setState(() {
          setting=setting.copyWith(isExpanded: value);

        });
      },),

    ];
  }

  @override
  String getTitle() {
    return 'ExpansionPanel';
  }

  @override
  Widget getWidget() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        children: [
          ExpansionPanel(
            headerBuilder: setting.headerBuilder.value,
            body: setting.body.value,
            isExpanded: setting.isExpanded.value,
          ),
        ],
        expansionCallback: setting.expansionCallback?.value,
        animationDuration: setting.animationDuration?.value,
      ),
    );
  }
}

class ExpansionPanelSetting {
  final Value<Duration> animationDuration;
  final Value<ExpansionPanelCallback> expansionCallback;
  final Value<ExpansionPanelHeaderBuilder> headerBuilder;
  final Value<Widget> body;
  final Value<bool> isExpanded;

  ExpansionPanelSetting({
    this.animationDuration,
    this.expansionCallback,
    this.headerBuilder,
    this.body,
    this.isExpanded,
  });

  ExpansionPanelSetting copyWith({
    Value<Duration> animationDuration,
    Value<ExpansionPanelCallback> expansionCallback,
    Value<ExpansionPanelHeaderBuilder> headerBuilder,
    Value<Widget> body,
    Value<bool> isExpanded,
  }) {
    return ExpansionPanelSetting(
      animationDuration: animationDuration ?? this.animationDuration,
      expansionCallback: expansionCallback ?? this.expansionCallback,
      headerBuilder: headerBuilder ?? this.headerBuilder,
      body: body ?? this.body,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
