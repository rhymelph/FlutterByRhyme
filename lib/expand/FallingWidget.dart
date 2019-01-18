import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/services.dart';

const Duration _kDuration = Duration(seconds: 5);

class FallingWidget extends StatefulWidget {
  final int count;
  final String imagePath;

  const FallingWidget({Key key, this.count, this.imagePath}) : super(key: key);

  @override
  _FallingWidgetState createState() => _FallingWidgetState();
}

class _FallingWidgetState extends State<FallingWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<_FallingObject> objects;
  ui.Image image;

  @override
  void initState() {
    objects =
        List<_FallingObject>.generate(widget.count, (_) => _FallingObject())
            .toList();
    PlatformAssetBundle().load(widget.imagePath).then((i) {
      Uint8List uint8list = Uint8List.view(i.buffer, 0, i.lengthInBytes);
      ui.decodeImageFromList(uint8list, (image) {
        setState(() {
          this.image = image;
        });
      });
    });
    _controller = AnimationController(vsync: this, duration: _kDuration);
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFallingWidget(double animationValue) {
    return widget.imagePath != null
        ? (image != null
            ? Container(
                constraints: BoxConstraints.tightFor(
                  height: double.infinity,
                  width: double.infinity,
                ),
                child: CustomPaint(
                  painter: _FallingPainter(
                    animationValue: animationValue,
                    objectList: objects,
                    image: image,
                  ),
                ),
              )
            : Center(
                child: Text('加载中'),
              ))
        : Container(
            constraints: BoxConstraints.tightFor(
              height: double.infinity,
              width: double.infinity,
            ),
            child: CustomPaint(
              painter: _FallingPainter(
                animationValue: animationValue,
                objectList: objects,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return _buildFallingWidget(_controller.value);
      },
    );
  }
}

class _FallingPainter extends CustomPainter {
  final double animationValue;

  final double radius = 15.0;

  final List<_FallingObject> objectList;

  final ui.Image image;

  _FallingPainter({this.animationValue, this.objectList, this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image != null) {
      for (_FallingObject obj in objectList) {
        obj.drawObject(canvas, size, image);
      }
    } else {
      for (_FallingObject obj in objectList) {
        obj.drawCircle(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(_FallingPainter oldDelegate) {
    return oldDelegate.animationValue != this.animationValue;
  }
}

class _FallingObject {
  double objX;
  double objY;

  double parentWidget;
  double parentHeight;

  double presentSpeech;
  double presentX;
  double presentY;

  Random random;

  double moveX;
  double moveY;

  double speech = 3.0;

  double radius = 0.0;

  _FallingObject() {
    random = new Random();
    init();
  }

  void init() {
    objX = random.nextDouble();
    objY = random.nextDouble();
    radius = 10 * random.nextDouble();
    speech = radius * 0.3;
  }

  void drawObject(Canvas canvas, Size size, ui.Image image) {
    presentX = objX * size.width;
    presentY = objY * size.height - size.height;
    if (moveY == null) {
      moveY = presentY;
    }
    moveX = presentX;
    moveY += 3;
    if (moveY >= size.height) {
      moveY = presentY;
    }
    canvas.drawImage(image, Offset(moveX, moveY), Paint());
  }

  void drawCircle(Canvas canvas, Size size) {
    if (presentY == null) {
      presentX = objX * size.width;
      presentY = objY * size.height - size.height;
    }
    if (moveY == null) {
      moveY = presentY;
    }
    if (moveY >= size.height) {
      init();
      moveY = presentY;
    }
    moveX = presentX;
    moveY += speech;

    canvas.drawCircle(
        Offset(moveX, moveY),
        radius,
        Paint()
          ..color = Colors.white
          ..isAntiAlias = true);
  }
}
