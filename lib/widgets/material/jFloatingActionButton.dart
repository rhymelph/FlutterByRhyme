import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class FloatingActionButtonDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/FloatingActionButton';
  final String detail = '''A material design floating action button.
A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.
Use at most a single floating action button per screen. Floating action buttons should be used for positive actions such as "create", "share", or "navigate".
If the onPressed callback is null, then the button will be disabled and will not react to touch.
If the floating action button is a descendant of a Scaffold that also has a BottomAppBar, the BottomAppBar will show a notch to accomodate the FloatingActionButton when it overlaps the BottomAppBar. The notch's shape is an arc for a circle whose radius is the floating action button's radius plus FloatingActionButton.notchMargin.''';

  @override
  _FloatingActionButtonDemoState createState() =>
      _FloatingActionButtonDemoState();
}

class _FloatingActionButtonDemoState
    extends ExampleState<FloatingActionButtonDemo> {
  FloatingActionButtonSetting setting;

  @override
  void initState() {
    setting = new FloatingActionButtonSetting(
        elevation: doubleLargeValues[0],
        highlightElevation: doubleLargeValues[0],
        mini: const Value(
          name: 'true',
          value: true,
          label: 'true',
        ),
        notchMargin: doubleLargeValues[0],
        shape: shapeValues[0],
        isExtended: const Value(
          name: 'true',
          value: true,
          label: 'true',
        ));

    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''FloatingActionButton(
        onPressed: () {},
        tooltip: '${setting.tooltip?.label??''}',
        foregroundColor: ${setting.foregroundColor?.label??''},
        backgroundColor: ${setting.backgroundColor?.label??''},
        elevation: ${setting.elevation?.label??''},
        highlightElevation: ${setting.highlightElevation?.label??''},
        mini: ${setting.mini?.label??''},
        notchMargin: ${setting.notchMargin?.label??''},
        shape: ${setting.shape?.label??''},
        isExtended: ${setting.isExtended?.label??''},
        child: Icon(Icons.check),
      )''';
  }

  Widget returnWidget(){
    return FloatingActionButton(
      onPressed: () {},
      tooltip: setting.tooltip?.label,
      foregroundColor: setting.foregroundColor?.value,
      backgroundColor: setting.backgroundColor?.value,
      elevation: setting.elevation?.value,
      highlightElevation: setting.highlightElevation?.value,
      mini: setting.mini?.value,
      notchMargin: setting.notchMargin?.value,
      shape: setting.shape?.value,
      isExtended: setting.isExtended?.value,
      child: Icon(Icons.check),
    );
  }
  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(
        title: StringParams.kSave,
        onPressed: () {
          Navigator.pop(
              context,
              Value<Widget>(
                name: 'FloatingActionButton',
                value: returnWidget(),
                label: getExampleCode(),
              ));
        },
      ),
      ValueTitleWidget(StringParams.kShape),
      RadioGroupWidget(setting.shape, shapeValues, (value){
        setState(() {
          setting = setting.copyWith(shape: value);
        });
      }),
      ValueTitleWidget(StringParams.kForegroundColor),
      ColorGroupWidget(
        setting.foregroundColor,
        colorValues,
            (value) {
          setState(() {
            setting = setting.copyWith(foregroundColor: value);
          });
        },
      ),
      ValueTitleWidget(StringParams.kBackgroundColor),
      ColorGroupWidget(
        setting.backgroundColor,
        colorValues,
            (value) {
          setState(() {
            setting = setting.copyWith(backgroundColor: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kMini,
        value: setting.mini,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(mini: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kIsExtended,
        value: setting.isExtended,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(isExtended: value);
          });
        },
      ),
      SwitchValueTitleWidget(
        title: StringParams.kTooltip,
        value: setting.tooltip,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(tooltip: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kElevation,
        value: setting.elevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(elevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kHighlightElevation,
        value: setting.highlightElevation,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(highlightElevation: value);
          });
        },
      ),
      DropDownValueTitleWidget(
        selectList: doubleLargeValues,
        title: StringParams.kNotchMargin,
        value: setting.notchMargin,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(notchMargin: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'FloatingActionButton';
  }

  @override
  Widget getWidget() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: setting.tooltip?.label,
        foregroundColor: setting.foregroundColor?.value,
        backgroundColor: setting.backgroundColor?.value,
        elevation: setting.elevation?.value,
        highlightElevation: setting.highlightElevation?.value,
        mini: setting.mini?.value,
        notchMargin: setting.notchMargin?.value,
        shape: setting.shape?.value,
        isExtended: setting.isExtended?.value,
        child: Icon(Icons.check),
      ),
    );
  }
}

class FloatingActionButtonSetting {
  final Value<bool> tooltip;
  final Value<Color> foregroundColor;
  final Value<Color> backgroundColor;

//  final Object heroTag;
  final Value<double> elevation;
  final Value<double> highlightElevation;
  final Value<bool> mini;
  final Value<double> notchMargin;
  final Value<ShapeBorder> shape;
  final Value<bool> isExtended;

  FloatingActionButtonSetting({
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.elevation,
    this.highlightElevation,
    this.mini,
    this.notchMargin,
    this.shape,
    this.isExtended,
  });

  FloatingActionButtonSetting copyWith({
    Value<bool> tooltip,
    Value<Color> foregroundColor,
    Value<Color> backgroundColor,
    Value<double> elevation,
    Value<double> highlightElevation,
    Value<bool> mini,
    Value<double> notchMargin,
    Value<ShapeBorder> shape,
    Value<bool> isExtended,
  }) {
    return FloatingActionButtonSetting(
      tooltip: tooltip ?? this.tooltip,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      highlightElevation: highlightElevation ?? this.highlightElevation,
      mini: mini ?? this.mini,
      notchMargin: notchMargin ?? this.notchMargin,
      shape: shape ?? this.shape,
      isExtended: isExtended ?? this.isExtended,
    );
  }
}
