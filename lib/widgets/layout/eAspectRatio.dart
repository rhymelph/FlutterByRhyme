import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AspectRatioDemo extends StatefulWidget {
  static const String routeName = 'widgets/cupertino/AspectRatio';
  final String detail = '''尝试将子项调整为特定宽高比的小部件。

小部件首先尝试布局约束允许的最大宽度。小部件的高度通过将给定的宽高比应用于宽度来确定，表示为宽度与高度的比率。

例如，16：9宽度：高度纵横比的值为16.0 / 9.0。如果最大宽度为无穷大，则通过将纵横比应用于最大高度来确定初始宽度。

现在考虑第二个例子，这次宽高比为2.0，布局约束要求宽度介于0.0和100.0之间，高度介于0.0和100.0之间。我们将选择宽度为100.0（允许的最大值）和50.0的高度（以匹配宽高比）。

在相同的情况下，如果纵横比为0.5，我们还将选择宽度100.0（仍然是允许的最大值），我们将尝试使用200.0的高度。不幸的是，这违反了限制，因为孩子的身高最高可达100.0像素。然后，窗口小部件将获取该值并再次应用宽高比以获得50.0的宽度。约束允许该宽度，子项的宽度为50.0，高度为100.0。如果不允许宽度，则窗口小部件将继续迭代约束。如果在查阅每个约束之后窗口小部件找不到可行的大小，则窗口小部件最终将选择满足布局约束但不满足宽高比约束的子窗口的大小。''';

  @override
  _AspectRatioDemoState createState() =>
      _AspectRatioDemoState();
}

class _AspectRatioDemoState
    extends ExampleState<AspectRatioDemo> {
  AspectRatioSetting setting;

  @override
  void initState() {
    setting = AspectRatioSetting(
      aspectRatio: doubleAspectValue[0],
      child:  Value(
        value: SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        ),
        label: '''SizedBox(
          width: 35.0,
          height: 35.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
        )''',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''AspectRatio(
      aspectRatio: ${setting.aspectRatio?.label??''},
      child: ${setting.child?.label??''},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kAspectRatio),
      RadioGroupWidget(setting.aspectRatio, doubleAspectValue, (value) {
        setState(() {
          setting = setting.copyWith(aspectRatio: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'AspectRatio';
  }


  @override
  Widget getWidget() {
    return AspectRatio(
      aspectRatio: setting.aspectRatio?.value,
      child: setting.child?.value,
    );
  }
}

class AspectRatioSetting {
  final Value<double> aspectRatio;
  final Value<Widget> child;

  AspectRatioSetting({
    this.aspectRatio,
    this.child,
  });
  AspectRatioSetting copyWith({
    Value<double> aspectRatio,
    Value<Widget> child,
  }) {
    return AspectRatioSetting(
      aspectRatio: aspectRatio??this.aspectRatio,
      child:  child??this.child,
    );
  }
}
