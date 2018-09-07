import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DefaultTextStyleDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/DefaultTextStyle';
  final String detail = '''''';

  @override
  _DefaultTextStyleDemoState createState() => _DefaultTextStyleDemoState();
}

class _DefaultTextStyleDemoState extends ExampleState<DefaultTextStyleDemo> {
  DefaultTextStyleSetting setting;

  @override
  void initState() {
    setting = DefaultTextStyleSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''DefaultTextStyle(
      style: ${setting.style?.label??''},
      softWrap: ${setting.softWrap?.label??''},
      overflow: ${setting.overflow?.label??''},
      textAlign: ${setting.textAlign?.label??''},
      maxLines: ${setting.maxLines?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'DefaultTextStyle';
  }

    @override
    Widget getWidget() {
      return DefaultTextStyle(
      style: setting.style?.value,
      softWrap: setting.softWrap?.value,
      overflow: setting.overflow?.value,
      textAlign: setting.textAlign?.value,
      maxLines: setting.maxLines?.value,
      child: setting.child?.value,
    );
  }
}

class DefaultTextStyleSetting {
  final Value<TextStyle> style;
  final Value<TextAlign> textAlign;
  final Value<bool> softWrap;
  final Value<TextOverflow> overflow;
  final Value<int> maxLines;
  final Value<Widget> child;

  DefaultTextStyleSetting({
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.child,
  });

  DefaultTextStyleSetting copyWith({
    Value<TextStyle> style,
    Value<TextAlign> textAlign,
    Value<bool> softWrap,
    Value<TextOverflow> overflow,
    Value<int> maxLines,
    Value<Widget> child,
  }) {
    return DefaultTextStyleSetting(
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      child: child ?? this.child,
    );
  }
}
