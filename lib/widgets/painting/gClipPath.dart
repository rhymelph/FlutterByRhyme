import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ClipPathDemo extends StatefulWidget {
  static const String routeName = 'widgets/painting/ClipPath';
  final String detail = '''使用路径剪辑其子项的窗口小部件。

每当要绘制窗口小部件时，都会在委托上调用回调。回调返回一个路径，小部件阻止子项在路径外绘制。''';

  @override
  _ClipPathDemoState createState() =>
      _ClipPathDemoState();
}

class _ClipPathDemoState
    extends ExampleState<ClipPathDemo> {
  ClipPathSetting setting;
  List<Value<Clip>> _clipValues=[];

  @override
  void initState() {
    _clipValues.addAll(clipValues);
    _clipValues.remove(Value(
      name:'none',
      value: Clip.none,
      label: 'Clip.none',
    ));
    setting = ClipPathSetting(
      clipBehavior: _clipValues[0],
      clipper: Value(
        value: IdeaCustomPathClipper(),
        label: 'IdeaCustomPathClipper()',
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
      child: ClipPath(
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
    
class IdeaCustomPathClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // size 为子Width的大小
    Path path=Path();
    double width=size.width;
    double height=size.height;
    path.moveTo(width/2, 0.0);
    path.lineTo(0.0, height/2);
    path.lineTo(width/2, height);
    path.lineTo(width, height/2);
    return path;
  }
  @override
  bool shouldReclip(IdeaCustomPathClipper oldClipper) {
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
      }),
    ];
  }

  @override
  String getTitle() {
    return 'ClipPath';
  }


  @override
  Widget getWidget() {
    return setting.child?.value;
  }
}

class ClipPathSetting {
  final Value<CustomClipper<Path>> clipper;
  final Value<Clip> clipBehavior;
  final Value<Widget> child;
  ClipPathSetting({
    this.clipper,
    this.clipBehavior,
    this.child,
  });

  ClipPathSetting copyWith({
    Value<CustomClipper<Path>> clipper,
    Value<Clip> clipBehavior,
    Value<Widget> child,
  }) {
    return ClipPathSetting(
      clipBehavior: clipBehavior ?? this.clipBehavior,
      clipper: clipper ?? this.clipper,
      child: child ?? this.child,
    );
  }
}

class IdeaCustomPathClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // size 为子Width的大小
    Path path=Path();
    double width=size.width;
    double height=size.height;
    path.moveTo(width/2, 0.0);
    path.lineTo(0.0, height/2);
    path.lineTo(width/2, height);
    path.lineTo(width, height/2);
    return path;
  }
  @override
  bool shouldReclip(IdeaCustomPathClipper oldClipper) {
    //是否需要重新剪切
    return true;
  }

}