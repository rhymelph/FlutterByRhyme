import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ChipDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/Chip';
  final String detail = '''材料设计芯片。

芯片是表示属性，文本，实体或动作的紧凑元素。

提供非null onDeleted回调将导致芯片包含用于删除芯片的按钮。

需要其中一个祖先成为Material小部件。该标签， deleteIcon和border参数不能为空.''';

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends ExampleState<ChipDemo> {
  ChipSetting setting;

  @override
  void initState() {
    setting = ChipSetting(
        label: Value(
      value: Text('This is a Chip.'),
      label: "Text('This is a Chip')",
    ),
    onDeleted: onPressValues[0],);
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Chip(
        avatar: ${setting.avatar?.label??''},
        label: ${setting.label?.label??''},
        labelPadding: ${setting.labelPadding?.label??''},
        labelStyle: ${setting.labelStyle?.label??''},
        shape: ${setting.shape?.label??''},
        backgroundColor: ${setting.backgroundColor?.label??''},
        padding: ${setting.padding?.label??''},
        deleteIcon: ${setting.deleteIcon?.label??''},
        onDeleted: ${setting.onDeleted?.label??''},
        deleteIconColor: ${setting.deleteIconColor?.label??''},
        deleteButtonTooltipMessage: ${setting.deleteButtonTooltipMessage?.label??''},
      )''';
  }
//        materialTapTargetSize: ${setting.materialTapTargetSize?.label??''},

  bool isExpanded = false;

  @override
  List<Widget> getSetting() {
    return [
      ExpansionPanelTitleWidget(
        isExpanded: isExpanded,
        onChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        titleWidget: ValueTitleWidget(StringParams.kLabelStyle),
        hintWidget: TextStyleDemo(
          onchange: (value) {
            setState(() {
              setting = setting.copyWith(labelStyle: value);
            });
          },
        ),
      ),
      ValueTitleWidget(StringParams.kOnDeleted),
      RadioGroupWidget(setting.onDeleted, onPressValues, (value){
        setState(() {
          setting=setting.copyWith(onDeleted: value);
        });
      }),
      ValueTitleWidget(StringParams.kAvatar),
      RadioGroupWidget(setting.avatar, avatarValues, (value) {
        setState(() {
          setting = setting.copyWith(avatar: value);
        });
      }),
      ValueTitleWidget(StringParams.kLabelPadding),
      RadioGroupWidget(setting.labelPadding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(labelPadding: value);
        });
      }),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(setting.padding, paddingValues, (value) {
        setState(() {
          setting = setting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget(StringParams.kShape),
      RadioGroupWidget(setting.shape, shapeValues, (value) {
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget(StringParams.kDeleteIcon),
      RadioGroupWidget(setting.deleteIcon, iconValues, (value) {
        setState(() {
          setting = setting.copyWith(deleteIcon: value);
        });
      }),
//      ValueTitleWidget(StringParams.kMaterialTapTargetSize),
//      RadioGroupWidget(setting.materialTapTargetSize, targetSizeValues, (value) {
//        setState(() {
//          setting = setting.copyWith(materialTapTargetSize: value);
//        });
//      }),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(setting.backgroundColor, (value) {
        setState(() {
          setting = setting.copyWith(backgroundColor: value);
        });
      }),
      ValueTitleWidget(StringParams.kDeleteIconColor),
      ColorGroupWidget(setting.deleteIconColor, (value) {
        setState(() {
          setting = setting.copyWith(deleteIconColor: value);
        });
      }),
      EditTextTitleWidget(
          StringParams.kDeleteButtonTooltipMessage, setting.deleteButtonTooltipMessage,
          (value) {
        setState(() {
          setting = setting.copyWith(deleteButtonTooltipMessage: value);
        });
      }),

    ];
  }

  @override
  String getTitle() {
    return 'Chip';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Chip(
        avatar: setting.avatar?.value,
        label: setting.label?.value,
        labelPadding: setting.labelPadding?.value,
        labelStyle: setting.labelStyle?.value,
        shape: setting.shape?.value,
        backgroundColor: setting.backgroundColor?.value,
        padding: setting.padding?.value,
        deleteIcon: setting.deleteIcon?.value,
        onDeleted:setting.onDeleted?.value == null
            ? setting.onDeleted?.value
            : () {
          setting.onDeleted?.value(scaffoldKey);
        },
        deleteIconColor: setting.deleteIconColor?.value,
        deleteButtonTooltipMessage: setting.deleteButtonTooltipMessage?.value,
//        materialTapTargetSize: setting.materialTapTargetSize?.value,
      ),
    );
  }
}

class ChipSetting {
  final Value<Widget> avatar;

  final Value<Widget> label;

  final Value<TextStyle> labelStyle;

  final Value<EdgeInsetsGeometry> labelPadding;

  final Value<ShapeBorder> shape;

  final Value<Color> backgroundColor;

  final Value<EdgeInsetsGeometry> padding;

  final Value<Widget> deleteIcon;

  final Value<ValueChanged<GlobalKey<ScaffoldState>>> onDeleted;

  final Value<Color> deleteIconColor;

  final Value<String> deleteButtonTooltipMessage;

//  final Value<MaterialTapTargetSize> materialTapTargetSize;

  ChipSetting({
    this.avatar,
    @required this.label,
    this.labelStyle,
    this.labelPadding,
    this.deleteIcon,
    this.onDeleted,
    this.deleteIconColor,
    this.deleteButtonTooltipMessage,
    this.shape,
    this.backgroundColor,
    this.padding,
//    this.materialTapTargetSize,
  });

  ChipSetting copyWith({
    Value<Widget> avatar,
    Value<Widget> label,
    Value<TextStyle> labelStyle,
    Value<EdgeInsetsGeometry> labelPadding,
    Value<ShapeBorder> shape,
    Value<Color> backgroundColor,
    Value<EdgeInsetsGeometry> padding,
    Value<Widget> deleteIcon,
    Value<ValueChanged<GlobalKey<ScaffoldState>>> onDeleted,
    Value<Color> deleteIconColor,
    Value<String> deleteButtonTooltipMessage,
//    Value<MaterialTapTargetSize> materialTapTargetSize,
  }) {
    return ChipSetting(
      avatar: avatar ?? this.avatar,
      label: label ?? this.label,
      labelStyle: labelStyle ?? this.labelStyle,
      labelPadding: labelPadding ?? this.labelPadding,
      shape: shape ?? this.shape,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      deleteIcon: deleteIcon ?? this.deleteIcon,
      onDeleted: onDeleted ?? this.onDeleted,
      deleteIconColor: deleteIconColor ?? this.deleteIconColor,
      deleteButtonTooltipMessage:
          deleteButtonTooltipMessage ?? this.deleteButtonTooltipMessage,
//      materialTapTargetSize:
//          materialTapTargetSize ?? this.materialTapTargetSize,
    );
  }
}
