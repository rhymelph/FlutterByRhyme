import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoButton';
  final String detail = '''''';

  @override
  _CupertinoButtonDemoState createState() => _CupertinoButtonDemoState();
}

class _CupertinoButtonDemoState extends ExampleState<CupertinoButtonDemo> {
  CupertinoButtonSetting setting;

  @override
  void initState() {
    setting = CupertinoButtonSetting(
      child: Value(
        value: Text('This is CupertinoButton'),
        label: "Text('This is CupertinoButton')",
      ),
      onPressed: Value(
        value: (){
          //todo pressed listener
        },
        label:'(){}',
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
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kRadius),
      RadioGroupWidget(setting.borderRadius, borderRadiusValues, (value){
        setState(() {
         setting=setting.copyWith(borderRadius: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleOneValues,
        title: StringParams.kPressedOpacity,
        value: setting.pressedOpacity,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(pressedOpacity: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kMinSize,
        value: setting.minSize,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(minSize: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoButton';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoButton(
        child: setting.child?.value,
        onPressed: setting.onPressed?.value,
        color: setting.color?.value,
        minSize: setting.minSize?.value,
        pressedOpacity: setting.pressedOpacity?.value,
        borderRadius: setting.borderRadius?.value,
        padding: setting.padding?.value,
      ),
    );
  }
}

class CupertinoButtonSetting {
  final Value<Widget> child;
  final Value<EdgeInsetsGeometry> padding;
  final Value<Color> color;
  final Value<double> minSize;
  final Value<double> pressedOpacity;
  final Value<BorderRadius> borderRadius;
  final Value<VoidCallback> onPressed;

  CupertinoButtonSetting({
    this.child,
    this.padding,
    this.color,
    this.minSize,
    this.pressedOpacity,
    this.borderRadius,
    this.onPressed,
  });

  CupertinoButtonSetting copyWith({
    Value<Widget> child,
    Value<EdgeInsetsGeometry> padding,
    Value<Color> color,
    Value<double> minSize,
    Value<double> pressedOpacity,
    Value<BorderRadius> borderRadius,
    Value<VoidCallback> onPressed,
  }) {
    return CupertinoButtonSetting(
      child: child ?? this.child,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      minSize: minSize ?? this.minSize,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      borderRadius: borderRadius ?? this.borderRadius,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}
