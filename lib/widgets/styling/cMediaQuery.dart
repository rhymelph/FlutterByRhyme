import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class MediaQueryDemo extends StatefulWidget {
  static const String routeName = 'widgets/styling/MediaQuery';
  final String detail = '''建立媒体查询解析给定数据的子树。

例如，要了解当前媒体的大小（例如，包含您的应用程序的窗口），您可以从MediaQuery.of返回的MediaQueryData中读取MediaQueryData.size属性： 。MediaQuery.of(context).size

使用MediaQuery.of查询当前媒体将导致您的窗口小部件在MediaQueryData更改时自动重建（例如，如果用户旋转其设备）。

如果没有MediaQuery在范围内，则MediaQuery.of方法将抛出异常，除非nullOk参数设置为true，在这种情况下它返回null。''';

  @override
  _MediaQueryDemoState createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends ExampleState<MediaQueryDemo> {
  MediaQuerySetting setting;

  @override
  void initState() {
    setting = MediaQuerySetting(
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      data: Value(
        value: MediaQueryData(),
        label: 'MediaQueryData()',
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
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'MediaQuery';
  }

  @override
  Widget getWidget() {
    return MediaQuery(
      child: setting.child?.value,
      data: setting.data?.value,
    );
  }
}

class MediaQuerySetting {
  final Value<Widget> child;
  final Value<MediaQueryData> data;

  MediaQuerySetting({
    this.child,
    this.data,
  });

  MediaQuerySetting copyWith({
    Value<Widget> child,
    Value<MediaQueryData> data,
  }) {
    return MediaQuerySetting(
      child: child ?? this.child,
      data: data ?? this.data,
    );
  }
}
