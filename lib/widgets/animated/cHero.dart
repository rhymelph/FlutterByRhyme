import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class HeroDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/Hero';
  final String detail = '''一个小部件，标志着它的孩子是英雄动画的候选者。

当用导航器推送或弹出PayrouTE时，整个屏幕的内容将被替换。一条旧路线消失了，出现了一条新的路线。如果在两个路径上有一个共同的视觉特性，那么在路由转换期间，帮助用户确定该特性物理地从一个页面移动到另一个页面的方向。这种动画被称为英雄动画。英雄小部件在过渡期间“飞行”在导航器的覆盖层中，而在飞行中，它们没有显示在旧路线和新路线中的原始位置。

若要将小部件标记为这样的特性，请将其封装在英雄小部件中。当导航发生时，每个路径上的英雄小部件都由英雄控制器识别。对于每一对具有相同标签的英雄小部件，都会触发英雄动画。

如果一个英雄在导航发生时已经飞行，它的飞行动画将被重定向到它的新目的地。

对于每个标签，路由不能包含多于一个的英雄。''';

  @override
  _HeroDemoState createState() => _HeroDemoState();
}

class HeroSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        tag: 'Hero',
        child: Image.asset('images/burgers.jpg'),
      )),
    );
  }
}

class _HeroDemoState extends ExampleState<HeroDemo> {
  HeroSetting setting;

  @override
  void initState() {
    setting = HeroSetting(
        tag: Value(
          value: 'Hero',
          label: 'Hero',
        ),
        child: Value(
          label: '''FlatButton(
            onPressed: () {
              Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      new HeroSecond()));
            },
            child: Text('Hero'),
            color: Colors.grey[100],
          )''',
          value: FlatButton(
            onPressed: () {
              Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      new HeroSecond()));
            },
            child: Text('Hero'),
            color: Colors.grey[100],
          ),
        ),
        createRectTween: Value(
          value: (b,e){
            return MaterialRectCenterArcTween(begin: b,end: e);
          },
          label: '''(b,e){
            return MaterialRectCenterArcTween(begin: b,end: e);
          }''',
        ));
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Hero(
        child: ${setting.child?.label ?? ''},
        tag: ${setting.tag?.label ?? ''},
        createRectTween: ${setting.createRectTween?.label ?? ''},
      )
      
class HeroSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Hero(
        tag: 'Hero',
        child: Image.asset('images/burgers.jpg'),
      )),
    );
  }
}''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'Hero';
  }

  @override
  Widget getWidget() {
    return Center(
      child: Hero(
        child: setting.child?.value,
        tag: setting.tag?.value,
        createRectTween: setting.createRectTween?.value,
      ),
    );
  }
}

class HeroSetting {
  final Value<Widget> child;
  final Value<Object> tag;
  final Value<CreateRectTween> createRectTween;

  HeroSetting({
    this.tag,
    this.createRectTween,
    this.child,
  });

  HeroSetting copyWith({
    Value<Widget> child,
    Value<Object> tag,
    Value<CreateRectTween> createRectTween,
  }) {
    return HeroSetting(
      child: child ?? this.child,
      tag: tag ?? this.tag,
      createRectTween: createRectTween ?? this.createRectTween,
    );
  }
}
