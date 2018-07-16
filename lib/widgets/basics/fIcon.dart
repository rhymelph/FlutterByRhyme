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

  Value<double> _firstSize;

  Value<Color> _firstColor;

  Value<TextDirection> _firstTextDirection;

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
      size: ${_firstSize?.label??''},
      color: ${_firstColor?.label??''},
      semanticLabel: 'Icon Label',
      textDirection: ${_firstTextDirection?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      DropDownValueTitleWidget(
        selectList: sizeValues,
        title: StringParams.KSize,
        value: _firstSize,
        onChanged: (value) {
          setState(() {
            _firstSize = value;
            setting = setting.copyWith(size: value.value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(_firstColor, colorValues, (value){
        setState(() {
          _firstColor = value;
          setting = setting.copyWith(color: value.value);
        });
      }),
      ValueTitleWidget(StringParams.kTextDirection),
      RadioGroupWidget<TextDirection>(_firstTextDirection, textDirectionValues, (value){
        setState(() {
          _firstTextDirection = value;
          setting = setting.copyWith(textDirection: value.value);
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
        size: setting.size,
        color: setting.color,
        semanticLabel: setting.semanticLabel,
        textDirection: setting.textDirection,
      ),
    );
  }
}

class IconSetting {
  final IconData icon;
  final double size;
  final Color color;
  final String semanticLabel;
  final TextDirection textDirection;

  IconSetting(
      {this.icon,
      this.size,
      this.color,
      this.semanticLabel,
      this.textDirection});

  IconSetting copyWith({
    IconData icon,
    double size,
    Color color,
    String semanticLabel,
    TextDirection textDirection,
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
