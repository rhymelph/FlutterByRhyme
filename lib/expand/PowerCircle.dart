import 'package:flutter/material.dart';

const int _kWaveCount = 4;

class PowerCircle extends StatefulWidget {
  final double progress;

  ///大小
  final double size;

  ///前景色
  final Color foregroundColor;

  ///背景色
  final Color backgroundColor;

  ///圆形颜色
  final Color circleColor;

  final Widget child;

  ///幅度
  final double range;

  ///时间间隔
  final Duration duration;


  const PowerCircle({
    Key key,
    this.size =150.0,
    this.progress = 0.0,
    this.foregroundColor = Colors.blue,
    this.backgroundColor = Colors.lightBlue,
    this.circleColor = Colors.grey,
    this.child,
    this.duration = const Duration(seconds: 2),
    this.range = 10.0,
  })  : assert(progress >= 0.0 && progress <= 1.0),
        super(key: key);

  @override
  _PowerCircleState createState() => _PowerCircleState();
}

class _PowerCircleState extends State<PowerCircle>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Widget _buildPowerCircle(BuildContext context,double animationValue,){
    return Container(
      constraints: BoxConstraints.tightFor(
        height: widget.size,
        width: widget.size
      ),
      child: CustomPaint(
        painter: _PowerCirclePainter(
          animationValue: _controller.value,
          range: widget.range,
          progress: widget.progress,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
          circleColor: widget.circleColor,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return _buildPowerCircle(context, _controller.value);
      },
    );
  }
}

class _PowerCirclePainter extends CustomPainter {
  //当前进度
  final double progress;

  //移动距离
  final double animationValue;

  //波幅度
  final double range;

  //前景色
  final Color foregroundColor;

  //背景色
  final Color backgroundColor;

  //圆形的颜色
  final Color circleColor;

  _PowerCirclePainter({
    this.foregroundColor,
    this.circleColor,
    this.backgroundColor,
    this.animationValue,
    this.progress = 0.0,
    this.range = 10.0,
  })  : assert(animationValue >= 0.0 && animationValue <= 1.0),
        assert(progress >= 0.0 && progress <= 1.0);

  @override
  void paint(Canvas canvas, Size size) {
    //波的实际高度
    double leveHeight = (1.0 - progress) * size.height;
    //分成四段
    double specWidget = size.width / _kWaveCount;
    //水平移动的实际距离
    double translateX = size.width * animationValue;

    double translateX2 = size.width * (1 - animationValue);

    Path path = new Path();
    path.moveTo(0 - translateX, size.height);
    path.lineTo(0 - translateX, leveHeight);
    for (int i = 1; i <= _kWaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX;
      double controllerY = i % 2 == 0 ? leveHeight - range : leveHeight + range;
      double toX = specWidget * (2 * i) - translateX;
      path.quadraticBezierTo(controllerX, controllerY, toX, leveHeight);
    }
    path.lineTo(size.width + translateX, size.height);
    path.close();

    Path path2 = new Path();
    path2.moveTo(0 - translateX2, size.height);
    path2.lineTo(0 - translateX2, leveHeight);
    for (int i = 1; i <= _kWaveCount; i++) {
      double controllerX = specWidget * (i * 2 - 1) - translateX2;
      double controllerY = i % 2 != 0 ? leveHeight - range : leveHeight + range;
      double toX = specWidget * (2 * i) - translateX2;

      path2.quadraticBezierTo(controllerX, controllerY, toX, leveHeight);
    }
    path2.lineTo(size.width + translateX2, size.height);
    path2.close();

    Path path3 = new Path();
    path3.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    path3.close();

    //draw
    canvas.clipPath(path3, doAntiAlias: true);

    Paint mPaint = new Paint();

    mPaint.style = PaintingStyle.fill;
    mPaint.isAntiAlias = true;

    mPaint.color = circleColor;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, mPaint);

    mPaint.color = backgroundColor;
    canvas.drawPath(path2, mPaint);

    mPaint.color = foregroundColor;
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(_PowerCirclePainter oldDelegate) {
    return oldDelegate.animationValue != this.animationValue ||
        oldDelegate.range != this.range ||
        oldDelegate.progress != this.progress||
        oldDelegate.backgroundColor != this.backgroundColor ||
        oldDelegate.foregroundColor != this.foregroundColor ||
        oldDelegate.circleColor != this.circleColor ;
  }
}
