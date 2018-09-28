import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ThemeDemo extends StatefulWidget {
  static const String routeName = 'widgets/styling/Theme';
  final String detail = '''将主题应用于后代窗口小部件。

主题描述应用程序的颜色和印刷选择。

后代小部件使用Theme.of获取当前主题的ThemeData对象 。当窗口小部件使用Theme.of时，如果主题稍后更改，它将自动重建，以便可以应用更改。

的主题插件意味着一个IconTheme插件，设置为的值 ThemeData.iconTheme所述的数据为主题。''';

  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends ExampleState<ThemeDemo> {
  ThemeSetting setting;

  @override
  void initState() {
    setting = ThemeSetting(
      child: Value(
        value: ThemeWidget(),
      ),
      data: Value(value: ThemeData(
      )),
      isMaterialAppTheme: boolValues[0],
    );
    super.initState();
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
      SwitchValueTitleWidget(
          title: StringParams.kIsMaterialAppTheme,
          value: setting.isMaterialAppTheme,
          onChanged: (value) {
            setState(() {
              setting = setting.copyWith(isMaterialAppTheme: value);
            });
          })
    ];
  }

  @override
  String getTitle() {
    return 'Theme';
  }

  @override
  Widget getWidget() {
    return Theme(
      data: setting.data?.value,
      isMaterialAppTheme: setting.isMaterialAppTheme?.value,
      child: setting.child?.value,
    );
  }
}

class ThemeSetting {
  final Value<ThemeData> data;
  final Value<bool> isMaterialAppTheme;
  final Value<Widget> child;

  ThemeSetting({
    @required this.data,
    this.isMaterialAppTheme,
    @required this.child,
  });

  ThemeSetting copyWith({
    Value<ThemeData> data,
    Value<bool> isMaterialAppTheme,
    Value<Widget> child,
  }) {
    return ThemeSetting(
      data: data ?? this.data,
      isMaterialAppTheme: isMaterialAppTheme ?? this.isMaterialAppTheme,
      child: child ?? this.child,
    );
  }
}

class ThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      Size size = constraints.biggest;
      return Center(
        child: Container(
          width: size.width - 100.0,
          alignment: Alignment.center,
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/burgers.jpg',
                  fit: BoxFit.cover,
                  width: size.width - 100.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_half,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Burgers',
                  style: Theme.of(context).textTheme.title,
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          r'$9.9',
                          style: Theme.of(context).textTheme.display2.copyWith(
                                color: Colors.red,
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuItem>[
                              PopupMenuItem(child: Text('Buy')),
                              PopupMenuItem(child: Text('Add to Cart')),
                            ];
                          },
                          icon: Icon(Icons.more_horiz),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
