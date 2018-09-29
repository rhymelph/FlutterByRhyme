import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DecoratedBoxDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/DecoratedBox';
  final String detail = '''在儿童绘画之前或之后绘制装饰的小部件。

容器根据边界的宽度对其子进行插入; 这个小部件没有。

常用于BoxDecoration。''';

  @override
  _DecoratedBoxDemoState createState() =>
      _DecoratedBoxDemoState();
}

class _DecoratedBoxDemoState
    extends ExampleState<DecoratedBoxDemo> {
  DecoratedBoxSetting setting;

  @override
  void initState() {
    setting = DecoratedBoxSetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      decoration: decorationValues[0],
      position: decorationPositionValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''DecoratedBox(
      decoration: ${setting.decoration?.label??''},
      position: ${setting.position?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kDecoration),
      RadioGroupWidget(setting.decoration, decorationValues, (value) {
        setState(() {
          setting = setting.copyWith(decoration: value);
        });
      }),
      ValueTitleWidget(StringParams.kPosition),
      RadioGroupWidget(setting.position, decorationPositionValues, (value) {
        setState(() {
          setting = setting.copyWith(position: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'DecoratedBox';
  }


  @override
  Widget getWidget() {
    return DecoratedBox(
      decoration: setting.decoration?.value,
      position: setting.position?.value,
      child: setting.child?.value,
    );
  }
}

class DecoratedBoxSetting {
  final Value<Decoration> decoration;
  final Value<DecorationPosition> position;
  final Value<Widget> child;
  DecoratedBoxSetting({
    this.decoration, this.position, this.child,
  });

  DecoratedBoxSetting copyWith({
   Value<Decoration> decoration,
   Value<DecorationPosition> position,
   Value<Widget> child,
  }) {
    return DecoratedBoxSetting(
      decoration: decoration??this.decoration,
      position: position??this.position,
      child: child??this.child,
    );
  }
}
