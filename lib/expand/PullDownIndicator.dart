import 'package:flutter/material.dart';

const double defaultRefreshHeight=50.0;

class PullDownIndicator extends StatefulWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final Widget header;

  final double refreshHeight;

  const PullDownIndicator({
    Key key,
    @required this.child,
    @required this.onRefresh,
    @required this.header,
    this.refreshHeight =defaultRefreshHeight,
}) :assert(child !=null),
  assert(onRefresh!=null),
  assert(header!=null);

  @override
  _PullDownIndicatorState createState() => _PullDownIndicatorState();
}

class _PullDownIndicatorState extends State<PullDownIndicator>
with TickerProviderStateMixin{
  //位置
  AnimationController _positionController;
  Animation<double> _positionFactor;

  //大小
  AnimationController _headerSizeController;
  Animation<double> _headerSizeFactor;


  Animation<double> _value;

  //拖动限制
  static final Animatable<double> _kDragLimitTween = Tween<double>(begin: 0.0, end: 1.5);
  //1到零，松开
  static final Animatable<double> _oneToZeroTween = Tween<double>(begin: 1.0, end: 0.0);
  //四分之三
  static final Animatable<double> _threeQuarterTween = Tween<double>(begin: 0.0, end: 0.75);

  @override
  void initState() {
    super.initState();
    _positionController=AnimationController(vsync: this);
    _positionFactor=_positionController.drive(_kDragLimitTween);


    _value=_positionController.drive(_threeQuarterTween);

    _headerSizeController=AnimationController(vsync: this);
    _headerSizeFactor=_headerSizeController.drive(_oneToZeroTween);

  }
  @override
  void dispose() {
    _positionController.dispose();
    _headerSizeController.dispose();
    super.dispose();
  }

  final GlobalKey _scrollKey=GlobalKey();

  void _handleScrollNotification(ScrollNotification notification){

  }
  @override
  Widget build(BuildContext context) {
    final Widget child=NotificationListener<ScrollNotification>(
        key: _scrollKey,
        onNotification: _handleScrollNotification,
        child: widget.child,);

    return Stack(
      children: <Widget>[
        child,
        Positioned(child: SizedBox(
          height: _positionFactor.value*200.0,
          child: widget.header,
        ))
      ],
    );
  }
}
