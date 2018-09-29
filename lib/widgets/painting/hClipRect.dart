import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ClipRectDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/ClipRect';
  final String detail = '''''';

  @override
  _ClipRectDemoState createState() =>
      _ClipRectDemoState();
}

class _ClipRectDemoState
    extends ExampleState<ClipRectDemo> {
  ClipRectSetting setting;
  List<Value<Clip>> _clipValues=[];

  @override
  void initState() {
    _clipValues.addAll(clipValues);
    _clipValues.remove(Value(
      name:'none',
      value: Clip.none,
      label: 'Clip.none',
    ));
    setting = ClipRectSetting();
    super.initState();
  }
  Value<Widget> _formatValue(){
    return Value(
      value: _formatWidget(),
      label: _formatLabel(),
    );
  }
  Widget _formatWidget(){
    return Center(
      child: ClipRect(
        clipBehavior: setting?.clipBehavior?.value,
        clipper: setting?.clipper?.value,
        child: Image.asset('images/burgers.jpg'),
      ),
    );
  }

  String _formatLabel(){
    return '''ClipRect(
      clipBehavior: ${setting?.clipBehavior?.label??''},
      clipper: ${setting?.clipper?.label??''},
      child: Image.asset('images/burgers.jpg'),
    )
    
class IdeaCustomRectClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    //size 为子Widget大小
    double width=size.width/2;
    double height=size.height/2;
    double minValue=min(width, height);
    //返回一个裁剪矩形
    return Rect.fromCircle(center: Offset(width,height),radius: minValue);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    //是否需要重新剪切
    return true;
  }
}''';
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kClipBehavior),
      RadioGroupWidget(setting.clipBehavior, _clipValues, (value){
        setting=setting.copyWith(clipBehavior: value);
        setState(() {
          setting=setting.copyWith(child: _formatValue());
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ClipRect';
  }


  @override
  Widget getWidget() {
    return setting.child?.value;
  }
}

class ClipRectSetting {
  final Value<CustomClipper<Rect>> clipper;
  final Value<Clip> clipBehavior;
  final Value<Widget> child;
  ClipRectSetting({
    this.clipper,
    this.clipBehavior,
    this. child
  });

  ClipRectSetting copyWith({
    Value<CustomClipper<Path>> clipper,
    Value<Clip> clipBehavior,
    Value<Widget> child,
  }) {
    return ClipRectSetting(
      clipBehavior: clipBehavior ?? this.clipBehavior,
      clipper: clipper ?? this.clipper,
      child: child ?? this.child,
    );
  }
}

class IdeaCustomRectClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    //size 为子Widget大小
    double width=size.width/2;
    double height=size.height/2;
    double minValue=min(width, height);
    //返回一个裁剪矩形
    return Rect.fromCircle(center: Offset(width,height),radius: minValue);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    //是否需要重新剪切
    return true;
  }
}