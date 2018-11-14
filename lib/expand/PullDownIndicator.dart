import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

const double defaultRefreshHeight = 50.0;
const double defaultDragPercentage = 0.25;
const double defaultDragLimit = 1.5;

const Duration defaultSnap=Duration(milliseconds: 150);

enum STATUE {
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
    this.refreshHeight = defaultRefreshHeight,
  })  : assert(child != null),
        assert(onRefresh != null),
        assert(header != null);

  @override
  _PullDownIndicatorState createState() => _PullDownIndicatorState();
}

class _PullDownIndicatorState extends State<PullDownIndicator>
    with TickerProviderStateMixin {
  //位置
  AnimationController _positionController;
  Animation<double> _positionFactor;


  //刷新状态
  STATUE _status;

  //是否在顶部
  bool _isTop;

  //拖动偏移
  double _dragOffSet;

  //拖动限制
  static final Animatable<double> _kDragLimitTween =
      Tween<double>(begin: 0.0, end: defaultDragLimit);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragLimitTween);
  }

  @override
  void dispose() {
    _positionController.dispose();
    super.dispose();
  }

  final GlobalKey _scrollKey = GlobalKey();

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) {
      return false;
    }
    if (notification is ScrollStartNotification &&
        notification.metrics.extentBefore == 0.0 &&
        _status == null &&
        _start(notification.metrics.axisDirection)) {
      setState(() {
        _status = STATUE.DRAG;
      });
      return false;
    }
    //判断当前刷新是否在顶部
    bool _atTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
        _atTopNow = true;
        break;
      case AxisDirection.up:
        _atTopNow = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _atTopNow = null;
        break;
    }
    if (_atTopNow != _isTop) {
      print('改变了滑动的方向');
      if (_status == STATUE.DRAG || _status == STATUE.ARMED)
        _dismiss(STATUE.CANCELED);
    }
    else if (notification is ScrollUpdateNotification) {
      if (_status == STATUE.DRAG || _status == STATUE.ARMED) {
        //当前并没有在顶部
        if (notification.metrics.extentBefore > 0.0) {
          _dismiss(STATUE.CANCELED);
        } else {
          _dragOffSet -= notification.scrollDelta;
          _checkDragOffset(notification.metrics.viewportDimension);
        }
      }
      if (_status == STATUE.ARMED && notification.dragDetails == null) {
        //拖动完成，开始刷新
        _show();
      }
    }
    //过度滚动
    else if (notification is OverscrollNotification) {
      if (_status == STATUE.DRAG || _status == STATUE.ARMED) {
        _dragOffSet -= notification.overscroll / 2.0;
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    }
    //滚动结束
    else if (notification is ScrollEndNotification) {
      print('滚动结束');
      switch (_status) {
        case STATUE.ARMED:
          _show();
          break;
        case STATUE.DRAG:
          _dismiss(STATUE.CANCELED);
          break;
        default:
          break;
      }
    }
    return false;
  }

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
    _positionController.value = 0.0;
    return true;
  }

  //取消刷新
  Future<void> _dismiss(STATUE status) async {
    await Future<void>.value();
    setState(() {
      _status = status;
    });
    switch (_status) {
      case STATUE.DONE:
        //大小变为1.0
        await _positionController.animateTo(
          0.0,
          duration: Duration(
            milliseconds: 500,
          ),
        );
        break;
      case STATUE.CANCELED:
        //位移变为0.0
        await _positionController.animateTo(
          0.0,
          duration: Duration(
            milliseconds: 500,
          ),
        );
        break;
      default:
        assert(false);
        break;
    }
    //取消变为null
    if (mounted && _status == status) {
      _dragOffSet = null;
      _isTop = null;
      setState(() {
        _status = null;
      });
    }
  }

  //检查拖动偏移
  void _checkDragOffset(double viewportDimension) {
    double newValue = _dragOffSet/(viewportDimension*defaultDragPercentage);
    if (_status == STATUE.ARMED)
      newValue = math.max(newValue, 1.0 / defaultDragLimit);
    _positionController.value = newValue.clamp(0.0, 1.0);
    if (_status == STATUE.DRAG&&_dragOffSet>widget.refreshHeight) {
      _status = STATUE.ARMED;
    }
  }

  Future<void> _pendingRefreshFuture;

  //当前为松开状态
  void _show() {
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _status = STATUE.SNAP;
    _positionController
        .animateTo(1.0 / defaultDragLimit,
            duration: defaultSnap)
        .then((_) {
      if (mounted && _status == STATUE.SNAP) {
        setState(() {
          _status = STATUE.REFRESH;
        });

        final Future<void> refreshResult = widget.onRefresh();

        if (refreshResult == null) {
          return;
        }
        refreshResult.whenComplete(() {
          if (mounted && _status == STATUE.REFRESH) {
            completer.complete();
            _dismiss(STATUE.DONE);
          }
        });
      }
    });
  }

  bool _handleOverScrollNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) return false;

    if (_status == STATUE.DRAG) {
      notification.disallowGlow();
      return true;
    }
    return false;
  }

  //处理当前状态
  String _handleStatus() {
    switch (_status) {
      case STATUE.DRAG:
        //下拉
        return '下拉刷新';
      case STATUE.ARMED:
        //松开刷新
        return '松开刷新';
      case STATUE.SNAP:
        //松开
        return '松开状态';
      case STATUE.REFRESH:
        //刷新中
        return '刷新中';
      case STATUE.DONE:
        //刷新完毕
        return '刷新完毕';
      case STATUE.CANCELED:
        //刷新取消
        return '刷新取消';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget child = NotificationListener<ScrollNotification>(
      key: _scrollKey,
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleOverScrollNotification,
        child: widget.child,
      ),
    );
    if (_status == null) {
      return child;
    }
    final bool showIndeterminateIndicator =
        _status == STATUE.REFRESH || _status == STATUE.DONE;
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _positionController,
          builder: (BuildContext context, Widget a) {
            return Padding(
              padding: EdgeInsets.only(
                  top: showIndeterminateIndicator
                      ? 0.0
                      : _dragOffSet<0?0.0:_dragOffSet),
              child: child,
            );
          },
        ),
        Positioned(
          top: _isTop ? 0.0 : null,
          bottom: !_isTop ? 0.0 : null,
          left: 0.0,
          right: 0.0,
          child: Container(
            alignment: _isTop ? Alignment.topCenter : Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: _positionController,
              builder: (BuildContext context, Widget child) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.blue),
                  height: showIndeterminateIndicator
                      ? 0.0
                      :  _dragOffSet<0?0.0:_dragOffSet,
                  child: SingleChildScrollView(
                    child: Text(
                      _handleStatus(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
