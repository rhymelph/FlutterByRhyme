import 'package:flutter/material.dart';

const _defaultWidget = 135.0;
const _defaultElevation = 8.0;
enum _FlingGesture { normal, forward, reverse }

class DragTile extends StatefulWidget {
  final Widget child;
  final DragWidget dragWidget;
  final Duration duration;

  DragTile({
    Key key,
    this.child,
    this.dragWidget,
    this.duration,
  })  : assert(child != null),
        assert(dragWidget != null),
        super(key: key);

  @override
  _DragTileState createState() => _DragTileState();
}

class _DragTileState extends State<DragTile>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  Animation<Offset> _moveAnimator;
  AnimationController _moveController;

  @override
  void initState() {
    _moveController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _moveAnimator = _moveController.drive(
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(_defaultWidget, 0)));
    super.initState();
  }

  @override
  bool get wantKeepAlive => _moveController?.isAnimating == true;

  @override
  Widget build(BuildContext context) {
    Widget content = SlideTransition(
      position: _moveAnimator,
      child: widget.child,
    );

    List<Widget> children = [];
    if (DragWidget == null) {
      children.add(
        Positioned.fill(
          child: ClipRect(
              clipper: _DismissibleClipper(
                moveAnimation: _moveAnimator,
              ),
              child: _DragWidget(
                widget: widget.dragWidget,
                elevation: _defaultElevation,
              )),
        ),
      );
    }
    children.add(content);
    content = Stack(
      children: children,
    );
    return GestureDetector(
      onHorizontalDragStart: _handDragStart,
      onHorizontalDragEnd: _handDragEnd,
      onHorizontalDragUpdate: _handDragUpdate,
      child: content,
    );
  }



  void _handDragStart(DragStartDetails details) {
    print('start:${details.toString()}');
  }

  void _handDragEnd(DragEndDetails details) {
    print('end:${details.toString()}');

  }

  void _handDragUpdate(DragUpdateDetails details) {
    print('update:${details.toString()}');

  }
}

abstract class DragWidget {
  Widget itemOne();

  Widget itemTwo();
}

class _DragWidget extends StatelessWidget {
  final DragWidget widget;
  final double elevation;

  const _DragWidget({Key key, this.widget, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> clickList = [];
    if (widget.itemOne() != null) {
      clickList.add(
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: widget.itemOne(),
          color: Colors.grey,
        )),
      );
    }
    if (widget.itemTwo() != null) {
      clickList.add(
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: widget.itemTwo(),
          color: Colors.red,
        )),
      );
    }
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(
        width: _defaultWidget,
      ),
      child: Material(
        elevation: elevation,
        child: Row(
          children: clickList,
        ),
      ),
    );
  }
}


class _DismissibleClipper extends CustomClipper<Rect> {
  _DismissibleClipper({@required this.moveAnimation})
      : assert(moveAnimation != null),
        super(reclip: moveAnimation);

  final Animation<Offset> moveAnimation;

  @override
  Rect getClip(Size size) {
    final double offset = moveAnimation.value.dx * size.width;
    if (offset < 0)
      return Rect.fromLTRB(size.width + offset, 0.0, size.width, size.height);
    return Rect.fromLTRB(0.0, 0.0, offset, size.height);
  }

  @override
  Rect getApproximateClipRect(Size size) => getClip(size);

  @override
  bool shouldReclip(_DismissibleClipper oldClipper) {
    return oldClipper.moveAnimation.value != moveAnimation.value;
  }
}
