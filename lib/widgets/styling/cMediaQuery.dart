import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class MediaQueryDemo extends StatefulWidget {
  static const String routeName = 'widgets/styling/MediaQuery';
  final String detail = '''建立媒体查询解析给定数据的子树。

例如，要了解当前媒体的大小（例如，包含您的应用程序的窗口），您可以从MediaQuery.of返回的MediaQueryData中读取MediaQueryData.size属性： 。MediaQuery.of(context).size

使用MediaQuery.of查询当前媒体将导致您的窗口小部件在MediaQueryData更改时自动重建（例如，如果用户旋转其设备）。

如果没有MediaQuery在范围内，则MediaQuery.of方法将抛出异常，除非nullOk参数设置为true，在这种情况下它返回null。''';

  @override
  _MediaQueryDemoState createState() => _MediaQueryDemoState();
}

class _MediaQueryDemoState extends ExampleState<MediaQueryDemo> {
  MediaQuerySetting setting;
  MediaQueryDataSetting dataSetting;

  @override
  void initState() {
    setting = MediaQuerySetting(
      child: Value(
        value: MediaQueryWidget(),
        label: "MediaQueryWidget()",
      ),
    );
    dataSetting=MediaQueryDataSetting(
      size: Value(
        name: 'zero',
        value: Size.zero,
        label: 'Size.zero',
      ),
      devicePixelRatio: doubleMiniValues[1],
      textScaleFactor: doubleMiniValues[1],
      padding: edgeInsetsValues[0],
      viewInsets: edgeInsetsValues[0],
      alwaysUse24HourFormat: boolValues[0],
      accessibleNavigation:  boolValues[0],
      invertColors:  boolValues[0],
      disableAnimations:  boolValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''MediaQuery(
      child: ${setting.child?.label??''},
      data: MediaQueryData(
        size: ${dataSetting.size?.label??''},
        devicePixelRatio: ${dataSetting.devicePixelRatio?.label??''},
        textScaleFactor: ${dataSetting?.textScaleFactor?.label??''},
        padding: ${dataSetting.padding?.label??''},
        viewInsets: ${dataSetting.viewInsets?.label??''},
        alwaysUse24HourFormat: ${dataSetting.alwaysUse24HourFormat?.label??''},
        accessibleNavigation: ${dataSetting.accessibleNavigation?.label??''},
        invertColors: ${dataSetting.invertColors?.label??''},
        disableAnimations: ${dataSetting.disableAnimations?.label??''},
      ),
    )
    
    
'''+r'''class MediaQueryWidget extends StatelessWidget {
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
}''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kScreenSize),
      Center(
        child: Text('${MediaQuery.of(context).size}'),
      ),
      ValueTitleWidget(StringParams.kScreenOrientation),
      Center(
        child: Text('${MediaQuery.of(context).orientation==Orientation.landscape?'横屏':'竖屏'}'),
      ),
      ValueTitleWidget(StringParams.kPadding),
      RadioGroupWidget(dataSetting.padding, edgeInsetsValues, (value){
        setState(() {
          dataSetting=dataSetting.copyWith(padding: value);
        });
      }),
      ValueTitleWidget(StringParams.kViewInsets),
      RadioGroupWidget(dataSetting.viewInsets, edgeInsetsValues, (value){
        setState(() {
          dataSetting=dataSetting.copyWith(viewInsets: value);
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kAlwaysUse24HourFormat, value: dataSetting.alwaysUse24HourFormat, onChanged: (value){
        setState(() {
          setState(() {
            dataSetting=dataSetting.copyWith(alwaysUse24HourFormat: value);
          });
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kAccessibleNavigation, value: dataSetting.accessibleNavigation, onChanged: (value){
        setState(() {
          setState(() {
            dataSetting=dataSetting.copyWith(accessibleNavigation: value);
          });
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kInvertColors, value: dataSetting.invertColors, onChanged: (value){
        setState(() {
          setState(() {
            dataSetting=dataSetting.copyWith(invertColors: value);
          });
        });
      }),
      SwitchValueTitleWidget(title: StringParams.kDisableAnimations, value: dataSetting.disableAnimations, onChanged: (value){
        setState(() {
          setState(() {
            dataSetting=dataSetting.copyWith(disableAnimations: value);
          });
        });
      }),
      DropDownValueTitleWidget<double>(
        selectList: doubleMiniValues,
        title: StringParams.kDevicePixelRatio,
        value: dataSetting.devicePixelRatio,
        onChanged: (value) {
          setState(() {
            dataSetting = dataSetting.copyWith(
              devicePixelRatio: value,
            );
          });
        },
      ),
      DropDownValueTitleWidget<double>(
        selectList: doubleMiniValues,
        title: StringParams.kTextScaleFactor,
        value: dataSetting.textScaleFactor,
        onChanged: (value) {
          setState(() {
            dataSetting = dataSetting.copyWith(
              textScaleFactor: value,
            );
          });
        },
      ),
    ];
  }

  @override
  String getTitle() {
    return 'MediaQuery';
  }

  @override
  Widget getWidget() {
    return MediaQuery(
      child: setting.child?.value,
      data: MediaQueryData(
        size: dataSetting.size?.value,
        devicePixelRatio: dataSetting.devicePixelRatio?.value,
        textScaleFactor: dataSetting?.textScaleFactor?.value,
        padding: dataSetting.padding?.value,
        viewInsets: dataSetting.viewInsets?.value,
        alwaysUse24HourFormat: dataSetting.alwaysUse24HourFormat?.value,
        accessibleNavigation: dataSetting.accessibleNavigation?.value,
        invertColors: dataSetting.invertColors?.value,
        disableAnimations: dataSetting.disableAnimations?.value,
      ),
    );
  }
}

class MediaQuerySetting {
  final Value<Widget> child;

  MediaQuerySetting({
    this.child,
  });

  MediaQuerySetting copyWith({
    Value<Widget> child,
  }) {
    return MediaQuerySetting(
      child: child ?? this.child,
    );
  }
}

class MediaQueryDataSetting{
  final Value<Size> size;
  final Value<double> devicePixelRatio;
  final Value<double> textScaleFactor;
  final Value<EdgeInsets> padding;
  final Value<EdgeInsets> viewInsets;
  final Value<bool> alwaysUse24HourFormat;
  final Value<bool> accessibleNavigation;
  final Value<bool> invertColors;
  final Value<bool> disableAnimations;
  MediaQueryDataSetting({
    this.size,
    this.devicePixelRatio,
    this.textScaleFactor,
    this.padding ,
    this.viewInsets,
    this.alwaysUse24HourFormat,
    this.accessibleNavigation,
    this.invertColors,
    this.disableAnimations,
});
  
  MediaQueryDataSetting copyWith({
   Value<Size> size,
   Value<double> devicePixelRatio,
   Value<double> textScaleFactor,
   Value<EdgeInsets> padding,
   Value<EdgeInsets> viewInsets,
   Value<bool> alwaysUse24HourFormat,
   Value<bool> accessibleNavigation,
   Value<bool> invertColors,
   Value<bool> disableAnimations,
}){
    return MediaQueryDataSetting(
      size: size??this.size,
      devicePixelRatio: devicePixelRatio??this.devicePixelRatio,
      textScaleFactor: textScaleFactor??this.textScaleFactor,
      padding: padding??this.padding,
      viewInsets: viewInsets??this.viewInsets,
      alwaysUse24HourFormat: alwaysUse24HourFormat??this.alwaysUse24HourFormat,
      accessibleNavigation: accessibleNavigation??this.accessibleNavigation,
      invertColors: invertColors??this.invertColors,
      disableAnimations: disableAnimations??this.disableAnimations,
    );
  }
}

class MediaQueryWidget extends StatelessWidget {
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