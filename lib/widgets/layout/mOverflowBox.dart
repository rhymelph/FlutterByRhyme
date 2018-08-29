import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class OverflowBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/OverflowBox';
  final String detail = '''''';

  @override
  _OverflowBoxDemoState createState() =>
      _OverflowBoxDemoState();
}

class _OverflowBoxDemoState
    extends ExampleState<OverflowBoxDemo> {
  OverflowBoxSetting setting;

  @override
  void initState() {
    setting = OverflowBoxSetting(
      maxWidth: doubleXlargeValues[0],
      minWidth: doubleXlargeValues[0],
      maxHeight: doubleXlargeValues[0],
      minHeight: doubleXlargeValues[0],
      alignment: alignmentValues[0],
      child: Value(
        value: Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(color: Colors.grey),
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        ),
        label: '''SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
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
    return '''OverflowBox(
      maxHeight: ${setting.maxHeight?.label??''},
      minHeight: ${setting.minHeight?.label??''},
      maxWidth: ${setting.maxWidth?.label??''},
      minWidth: ${setting.minWidth?.label??''},
      alignment: ${setting.alignment?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget(setting.alignment, alignmentValues, (value){
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMinHeight,
        value: setting.minHeight,
        onChanged: (value) {
          if(setting.maxHeight.value<value.value){
            exampleKey.currentState.showToast('最小高度不能大于最大高度');
            return;
          }
          setState(() {
            setting = setting.copyWith(minHeight: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMinWidth,
        value: setting.minWidth,
        onChanged: (value) {
          if(setting.maxWidth.value<value.value){
            exampleKey.currentState.showToast('最小宽度不能大于最大宽度');
            return;
          }
          setState(() {
            setting = setting.copyWith(minWidth: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMaxHeight,
        value: setting.maxHeight,
        onChanged: (value) {
          if(value.value<setting.minHeight.value){
            exampleKey.currentState.showToast('最大高度不能小于最小高度');
            return;
          }
          setState(() {
            setting = setting.copyWith(maxHeight: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMaxWidth,
        value: setting.maxWidth,
        onChanged: (value) {
          if(value.value<setting.minWidth.value){
            exampleKey.currentState.showToast('最大宽度不能小于最小宽度');
            return;
          }
          setState(() {
            setting = setting.copyWith(maxWidth: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'OverflowBox';
  }


  @override
  Widget getWidget() {
    return OverflowBox(
      maxHeight: setting.maxHeight?.value,
      minHeight: setting.minHeight?.value,
      maxWidth: setting.maxWidth?.value,
      minWidth: setting.minWidth?.value,
      alignment: setting.alignment?.value,
      child: setting.child?.value,
    );
  }
}

class OverflowBoxSetting {
  final Value<double> maxWidth;
  final Value<double> minWidth;
  final Value<double> minHeight;
  final Value<double> maxHeight;
  final Value<AlignmentGeometry> alignment;
  final Value<Widget> child;

  OverflowBoxSetting({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.alignment,
    this.child,
  });

  OverflowBoxSetting copyWith({
    Value<double> maxWidth,
    Value<double> minWidth,
    Value<double> minHeight,
    Value<double> maxHeight,
    Value<AlignmentGeometry> alignment,
    Value<Widget> child,
  }) {
    return OverflowBoxSetting(
      maxWidth: maxWidth??this.maxWidth,
      minWidth: minWidth??this.minWidth,
      maxHeight: maxHeight??this.maxHeight,
      minHeight: minHeight??this.minHeight,
      alignment: alignment??this.alignment,
      child: child??this.child,
    );
  }
}

