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
enum STATUE_LOADING {
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
  STATUE_LOADING _statusLoading;
  STATUE_REFRESH _statusRefresh;

  bool _handleScrllNotification(ScrollNotification notification) {
    //滑动相关
    if(notification is ScrollStartNotification){
      print('滑动开始');

    }else if(notification is ScrollUpdateNotification){
      print('滑动更新');


    }else if(notification is OverscrollNotification){
      print('过渡滑动');

    }else if(notification is ScrollEndNotification){
      print('滑动结束');
    }
    return false;
  }
  bool _handleOverScrollIndicatior(OverscrollIndicatorNotification notification) {
    print('OverscrollIndicatorNotification');
    notification.disallowGlow();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget child=NotificationListener<ScrollNotification>(
      onNotification: _handleScrllNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleOverScrollIndicatior,
        child: widget.child,
      ),
    );
    if(_statusRefresh==null&&_statusLoading==null){
      return child;
    }

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
