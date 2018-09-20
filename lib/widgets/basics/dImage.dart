import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ImageDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Image';
  final String detail = '''显示图像的小部件。
提供了几种构造函数，用于指定图像的各种方式：
new Image, ，用于从ImageProvider获取图像.
new Image.asset, 用于 使用密钥从AssetBundle获取图像。.
new Image.network, 用于从URL获取图像L.
new Image.file,用于从文件中获取图像.
new Image.memory, 用于从Uint8List获取图像.
支持以下图像格式：JPEG，PNG，GIF，动画GIF，WebP，动画WebP，BMP和WBMP
要自动执行像素密​​度感知资产分辨率，请使用AssetImage指定图像，并确保在窗口小部件树中的“ 图像”窗口小部件上方存在MaterialApp，WidgetsApp或MediaQuery窗口小部件。
使用paintImage绘制图像，paintImage更详细地描述了此类中各个字段的含义。''';

  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends ExampleState<ImageDemo> {
  ImageSetting setting;


  @override
  void initState() {
    // TODO: implement initState
    setting = ImageSetting(
      image: imageValues[0],
      alignment: alignmentValues[0],
      repeat: repeatValues[0],
    );
    super.initState();
  }

  @override
  String getDetail() {
    // TODO: implement getDetail
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''Image(
      image: ${setting.image?.label ?? imageValues[0].label},
      color: ${setting.color?.label ?? ''},
      colorBlendMode: ${setting.colorBlendMode?.label ?? ''},
      fit: ${setting.fit?.label ?? ''},
      alignment: ${setting.alignment?.label ?? 'Alignment.center'},
      repeat: ${setting.repeat?.label ?? 'ImageRepeat.noRepeat'},
      centerSlice: ${setting.centerSlice?.label ?? ''},
      matchTextDirection: ${setting.matchTextDirection?.label ?? 'false'},
      gaplessPlayback: ${setting.gaplessPlayback?.label ?? 'false'},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget(StringParams.kImage),
      RadioGroupWidget<ImageProvider>(setting.image, imageValues, (value) {
        setState(() {
          setting = setting.copyWith(image: value);
        });
      }),
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
      SwitchValueTitleWidget(
        title: StringParams.kGaplessPlayback,
        onChanged: (value) {
          setState(() {
            setting = setting.copyWith(gaplessPlayback: value);
          });
        },
        value: setting.gaplessPlayback,
      ),
    ];
  }

  @override
  String getTitle() {
    return 'Image';
  }

  @override
  Widget getWidget() {
    return Image(
      image: setting.image?.value,
      color: setting.color?.value,
      colorBlendMode: setting.colorBlendMode?.value,
      fit: setting.fit?.value,
      alignment: setting.alignment?.value,
      repeat: setting.repeat?.value,
      centerSlice: setting.centerSlice?.value,
      matchTextDirection: setting.matchTextDirection?.value,
      gaplessPlayback: setting.gaplessPlayback?.value,
    );
  }
}

class ImageSetting {
  final Value<ImageProvider> image;
  final Value<Color> color;
  final Value<BlendMode> colorBlendMode;
  final Value<BoxFit> fit;
  final Value<AlignmentGeometry> alignment;
  final Value<ImageRepeat> repeat;
  final Value<Rect> centerSlice;
  final Value<bool> matchTextDirection;
  final Value<bool> gaplessPlayback;
   ImageSetting({
    this.image,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment,
    this.repeat,
    this.centerSlice,
    this.matchTextDirection:const Value<bool>(
      name:'false',
      value: false,
      label: 'false',
    ),
    this.gaplessPlayback: const Value<bool>(
      name:'false',
      value: false,
      label: 'false',
    ),
  });
  ImageSetting copyWith({
    Value<ImageProvider> image,
    Value<Color> color,
    Value<BlendMode> colorBlendMode,
    Value<BoxFit> fit,
    Value<AlignmentGeometry> alignment,
    Value<ImageRepeat> repeat,
    Value<Rect> centerSlice,
    Value<bool> matchTextDirection,
    Value<bool> gaplessPlayback,
  }) {
    return new ImageSetting(
      image: image ?? this.image,
      color: color ?? this.color,
      colorBlendMode: colorBlendMode ?? this.colorBlendMode,
      fit: fit ?? this.fit,
      alignment: alignment ?? this.alignment,
      repeat: repeat ?? this.repeat,
      centerSlice: centerSlice ?? this.centerSlice,
      matchTextDirection: matchTextDirection ?? this.matchTextDirection,
      gaplessPlayback: gaplessPlayback ?? this.gaplessPlayback,
    );
  }
}
