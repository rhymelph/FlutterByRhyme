import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LayoutBuilderDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/LayoutBuilder';
  final String detail = '''''';

  @override
  _LayoutBuilderDemoState createState() =>
      _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState
    extends ExampleState<LayoutBuilderDemo> {
  LayoutBuilderSetting setting;

  @override
  void initState() {
    setting = LayoutBuilderSetting(
      builder: Value(
        value: (BuildContext context, BoxConstraints constraints) {
          //边距
          double margin=5.0;
          //父容器的大小
          Size parentSize=constraints.biggest;
          //父容器的宽
          double width = parentSize.width;
          //父容器的高
          double height= parentSize.height;
          Widget body=SizedBox(
            width: width-margin,
            height: height-margin,
            child: DecoratedBox(decoration: BoxDecoration(
              color: Colors.grey,
            )),
          );
          return body;
        },
        label: '''(BuildContext context, BoxConstraints constraints) {
          //边距
          double margin=5.0;
          //父容器的大小
          Size parentSize=constraints.biggest;
          //父容器的宽
          double width = parentSize.width;
          //父容器的高
          double height= parentSize.height;
          Widget body=SizedBox(
            width: width-margin,
            height: height-margin,
            child: DecoratedBox(decoration: BoxDecoration(
              color: Colors.grey,
            )),
          );
          return body;
        }''',
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
    return '''LayoutBuilder(
      builder: ${setting.builder?.label??''},
    );''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'LayoutBuilder';
  }


  @override
  Widget getWidget() {
    return LayoutBuilder(
      builder: setting.builder?.value,
    );
  }
}

class LayoutBuilderSetting {
    final Value<LayoutWidgetBuilder> builder;

  LayoutBuilderSetting({
      this.builder,
  });

  LayoutBuilderSetting copyWith({
    final Value<LayoutWidgetBuilder> builder,
  }) {
    return LayoutBuilderSetting(
      builder: builder??this.builder,
    );
  }
}
