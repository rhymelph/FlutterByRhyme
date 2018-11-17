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
const double defaultOverPresenter=2.0;



class RhyPullToRefreshIndicator extends StatefulWidget {
  final Widget child;
  final RefreshBody header;
  final RefreshBody footer;
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

  //是否在顶部
  bool _isTop;

  //拖动偏移
  double _dragOffSet;

  //是否在底部
  bool _isBottom;

  //开始刷新
  bool _start(AxisDirection axisDirection) {
    switch (axisDirection) {
      case AxisDirection.down:
        _isTop = true;
        break;
      case AxisDirection.up:
        _isTop = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _isTop = null;
        return false;
    }
    //重置数值
    _dragOffSet = 0.0;
    return true;
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    print('before：${notification.metrics.extentBefore}\n'
        'after：${notification.metrics.extentAfter}');
    if (notification.depth != 0) {
      //该通知不是第一个通知
      return false;
    }
    //滑动相关
    if (notification is ScrollStartNotification) {
      print('滑动开始');

      //下拉刷新
      if (_statusRefresh == null &&
          notification.metrics.extentBefore == 0 &&
          _start(notification.metrics.axisDirection)) {
        _statusLoading = null;
        print('下拉刷新');
//        setState(() {
//          _statusRefresh = STATUE_REFRESH.DRAG;
//        });
        return false;
      } else
      //上拉加载
      if (_statusLoading == null && notification.metrics.extentAfter == 0) {
        _statusRefresh = null;
        print('上拉加载');
//        setState(() {
//          _statusLoading = STATUE_LOADING.DRAG;
//        });
        return false;
      }
    } else if (notification is ScrollUpdateNotification) {
      print('滑动更新');
      //刷新
      if (_statusRefresh == STATUE_REFRESH.DRAG ||
          _statusRefresh == STATUE_REFRESH.ARMED) {
        _dragOffSet -= notification.scrollDelta;
        _checkDragOffsetRefresh(notification.metrics.viewportDimension);
      }
      if (_statusRefresh == STATUE_REFRESH.ARMED &&
          notification.dragDetails == null) {
        //满足刷新条件，进行刷新
        _showRefresh();
      }

      if (_statusLoading == STATUE_LOADING.DRAG ||
          _statusLoading == STATUE_LOADING.ARMED) {
        _dragOffSet += notification.scrollDelta;
        _checkDragOffsetLoading(notification.metrics.viewportDimension);
      }

      if(_statusLoading == STATUE_LOADING.ARMED&&
      notification.dragDetails==null){
        //满足加载条件，进行加载
        _showLoading();

      }
    } else if (notification is OverscrollNotification) {
      if(_statusRefresh ==STATUE_REFRESH.DRAG||_statusRefresh==STATUE_REFRESH.ARMED){

        _dragOffSet-=notification.overscroll/defaultOverPresenter;
        _checkDragOffsetRefresh(notification.metrics.viewportDimension);
      }

      if(_statusLoading ==STATUE_LOADING.DRAG||_statusLoading==STATUE_LOADING.ARMED){

        _dragOffSet-=notification.overscroll/defaultOverPresenter;
        _checkDragOffsetLoading(notification.metrics.viewportDimension);
      }

      print('过渡滑动');
    } else if (notification is ScrollEndNotification) {
      print('滑动结束');

      if(_statusRefresh==STATUE_REFRESH.DRAG){
        dismissRefresh(STATUE_REFRESH.CANCELED);

      }else if(_statusRefresh==STATUE_REFRESH.ARMED){
        _showRefresh();
      }

      if(_statusLoading==STATUE_LOADING.DRAG){
        dismissLoading(STATUE_LOADING.CANCELED);

      }else if(_statusLoading==STATUE_LOADING.ARMED){
        _showRefresh();
      }

    }
    return false;
  }

  void _showRefresh() {}
  void dismissRefresh(STATUE_REFRESH status) {}

  void _showLoading() {}
  void dismissLoading(STATUE_LOADING status) {}

  void _checkDragOffsetRefresh(double viewportDimension) {}

  void _checkDragOffsetLoading(double viewportDimension) {}

  bool _handleOverScrollIndicatior(
      OverscrollIndicatorNotification notification) {
    print('OverscrollIndicatorNotification');
    if (notification.depth != 0 || !notification.leading) return false;
    if (_statusRefresh == STATUE_REFRESH.DRAG) {
      notification.disallowGlow();
      return true;
    }
    if (_statusLoading == STATUE_LOADING.DRAG) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }

  GlobalKey _notificationKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget child = NotificationListener<ScrollNotification>(
      key: _notificationKey,
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleOverScrollIndicatior,
        child: widget.child,
      ),
    );
    if (_statusRefresh == null && _statusLoading == null) {
      return child;
    }

    List<Widget> stackList = [];
    if (widget.header != null) {
      stackList.add(Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        bottom: null,
        child: SingleChildScrollView(
            child: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          height: _dragOffSet,
          child: _getHeader(),
        )),
      ));
    }

    if (widget.footer != null) {
      stackList.add(Positioned(
        top: null,
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: SingleChildScrollView(child: _getFooter()),
      ));
    }
    return Stack(
      children: stackList..insert(0, widget.child),
    );
  }

  Widget _getHeader() {
    switch (_statusRefresh) {
      case STATUE_REFRESH.DRAG:
        return widget.header.onDrag();
      case STATUE_REFRESH.ARMED:
        return widget.header.onArmed();
      case STATUE_REFRESH.SNAP:
        return widget.header.onSnap();
      case STATUE_REFRESH.REFRESH:
        return widget.header.onRefresh();
      case STATUE_REFRESH.DONE:
        return widget.header.onDone();
      case STATUE_REFRESH.CANCELED:
        return widget.header.onCancel();
    }
    return Text('');
  }

  Widget _getFooter() {
    switch (_statusLoading) {
      case STATUE_LOADING.DRAG:
        return widget.footer.onDrag();
      case STATUE_LOADING.ARMED:
        return widget.footer.onArmed();
      case STATUE_LOADING.SNAP:
        return widget.footer.onSnap();
      case STATUE_LOADING.REFRESH:
        return widget.footer.onRefresh();
      case STATUE_LOADING.DONE:
        return widget.footer.onDone();
      case STATUE_LOADING.CANCELED:
        return widget.footer.onCancel();
    }
    return Text('');
  }



}

abstract class RefreshBody {
  /*下拉刷新*/
  Widget onDrag();

  /*松开刷新*/
  Widget onArmed();

  /*松开*/
  Widget onSnap();

  /*正在加载*/
  Widget onRefresh();

  /*刷新完毕*/
  Widget onDone();

  /*取消刷新*/
  Widget onCancel();
}
