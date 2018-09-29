import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:math';
class ClipOvalDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/ClipOval';
  final String detail = '''使用椭圆剪辑其子项的小部件。

默认情况下，将轴对齐的椭圆形刻入其布局尺寸，并防止其子项在椭圆形外部绘制，但可以使用自定义限幅器自定义剪辑椭圆的大小和位置。''';

  @override
  _ClipOvalDemoState createState() => _ClipOvalDemoState();
}

class _ClipOvalDemoState extends ExampleState<ClipOvalDemo> {
  ClipOvalSetting setting;

  List<Value<Clip>> _clipValues=[];

  @override
  void initState() {
    _clipValues.addAll(clipValues);
    _clipValues.remove(Value(
      name:'none',
      value: Clip.none,
      label: 'Clip.none',
    ));
    setting = ClipOvalSetting(
      clipBehavior: _clipValues[0],
      clipper: Value(
        value: IdeaCustomOvalClipper(),
        label: 'IdeaCustomClipper()',
      ),
    );
    setting=setting.copyWith(child: _formatValue());
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
      child: ClipOval(
        clipBehavior: setting?.clipBehavior?.value,
        clipper: setting?.clipper?.value,
        child: Image.asset('images/burgers.jpg'),
      ),
    );
  }
  
  String _formatLabel(){
    return '''ClipOval(
      clipBehavior: ${setting?.clipBehavior?.label??''},
      clipper: ${setting?.clipper?.label??''},
      child: Image.asset('images/burgers.jpg'),
    )
    
class IdeaCustomOvalClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {
    //size 为父容器的大小
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
    return setting?.child?.label;
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
      })
    ];
  }

  @override
  String getTitle() {
    return 'ClipOval';
  }

  @override
  Widget getWidget() {
    return setting.child?.value;
  }
}

class ClipOvalSetting {
  final Value<CustomClipper<Rect>> clipper;
  final Value<Clip> clipBehavior;
  final Value<Widget> child;
  ClipOvalSetting({
    this.clipper,
    this.clipBehavior,
    this.child,
  });

  ClipOvalSetting copyWith({
    Value<CustomClipper<Rect>> clipper,
    Value<Clip> clipBehavior,
    Value<Widget> child,
  }) {
    return ClipOvalSetting(
      clipBehavior: clipBehavior ?? this.clipBehavior,
      clipper: clipper ?? this.clipper,
      child: child ?? this.child,
    );
  }
}

class IdeaCustomOvalClipper extends CustomClipper<Rect>{
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

