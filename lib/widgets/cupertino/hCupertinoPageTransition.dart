import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CupertinoPageTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/CupertinoPageTransition';
  final String detail = '''Provides an iOS-style page transition animation.
The page slides in from the right and exits in reverse. It also shifts to the left in a parallax motion when another page enters to cover it.
Inheritance
Object Diagnosticable DiagnosticableTree Widget StatelessWidget CupertinoPageTransition''';

  @override
  _CupertinoPageTransitionDemoState createState() =>
      _CupertinoPageTransitionDemoState();
}

class _CupertinoPageTransitionDemoState
    extends ExampleState<CupertinoPageTransitionDemo>
    with TickerProviderStateMixin {
  CupertinoPageTransitionSetting setting;

  @override
  void initState() {
    setting = CupertinoPageTransitionSetting(
      child: Value(
        value: Text('CupertinoPageTransition'),
        label: "Text('CupertinoPageTransition')",
      ),
      primaryRouteAnimation: Value(
        value: kAlwaysCompleteAnimation,
        label: 'kAlwaysCompleteAnimation',
      ),
      secondaryRouteAnimation: Value(
        value: kAlwaysCompleteAnimation,
        label: 'kAlwaysCompleteAnimation',
      ),
      linearTransition: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CupertinoPageTransition(
        primaryRouteAnimation: ${setting.primaryRouteAnimation?.label??''},
        secondaryRouteAnimation: ${setting.secondaryRouteAnimation?.label??''},
        child: ${setting.child?.label??''},
        linearTransition: ${setting.linearTransition?.label??''},
      )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
        value: setting.linearTransition,
        title: StringParams.kLinearTransition,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(linearTransition: value);
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'CupertinoPageTransition';
  }

  @override
  Widget getWidget() {
    return Center(
      child: CupertinoPageTransition(
        primaryRouteAnimation: setting.primaryRouteAnimation?.value,
        secondaryRouteAnimation: setting.secondaryRouteAnimation?.value,
        child: setting.child?.value,
        linearTransition: setting.linearTransition?.value,
      ),
    );
  }
}

class CupertinoPageTransitionSetting {
  final Value<Animation<double>> primaryRouteAnimation;
  final Value<Animation<double>> secondaryRouteAnimation;
  final Value<Widget> child;
  final Value<bool> linearTransition;

  CupertinoPageTransitionSetting({
    this.primaryRouteAnimation,
    this.secondaryRouteAnimation,
    this.child,
    this.linearTransition,
  });

  CupertinoPageTransitionSetting copyWith({
    Value<Animation<double>> primaryRouteAnimation,
    Value<Animation<double>> secondaryRouteAnimation,
    Value<Widget> child,
    Value<bool> linearTransition,
  }) {
    return CupertinoPageTransitionSetting(
      primaryRouteAnimation:
          primaryRouteAnimation ?? this.primaryRouteAnimation,
      secondaryRouteAnimation:
          secondaryRouteAnimation ?? this.secondaryRouteAnimation,
      child: child ?? this.child,
      linearTransition: linearTransition ?? this.linearTransition,
    );
  }
}
