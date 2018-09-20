import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IconDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Icon';
  final String detail =
      '''图形图标插件与来自于所述的字体的字形绘制IconData如材料的预定IconData以s 图标。

图标不是交互式的。对于交互式图标，请考虑材质的 IconButton。

使用Icon时必须有环境Directionality小部件。通常，这是由WidgetsApp或 MaterialApp自动引入的.''';

  @override
  _IconDemoState createState() => _IconDemoState();
}

class _IconDemoState extends ExampleState<IconDemo> {
  IconSetting setting;

  @override
  void initState() {
    setting = IconSetting(
      icon: Icons.android,
      semanticLabel: 'Icon Label',
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Icon(
      Icons.android,
      size: ${setting.size?.label??''},
      color: ${setting.color?.label??''},
      semanticLabel: 'Icon Label',
      textDirection: ${setting.textDirection?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget<TextDirection>(setting.textDirection, textDirectionValues, (value){
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value){
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      DropDownValueTitleWidget(
        selectList: sizeValues,
        title: StringParams.kSize,
        value: setting.size,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(size: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Icon';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Icon(
        setting.icon,
        size: setting.size?.value,
        color: setting.color?.value,
        semanticLabel: setting.semanticLabel,
        textDirection: setting.textDirection?.value,
      ),
    );
  }
}

class IconSetting {
  final IconData icon;
  final String semanticLabel;
  Value<double> size;
  Value<Color> color;
  Value<TextDirection> textDirection;

  IconSetting(
      {this.icon,
      this.size,
      this.color,
      this.semanticLabel,
      this.textDirection});

  IconSetting copyWith({
    IconData icon,
    Value<double> size,
    Value<Color> color,
    Value<TextDirection> textDirection,
    String semanticLabel,
  }) {
    return IconSetting(
      icon: icon ?? this.icon,
      size: size ?? this.size,
      color: color ?? this.color,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
    );
  }
}
