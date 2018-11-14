import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;

enum STATUE_REFRESH {
  DRAG,
  /*下拉刷新*/
  ARMED,
  /*松开刷新*/
  SNAP,
  /*松开*/
  REFRESH,
  /*正在加载*/
  DONE,
  /*刷新完毕*/
  CANCELED,
  /*取消刷新*/
}
enum STATUE_LODING {
  DRAG,
  /*上拉加载*/
  ARMED,
  /*松开加载*/
  SNAP,
  /*松开*/
  REFRESH,
  /*正在加载*/
  DONE,
  /*加载完毕*/
  CANCELED,
  /*取消加载*/
}

const double defaultHeight = 50.0;
const double defaultDragPercentage = 0.25;
const double defaultDragLimit = 1.5;

class RhyPullToRefreshIndicator extends StatefulWidget {
  final Widget child;
  final Widget header;
  final Widget footer;
  final double headerHeight;
  final double footerHeight;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoading;

  RhyPullToRefreshIndicator({
    Key key,
    @required this.child,
    this.header,
    this.footer,
    this.headerHeight = defaultHeight,
    this.footerHeight = defaultHeight,
    this.onRefresh,
    this.onLoading,
  }) : super(key: key);

  @override
  _RhyPullToRefreshIndicatorState createState() =>
      _RhyPullToRefreshIndicatorState();
}

class _RhyPullToRefreshIndicatorState extends State<RhyPullToRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: null,
          child: widget.header,
        ),
        Positioned(
          top: null,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: widget.footer,
        ),
      ],
    );
  }
}
