import 'package:flutter/material.dart';


const _defaultWidget = 135.0;

enum _FlingGesture{normal,forward,reverse}
class DragItem extends StatefulWidget {
  final Widget child;
  final Duration moveDuration;
  final Widget left;
  final Widget right;
  const DragItem({Key key, this.child,this.moveDuration, this.left, this.right,}) : super(key: key);

  @override
  _DragItemState createState() => _DragItemState();
}

class _DragItemState extends State<DragItem>
with TickerProviderStateMixin,
AutomaticKeepAliveClientMixin{
  AnimationController _moveController;
  Animation<Offset> _moveAnimator;

  double _dragOffset=0.0;

  @override
  void initState() {
    _moveController=new AnimationController(vsync: this,duration: widget.moveDuration)
    ..addListener(_handleDismissStatusChanged);

    super.initState();
  }

  @override
  void dispose() {
    _moveController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handDragStart,
      onHorizontalDragEnd: _handDragEnd,
      onHorizontalDragUpdate: _handDragUpdate,
      child: widget.child,
    );
  }

  void _handDragStart(DragStartDetails details) {
    print('start:${details.globalPosition}');
  }

  void _handDragEnd(DragEndDetails details) {
    print('end:${details.velocity}');

  }

  void _handDragUpdate(DragUpdateDetails details) {
    print('update:${details.delta}');

  }

  void _handleDismissStatusChanged() {

  }
  @override
  bool get wantKeepAlive => _moveController?.isAnimating==true;


}

class DragButtonBar extends StatelessWidget {
  final Widget left;
  final Widget right;
  final double elevation;

  const DragButtonBar({Key key, this.left, this.right, this.elevation = 8.0,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(width: _defaultWidget,),
      child: Material(
        elevation: elevation,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: left,
                  color: Colors.grey,
                )),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: right,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
