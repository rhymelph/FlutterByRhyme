import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoPickerDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoPicker';
  final String detail = '''iOS风格的选择器。

在车轮上显示其子窗口小部件以供选择，并在当前所选项目更改时回调。

可以与showModalBottomSheet一起使用，以在屏幕底部以模态方式显示选择器。''';

  @override
  _CupertinoPickerDemoState createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends ExampleState<CupertinoPickerDemo> {
  CupertinoPickerSetting setting;

  List<String> list = [
    'Android',
    'IOS',
    'Flutter',
    'Java',
    'Kotlin',
    'Dart',
    'Object-C',
    'Swift',
    'PC',
    'Phython',
    'PHP',
  ];

  @override
  void initState() {
    setting = CupertinoPickerSetting(
      children: Value(
        value: list.map((s) => Center(child: Text(s))).toList(),
        label: 'list.map((s) => Center(child: Text(s))).toList()',
      ),
      diameterRatio: doubleOneUpValues[0],
      backgroundColor: colorValues[0],
      offAxisFraction: doubleLargeValues[0],
      magnification: doubleOneUpValues[1],
      useMagnifier: boolValues[0],
      scrollController: Value(
        value: FixedExtentScrollController(),
        label: 'FixedExtentScrollController()',
      ),
      itemExtent: doubleXlargeValues[0],
      onSelectedItemChanged: Value(value: (int position) {
        print('$position');
      }),
      looping: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => CupertinoPicker(
                    diameterRatio: ${setting.diameterRatio?.label??''},
                    backgroundColor: ${setting.backgroundColor?.label??''},
                    offAxisFraction: ${setting.offAxisFraction?.label??''},
                    useMagnifier: ${setting.useMagnifier?.label??''},
                    magnification: ${setting.magnification?.label??''},
                    scrollController: ${setting.scrollController?.label??''},
                    itemExtent: ${setting.itemExtent?.label??''},
                    onSelectedItemChanged: ${setting.onSelectedItemChanged?.label??''},
                    children: ${setting.children?.label??''},
                    looping: ${setting.looping?.label??''},
                  ));
        },
        child: Text('Show CupertinoActionSheet'),
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value){
        setState(() {
          setting=setting.copyWith(backgroundColor: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: doubleXlargeValues,
        title: StringParams.kItemExtent,
        value: setting.itemExtent,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(itemExtent: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleOneUpValues,
        title: StringParams.kDiameterRatio,
        value: setting.diameterRatio,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(diameterRatio: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kOffAxisFraction,
        value: setting.offAxisFraction,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(offAxisFraction: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleOneUpValues,
        title: StringParams.kMagnification,
        value: setting.magnification,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(magnification: value);
          });
        },
      ),
      SwitchValueTitleWidget(title: StringParams.kUseMagnifier, value: setting.useMagnifier, onChanged: (value){
        setState(() {
          setting=setting.copyWith(useMagnifier: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kLooping, value: setting.looping, onChanged: (value){
        setState(() {
          setting=setting.copyWith(looping: value);
        });
      }),

    ];
  }

  @override
  String getTitle() {
    return 'CupertinoPicker';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => CupertinoPicker(
                    diameterRatio: setting.diameterRatio?.value,
                    backgroundColor: setting.backgroundColor?.value,
                    offAxisFraction: setting.offAxisFraction?.value,
                    useMagnifier: setting.useMagnifier?.value,
                    magnification: setting.magnification?.value,
                    scrollController: setting.scrollController?.value,
                    itemExtent: setting.itemExtent?.value,
                    onSelectedItemChanged: setting.onSelectedItemChanged?.value,
                    children: setting.children?.value,
                    looping: setting.looping?.value,
                  ));
        },
        child: Text('Show CupertinoActionSheet'),
      ),
    );
  }
}

class CupertinoPickerSetting {
  final Value<double> diameterRatio;
  final Value<Color> backgroundColor;
  final Value<double> offAxisFraction;
  final Value<bool> useMagnifier;
  final Value<double> magnification;
  final Value<ScrollController> scrollController;
  final Value<double> itemExtent;
  final Value<ValueChanged<int>> onSelectedItemChanged;
  final Value<List<Widget>> children;
  final Value<bool> looping;

  CupertinoPickerSetting({
    this.diameterRatio,
    this.backgroundColor,
    this.offAxisFraction,
    this.useMagnifier,
    this.magnification,
    this.scrollController,
    this.itemExtent,
    this.onSelectedItemChanged,
    this.children,
    this.looping,
  });

  CupertinoPickerSetting copyWith({
    Value<double> diameterRatio,
    Value<Color> backgroundColor,
    Value<double> offAxisFraction,
    Value<bool> useMagnifier,
    Value<double> magnification,
    Value<ScrollController> scrollController,
    Value<double> itemExtent,
    Value<ValueChanged<int>> onSelectedItemChanged,
    Value<List<Widget>> children,
    Value<bool> looping,
  }) {
    return CupertinoPickerSetting(
      diameterRatio: diameterRatio ?? this.diameterRatio,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      offAxisFraction: offAxisFraction ?? this.offAxisFraction,
      useMagnifier: useMagnifier ?? this.useMagnifier,
      magnification: magnification ?? this.magnification,
      scrollController: scrollController ?? this.scrollController,
      itemExtent: itemExtent ?? this.itemExtent,
      onSelectedItemChanged:
          onSelectedItemChanged ?? this.onSelectedItemChanged,
      children: children ?? this.children,
      looping: looping ?? this.looping,
    );
  }
}
