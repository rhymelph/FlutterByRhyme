import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class CustomPaintDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/CustomPaint';
  final String detail = '''一个小部件，提供在绘制阶段绘制的画布。

当被要求绘画时，CustomPaint首先要求它的画家在当前画布上绘画，然后它绘制它的孩子，然后，在绘制它的孩子之后，它要求它的foregroundPainter绘画。画布的坐标系与CustomPaint对象的坐标系匹配。画家应该在从原点开始的矩形内绘画，并包含给定大小的区域。（如果画家在这些边界之外绘制，则可能没有足够的内存分配来光栅化绘制命令，并且结果行为未定义。）

画家通过继承CustomPainter来实现。

因为自定义绘制在绘制期间调用其画家，所以无法调用 setState或markNeedsLayout在回调期间（此帧的布局已经发生）。

定制画家通常根据自己的孩子选择自己的尺寸 如果他们没有孩子，他们会尝试将自己调整为大小，默认为 Size.zero。大小不能为空。

isComplex和willChange是合成器栅格缓存的提示，不能为空。''';

  @override
  _CustomPaintDemoState createState() => _CustomPaintDemoState();
}

class _CustomPaintDemoState extends ExampleState<CustomPaintDemo>
    with SingleTickerProviderStateMixin {
  CustomPaintSetting setting;

  @override
  void initState() {
    setting = CustomPaintSetting(
      size: Value(
        value: Size.infinite,
        label: 'Size.infinite',
      ),
      painter: Value(
        value: IdeaCustomPainter(),
        label: 'IdeaCustomPainter()',
      ),
      foregroundPainter: Value(
        value: IdeaCustomPainter(padding: 40.0),
        label: 'IdeaCustomPainter(padding: 40.0)',
      ),
      child: Value(
        value: Image.asset('images/burgers.jpg'),
        label: "Image.asset('images/burgers.jpg')",
      ),
      isComplex: boolValues[0],
      willChange: boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''CustomPaint(
      painter: ${setting.painter?.label ?? ''},
      foregroundPainter: ${setting.foregroundPainter?.label ?? ''},
      size: ${setting.size?.label ?? ''},
      isComplex: ${setting.isComplex?.label ?? ''},
      willChange: ${setting.willChange?.label ?? ''},
      child: ${setting.child?.label ?? ''},
    )
    
class IdeaCustomPainter extends CustomPainter {
  final double move;
  final double padding;

  IdeaCustomPainter({this.move: 0.0, this.padding: 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.blue
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    double x = move;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        0.0 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.orange;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        1.1 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.yellow;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        2.2 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.green;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        3.3 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.pink;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        4.4 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.blueGrey;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        5.5 + x,
        1.1,
        false,
        paint);
  }
  @override
  bool shouldRepaint(IdeaCustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      SwitchValueTitleWidget(
          title: StringParams.kIsComplex,
          value: setting.isComplex,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(isComplex: value);
            });
          }),
      SwitchValueTitleWidget(
          title: StringParams.kWillChange,
          value: setting.willChange,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(willChange: value);
            });
          }),
    ];
  }

  @override
  String getTitle() {
    return 'CustomPaint';
  }

  @override
  Widget getWidget() {
    return CustomPaint(
      painter: setting.painter?.value,
      foregroundPainter: setting.foregroundPainter?.value,
      size: setting.size?.value,
      isComplex: setting.isComplex?.value,
      willChange: setting.willChange?.value,
      child: setting.child?.value,
    );
  }
}

class CustomPaintSetting {
  final Value<CustomPainter> painter;
  final Value<CustomPainter> foregroundPainter;
  final Value<Size> size;
  final Value<bool> isComplex;
  final Value<bool> willChange;
  final Value<Widget> child;

  CustomPaintSetting({
    this.painter,
    this.foregroundPainter,
    this.size,
    this.isComplex,
    this.willChange,
    this.child,
  });

  CustomPaintSetting copyWith({
    Value<CustomPainter> painter,
    Value<CustomPainter> foregroundPainter,
    Value<Size> size,
    Value<bool> isComplex,
    Value<bool> willChange,
    Value<Widget> child,
  }) {
    return CustomPaintSetting(
      painter: painter ?? this.painter,
      foregroundPainter: painter ?? this.foregroundPainter,
      size: size ?? this.size,
      willChange: willChange ?? this.willChange,
      child: child ?? this.child,
      isComplex: isComplex ?? this.isComplex,
    );
  }
}

class IdeaCustomPainter extends CustomPainter {
  final double move;
  final double padding;

  IdeaCustomPainter({this.move: 0.0, this.padding: 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.blue
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    double x = move;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        0.0 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.orange;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        1.1 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.yellow;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        2.2 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.green;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        3.3 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.pink;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        4.4 + x,
        1.1,
        false,
        paint);
    paint.color = Colors.blueGrey;
    canvas.drawArc(
        Rect.fromLTRB(
            padding, padding, size.width - padding, size.height - padding),
        5.5 + x,
        1.1,
        false,
        paint);
  }
  @override
  bool shouldRepaint(IdeaCustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
