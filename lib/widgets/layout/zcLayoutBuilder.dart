import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class LayoutBuilderDemo extends StatefulWidget {
  static const String routeName = 'widgets/layout/LayoutBuilder';
  final String detail = '''构建可依赖于父窗口小部件大小的窗口小部件树。

与Builder小部件类似，只是框架 在布局时调用构建器函数并提供父小部件的约束。当父约束孩子的大小而不依赖于孩子的内在大小时，这很有用。该LayoutBuilder的最终规模将匹配其孩子的大小。

如果子项应小于父项，请考虑将子项包装在“ 对齐”小组件中。如果孩子可能想要变大，可以考虑将其包装在SingleChildScrollView中。''';

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
