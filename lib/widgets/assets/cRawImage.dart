import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
import 'dart:ui' as ui;

class RawImageDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/RawImage';
  final String detail = '''''';

  @override
  _RawImageDemoState createState() => _RawImageDemoState();
}

class _RawImageDemoState extends ExampleState<RawImageDemo> {
  RawImageSetting setting;
  final GlobalKey key=new GlobalKey();

  bool isClick = false;

  @override
  void initState() {
    setting = new RawImageSetting(
      alignment: alignmentValues[0],
      repeat: repeatValues[0],
    );
    super.initState();
  }

  initData() async {
    RenderRepaintBoundary boundary=key.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    setState(() {
      setting = setting.copyWith(
        image: Value(
          value: image,
        ),
      );
    });
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return ''' final GlobalKey key=new GlobalKey();
        Column(
        children: <Widget>[
          RepaintBoundary(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/burgers.jpg'),
                Text('This is image'),
              ],
            ),
          ),
          RawImage(
            image: ${setting.image?.label??''},
            color: ${setting.color?.label??''},
            colorBlendMode: ${setting.colorBlendMode?.label??''},
            fit: ${setting.fit?.label??''},
            alignment: ${setting.alignment?.label??''},
            repeat: ${setting.repeat?.label??''},
            centerSlice: ${setting.centerSlice?.label??''},
            matchTextDirection: ${setting.matchTextDirection?.label??''},
          ),
        ],''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleButtonWidget(title: '获取截图', onPressed: (){
        initData();
        if(isClick==false){
          setState(() {
            isClick=true;
          });
        }
      }),
    ]..addAll(isClick?[
      ValueTitleWidget(StringParams.kColor),
      ColorGroupWidget(setting.color,  (value) {
        setState(() {
          setting = setting.copyWith(color: value);
        });
      }),
      ValueTitleWidget(StringParams.kColorBlendMode),
      RadioGroupWidget<BlendMode>(setting.colorBlendMode, colorBlendModeValues, (value) {
        setState(() {
          setting = setting.copyWith(colorBlendMode: value);
        });
      }),
      ValueTitleWidget(StringParams.kFit),
      RadioGroupWidget<BoxFit>(setting.fit, fitValues, (value) {
        setState(() {
          setting = setting.copyWith(fit: value);
        });
      }),
      ValueTitleWidget(StringParams.kAlignment),
      RadioGroupWidget<AlignmentGeometry>(setting.alignment, alignmentValues, (value) {
        setState(() {
          setting = setting.copyWith(alignment: value);
        });
      }),
      ValueTitleWidget(StringParams.kRepeat),
      RadioGroupWidget<ImageRepeat>(setting.repeat, repeatValues, (value) {
        setState(() {
          setting = setting.copyWith(repeat: value);
        });
      }),
      ValueTitleWidget(StringParams.kCenterSlice),
      RadioGroupWidget<Rect>(setting.centerSlice, centerSlideValues, (value) {
        setState(() {
          setting = setting.copyWith(centerSlice: value);
        });
      }),

      SwitchValueTitleWidget(
        title: StringParams.kMatchTextDirection,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(matchTextDirection: value);
          });
        },
        value: setting.matchTextDirection,
      ),
    ]:[]);
  }

  @override
  String getTitle() {
    return 'RawImage';
  }

  @override
  Widget getWidget() {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          RepaintBoundary(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/burgers.jpg'),
                Text('This is image'),
              ],
            ),
          ),
          RawImage(
            image: setting.image?.value,
            color: setting.color?.value,
            colorBlendMode: setting.colorBlendMode?.value,
            fit: setting.fit?.value,
            alignment: setting.alignment?.value,
            repeat: setting.repeat?.value,
            centerSlice: setting.centerSlice?.value,
            matchTextDirection: setting.matchTextDirection?.value,
          ),
        ],
      ),
    );
  }
}

class RawImageSetting {
  final Value<ui.Image> image;
  final Value<Color> color;
  final Value<BlendMode> colorBlendMode;
  final Value<BoxFit> fit;
  final Value<AlignmentGeometry> alignment;
  final Value<ImageRepeat> repeat;
  final Value<Rect> centerSlice;
  final Value<bool> matchTextDirection;

  RawImageSetting({
    this.image,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment,
    this.repeat,
    this.centerSlice,
    this.matchTextDirection: const Value<bool>(
      name: 'false',
      value: false,
      label: 'false',
    ),
  });

  RawImageSetting copyWith({
    Value<ui.Image> image,
    Value<Color> color,
    Value<BlendMode> colorBlendMode,
    Value<BoxFit> fit,
    Value<AlignmentGeometry> alignment,
    Value<ImageRepeat> repeat,
    Value<Rect> centerSlice,
    Value<bool> matchTextDirection,
  }) {
    return new RawImageSetting(
      image: image ?? this.image,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
      centerSlice: centerSlice ?? this.centerSlice,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
    );
  }
}
