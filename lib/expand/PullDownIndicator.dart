import 'package:flutter/material.dart';
import 'dart:async';

const double defaultRefreshHeight = 50.0;
const double defaultDragPercentage = 0.25;

const Duration defaultDuration = Duration(milliseconds: 250);
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

class RhyRefreshIndicator extends StatefulWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final RefreshCallback onLoading;
  final RefreshBody header;
  final RefreshBody footer;

  final double refreshHeight;

  const RhyRefreshIndicator({
    Key key,
    @required this.child,
    @required this.onLoading,
    @required this.onRefresh,
    @required this.header,
    @required this.footer,
    this.refreshHeight = defaultRefreshHeight,
  })  : assert(child != null),
        assert(onRefresh != null),
        assert(header != null);

  @override
  _RhyRefreshIndicatorState createState() => _RhyRefreshIndicatorState();
}

class _RhyRefreshIndicatorState extends State<RhyRefreshIndicator>
    with TickerProviderStateMixin {
  //位置
  AnimationController _positionController;

  //刷新状态
  STATUE _statusRefresh;

  STATUE _statusLoading;

  //是否在顶部
  bool _isTop;

  bool _isBottom;

  //拖动偏移
  double _dragOffSet;

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
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
    if (notification.metrics.extentBefore == 0.0 &&
        _statusRefresh == null &&
        _statusLoading == null &&
        _startRefresh(notification.metrics.axisDirection)) {
      setState(() {
        _statusLoading = null;
        _statusRefresh = STATUE.DRAG;
      });
      return false;
    } else if (notification.metrics.extentAfter == 0.0 &&
        _statusLoading == null &&
        _statusRefresh == null &&
        _startLoading(notification.metrics.axisDirection)) {
      setState(() {
        _statusRefresh = null;
        _statusLoading = STATUE.DRAG;
      });
    } else if (notification is ScrollUpdateNotification) {
      ///检查拖动
      if (_statusRefresh == STATUE.DRAG || _statusRefresh == STATUE.ARMED) {
        _dragOffSet -= notification.scrollDelta;
        _checkRefreshDragOffset(notification.metrics.viewportDimension);
      } else if (_statusLoading == STATUE.DRAG ||
          _statusLoading == STATUE.ARMED) {
        _dragOffSet += notification.scrollDelta;
        _checkLoadingDragOffset(notification.metrics.viewportDimension);
      }

      ///拖动完成开始加载
      if (_statusRefresh == STATUE.ARMED && notification.dragDetails == null) {
        //拖动完成，开始刷新
        _showRefresh();
      } else if (_statusLoading == STATUE.ARMED &&
          notification.dragDetails == null) {
        //拖动完成，开始加载
        _showLoading();
      }
//      if (_statusRefresh == STATUE.DRAG || _statusRefresh == STATUE.ARMED) {
//        _dragOffSet -= notification.scrollDelta;
//        _checkRefreshDragOffset(notification.metrics.viewportDimension);
//      }
//      if (_statusRefresh == STATUE.ARMED && notification.dragDetails == null) {
//        //拖动完成，开始刷新
//        _showRefresh();
//      }
    }
    //过度滚动
    else if (notification is OverscrollNotification) {
      if (_statusRefresh == STATUE.DRAG || _statusRefresh == STATUE.ARMED) {
        _dragOffSet -= notification.overscroll / 2.0;
        _checkRefreshDragOffset(notification.metrics.viewportDimension);
      } else if (_statusLoading == STATUE.DRAG ||
          _statusLoading == STATUE.ARMED) {
        _dragOffSet += notification.overscroll / 2.0;
        _checkLoadingDragOffset(notification.metrics.viewportDimension);
      }
    }
    //滚动结束
    else if (notification is ScrollEndNotification) {
      print('滚动结束');
      switch (_statusRefresh) {
        case STATUE.ARMED:
          _showRefresh();
          break;
        case STATUE.DRAG:
          _dismissRefresh(STATUE.CANCELED);
          break;
        default:
          break;
      }

      switch (_statusLoading) {
        case STATUE.ARMED:
          _showLoading();
          break;
        case STATUE.DRAG:
          _dismissLoading(STATUE.CANCELED);
          break;
        default:
          break;
      }
    }
    return false;
  }

  //开始刷新
  bool _startRefresh(AxisDirection axisDirection) {
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

  bool _startLoading(AxisDirection axisDirection) {
    switch (axisDirection) {
      case AxisDirection.down:
        _isBottom = true;
        break;
      case AxisDirection.up:
        _isBottom = false;
        break;
      case AxisDirection.left:
      case AxisDirection.right:
        _isBottom = null;
        return false;
    }
    //重置数值
    _dragOffSet = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  //取消刷新
  Future<void> _dismissRefresh(STATUE status) async {
    await Future<void>.value();
    setState(() {
      _statusRefresh = status;
    });
    switch (_statusRefresh) {
      case STATUE.DONE:
        //大小变为1.0
        Future.delayed(Duration(milliseconds: 500)).then((_) async {
          await _positionController.animateTo(
            0.0,
            duration: defaultDuration,
          );
          //取消变为null
          if (mounted && _statusRefresh == status) {
            _dragOffSet = null;
            _isTop = null;
            setState(() {
              _statusRefresh = null;
            });
          }
        });
        break;
      case STATUE.CANCELED:
        //位移变为0.0
        double precent = _dragOffSet / widget.refreshHeight;
        await _positionController.animateTo(
          0.0,
          duration: Duration(
              milliseconds: (defaultDuration.inMilliseconds * precent).toInt()),
        );
        //取消变为null
        if (mounted && _statusRefresh == status) {
          _dragOffSet = null;
          _isTop = null;
          setState(() {
            _statusRefresh = null;
          });
        }
        break;
      default:
        assert(false);
        break;
    }
  }

  void _dismissLoading(STATUE status) async {
    await Future<void>.value();
    setState(() {
      _statusLoading = status;
    });
    switch (_statusLoading) {
      case STATUE.DONE:
        //大小变为1.0
        Future.delayed(Duration(milliseconds: 500)).then((_) async {
          await _positionController.animateTo(
            0.0,
            duration: defaultDuration,
          );
          //取消变为null
          if (mounted && _statusLoading == status) {
            _dragOffSet = null;
            _isBottom = null;
            setState(() {
              _statusLoading = null;
            });
          }
        });
        break;
      case STATUE.CANCELED:
        //位移变为0.0
        double precent = _dragOffSet / widget.refreshHeight;
        await _positionController.animateTo(
          0.0,
          duration: Duration(
              milliseconds: (defaultDuration.inMilliseconds * precent).toInt()),
        );
        //取消变为null
        if (mounted && _statusLoading == status) {
          _dragOffSet = null;
          _isBottom = null;
          setState(() {
            _statusLoading = null;
          });
        }
        break;
      default:
        assert(false);
        break;
    }
  }

  //检查拖动偏移
  void _checkRefreshDragOffset(double viewportDimension) {
    double newValue = _dragOffSet / widget.refreshHeight;
//    if (_status == STATUE.ARMED)
//      newValue = math.max(newValue, 1.0 / defaultDragLimit);
//    print(newValue);
    _positionController.value = newValue.clamp(0.0, 1.0);
    if (_statusRefresh == STATUE.DRAG && _dragOffSet > widget.refreshHeight) {
      _statusRefresh = STATUE.ARMED;
    } else if (_dragOffSet < widget.refreshHeight) {
      _statusRefresh = STATUE.DRAG;
    }
  }

  void _checkLoadingDragOffset(double viewportDimension) {
    double newValue = _dragOffSet / widget.refreshHeight;
//    if (_status == STATUE.ARMED)
//      newValue = math.max(newValue, 1.0 / defaultDragLimit);
//    print(newValue);
    _positionController.value = newValue.clamp(0.0, 1.0);
    if (_statusLoading == STATUE.DRAG && _dragOffSet > widget.refreshHeight) {
      _statusLoading = STATUE.ARMED;
    } else if (_dragOffSet < widget.refreshHeight) {
      _statusLoading = STATUE.DRAG;
    }
  }

  Future<void> _pendingRefreshFuture;
  Future<void> _pendingLoadingFuture;

  //当前为松开状态
  void _showRefresh() {
    final Completer<void> completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _statusRefresh = STATUE.SNAP;

    double drawPresent = widget.refreshHeight / _dragOffSet;
    _positionController
        .animateTo(
      drawPresent,
      duration: defaultDuration,
    )
        .then((_) {
      if (mounted && _statusRefresh == STATUE.SNAP) {
        setState(() {
          _statusRefresh = STATUE.REFRESH;
        });

        final Future<void> refreshResult = widget.onRefresh();

        if (refreshResult == null) {
          return;
        }
        refreshResult.whenComplete(() {
          if (mounted && _statusRefresh == STATUE.REFRESH) {
            completer.complete();
            _dismissRefresh(STATUE.DONE);
          }
        });
      }
    });
  }

  void _showLoading() {
    final Completer<void> completer = Completer<void>();
    _pendingLoadingFuture = completer.future;
    _statusLoading = STATUE.SNAP;

    double drawPresent = widget.refreshHeight / _dragOffSet;
    _positionController
        .animateTo(
      drawPresent,
      duration: defaultDuration,
    )
        .then((_) {
      if (mounted && _statusLoading == STATUE.SNAP) {
        setState(() {
          _statusLoading = STATUE.REFRESH;
        });

        final Future<void> loadingResult = widget.onLoading();

        if (loadingResult == null) {
          return;
        }
        loadingResult.whenComplete(() {
          if (mounted && _statusLoading == STATUE.REFRESH) {
            completer.complete();
            _dismissLoading(STATUE.DONE);
          }
        });
      }
    });
  }

  bool _handleOverScrollNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) return false;

    if (_statusRefresh == STATUE.DRAG || _statusLoading == STATUE.DRAG) {
      notification.disallowGlow();
      return true;
    }
    return false;
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
    if (_statusRefresh == null && _statusLoading == null) {
      return child;
    }
    final bool showIndeterminateIndicator = _statusRefresh == STATUE.REFRESH;
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _positionController,
          builder: (BuildContext context, Widget a) {
            //                print(_positionController.value);
            double top = 0.0;
            double bottom = 0.0;

            if (_statusRefresh == STATUE.DRAG ||
                _statusRefresh == STATUE.ARMED) {
              top = _dragOffSet;
            } else if (_statusRefresh != null) {
              top = _dragOffSet * _positionController.value;
              print('刷新list的高度:$top');
            }
            top = top < 0.0 ? 0.0 : top;
            if (_statusLoading == STATUE.DRAG ||
                _statusLoading == STATUE.ARMED) {
              bottom = _dragOffSet;
            } else if (_statusLoading != null) {
              bottom = _dragOffSet * _positionController.value;
            }
            bottom = bottom < 0.0 ? 0.0 : bottom;
            print('加载list的的高度:$bottom');
//            widget.refreshHeight*_positionFactor.value<0?0.0:widget.refreshHeight*_positionFactor.value
            return Padding(
              padding: EdgeInsets.only(top: top, bottom: bottom),
              child: child,
            );
          },
        ),
        _isTop != null
            ? Positioned(
                top: _isTop ? 0.0 : null,
                bottom: !_isTop ? 0.0 : null,
                left: 0.0,
                right: 0.0,
                child: Container(
                  alignment:
                      _isTop ? Alignment.topCenter : Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget child) {
//                print(_positionController.value);
                      double height;
                      if (_statusRefresh == STATUE.DRAG ||
                          _statusRefresh == STATUE.ARMED) {
                        height = _dragOffSet;
                      } else if (_statusRefresh != null) {
                        height = _dragOffSet * _positionController.value;
                        print('头部的高度:$height');
                      }

                      height = height < 0.0 ? 0.0 : height;

//                widget.refreshHeight*_positionFactor.value<0?0.0:widget.refreshHeight*_positionFactor.value
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.blue),
                        height: height,
                        child: SingleChildScrollView(
                          child: _getHeader(),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Text(''),
        _isBottom != null
            ? Positioned(
                top: !_isBottom ? 0.0 : null,
                bottom: _isBottom ? 0.0 : null,
                left: 0.0,
                right: 0.0,
                child: Container(
                  alignment:
                      _isBottom ? Alignment.topCenter : Alignment.bottomCenter,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget child) {
//                print(_positionController.value);
                      double height = 0.0;
                      if (_statusLoading == STATUE.DRAG ||
                          _statusLoading == STATUE.ARMED) {
                        height = _dragOffSet;
                      } else if (_statusLoading != null) {
                        height = _dragOffSet * _positionController.value;
                      }
                      height = height < 0.0 ? 0.0 : height;
                      print('脚部的高度:$height');
//                widget.refreshHeight*_positionFactor.value<0?0.0:widget.refreshHeight*_positionFactor.value
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.blue),
                        height: height,
                        child: SingleChildScrollView(
                          child: _getFooter(),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Text(''),
      ],
    );
  }

  Widget _getHeader() {
    switch (_statusRefresh) {
      case STATUE.DRAG:
        return widget.header.onDrag();
      case STATUE.ARMED:
        return widget.header.onArmed();
      case STATUE.SNAP:
        return widget.header.onSnap();
      case STATUE.REFRESH:
        return widget.header.onRefresh();
      case STATUE.DONE:
        return widget.header.onDone();
      case STATUE.CANCELED:
        return widget.header.onCancel();
    }
    return Text('');
  }

  Widget _getFooter() {
    switch (_statusLoading) {
      case STATUE.DRAG:
        return widget.footer.onDrag();
      case STATUE.ARMED:
        return widget.footer.onArmed();
      case STATUE.SNAP:
        return widget.footer.onSnap();
      case STATUE.REFRESH:
        return widget.footer.onRefresh();
      case STATUE.DONE:
        return widget.footer.onDone();
      case STATUE.CANCELED:
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
