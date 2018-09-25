import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class DecoratedBoxTransitionDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/DecoratedBoxTransition';
  final String detail = '''动画版的DecoratedBox是其动画的不同属性装饰。''';

  @override
  _DecoratedBoxTransitionDemoState createState() =>
      _DecoratedBoxTransitionDemoState();
}

class _DecoratedBoxTransitionDemoState
    extends ExampleState<DecoratedBoxTransitionDemo>
    with SingleTickerProviderStateMixin {
  DecoratedBoxTransitionSetting setting;
  AnimationController _controller;

  Iterable<TweenSequenceItem<Decoration>> decorationTween() sync*{
   for (int i=0;i<decorationValues.length-1;i++){
     yield TweenSequenceItem<Decoration>(
       tween: DecorationTween(
         begin: decorationValues[i].value,
         end: decorationValues[i+1].value,
       ),
       weight: 2.0,
     );
   }
  }

  @override
  void dispose() {
    if(_controller!=null){
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    _controller = new AnimationController(vsync: this
        , duration: Duration(seconds: 10));
    setting = DecoratedBoxTransitionSetting(
      child: Value(
          value: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(),
              Text('DecoratedBoxTransition'),
            ],
          ),
        label: '''Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(),
              Text('DecoratedBoxTransition'),
            ],
          )''',
      ),
      position: decorationPositionValues[0],
      decoration: Value(
          value: TweenSequence(decorationTween().toList()).animate(_controller),
          label: 'TweenSequence(decorationTween().toList()).animate(_controller)',
      ),
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''//vsync: this 需要 with SingleTickerProviderStateMixin
AnimationController _controller = new AnimationController(vsync: this
        , duration: Duration(seconds: 10));
        
  Iterable<TweenSequenceItem<Decoration>> decorationTween() sync*{
   for (int i=0;i<decorationValues.length-1;i++){
     yield TweenSequenceItem<Decoration>(
       tween: DecorationTween(
         begin: decorationValues[i].value,
         end: decorationValues[i+1].value,
       ),
       weight: 1.0,
     );
   }
  }
  
DecoratedBoxTransition(
      decoration: ${setting.decoration?.label ?? ''},
      position: ${setting.position?.label ?? ''},
      child: ${setting.child?.label ?? ''},
    )
    
 //动画启动
 _controller.forward();''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(title: '动画启动',onPressed: (){
        _controller.repeat();
        _controller.forward();
      },),
      ValueTitleWidget(StringParams.kPosition),
      RadioGroupWidget(setting.position, decorationPositionValues, (value) {
        setState(() {
          setting = setting.copyWith(position: value);
        });
      }),
    ];
  }

  @override
  String getTitle() {
    return 'DecoratedBoxTransition';
  }

  @override
  Widget getWidget() {
    return Center(
      child: DecoratedBoxTransition(
        decoration: setting.decoration?.value,
        position: setting.position?.value,
        child: setting.child?.value,
      ),
    );
  }
}

class DecoratedBoxTransitionSetting {
  final Value<Animation<Decoration>> decoration;
  final Value<DecorationPosition> position;
  final Value<Widget> child;

  DecoratedBoxTransitionSetting({
    this.decoration,
    this.position,
    this.child,
  });

  DecoratedBoxTransitionSetting copyWith({
    Value<Animation<Decoration>> decoration,
    Value<DecorationPosition> position,
    Value<Widget> child,
  }) {
    return DecoratedBoxTransitionSetting(
      decoration: decoration ?? this.decoration,
      position: position ?? this.position,
      child: child ?? this.child,
    );
  }
}

