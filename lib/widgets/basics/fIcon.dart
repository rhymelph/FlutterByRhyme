import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class IconDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Icon';
  final String detail =
      '''A graphical icon widget drawn with a glyph from a font described in an IconData such as material's predefined IconDatas in Icons.
Icons are not interactive. For an interactive icon, consider material's IconButton.
There must be an ambient Directionality widget when using Icon. Typically this is introduced automatically by the WidgetsApp or MaterialApp.
See also:
IconButton, for interactive icons.
Icons, for the list of available icons for use with this class.
IconTheme, which provides ambient configuration for icons.
ImageIcon, for showing icons from AssetImages or other ImageProviders.''';

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
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color, colorValues, (value){
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget<TextDirection>(setting.textDirection, textDirectionValues, (value){
        setState(() {
          setting = setting.copyWith(textDirection: value);
        });
      }),
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
