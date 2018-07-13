import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class ImageDemo extends StatefulWidget {
  static const String routeName = 'widgets/basics/Image';
  final String detail = '''A widget that displays an image.
Several constructors are provided for the various ways that an image can be specified:
new Image, for obtaining an image from an ImageProvider.
new Image.asset, for obtaining an image from an AssetBundle using a key.
new Image.network, for obtaining an image from a URL.
new Image.file, for obtaining an image from a File.
new Image.memory, for obtaining an image from a Uint8List.
The following image formats are supported: JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, and WBMP
To automatically perform pixel-density-aware asset resolution, specify the image using an AssetImage and make sure that a MaterialApp, WidgetsApp, or MediaQuery widget exists above the Image widget in the widget tree.
The image is painted using paintImage, which describes the meanings of the various fields on this class in more detail.
See also:
Icon, which shows an image from a font.
new Ink.image, which is the preferred way to show an image in a material application (especially if the image is in a Material and will have an InkWell on top of it).''';

  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends ExampleState<ImageDemo> {
  ImageSetting setting;

  Value<ImageProvider> _firstImage;
  Value<Color> _firstColor;
  Value<BlendMode> _firstColorBlendMode;
  Value<BoxFit> _firstFit;
  Value<AlignmentGeometry> _firstAlignment;
  Value<ImageRepeat> _firstRepeat;
  Value<Rect> _firstCenterSlice;
  Value<bool> _firstMatchTextDirection;
  Value<bool> _firstGaplessPlayback;

  @override
  void initState() {
    // TODO: implement initState
    setting = ImageSetting(
      image: AssetImage('images/burgers.jpg'),
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
      image: ${_firstImage?.label ?? 'images/burgers.jpg'},
      color: ${_firstColor?.label ?? ''},
      colorBlendMode: ${_firstColorBlendMode?.label ?? ''},
      fit: ${_firstFit?.label ?? ''},
      alignment: ${_firstAlignment?.label ?? 'Alignment.center'},
      repeat: ${_firstRepeat?.label ?? 'ImageRepeat.noRepeat'},
      centerSlice: ${_firstCenterSlice?.label ?? ''},
      matchTextDirection: ${_firstMatchTextDirection?.label ?? 'false'},
      gaplessPlayback: ${_firstGaplessPlayback?.label ?? 'false'},
    )''';
  }

  @override
  List<Widget> getSetting() {
    return [
      ValueTitleWidget('Image(图片)'),
      RadioGroupWidget<ImageProvider>(_firstImage, imageValues, (value) {
        setState(() {
          _firstImage = value;
          setting = setting.copyWith(image: value.value);
        });
      }),
      ValueTitleWidget('Color(颜色)'),
      ColorGroupWidget(_firstColor, colorValues, (value) {
        setState(() {
          _firstColor = value;
          setting = setting.copyWith(color: value.value);
        });
      }),
      ValueTitleWidget('ColorBlendMode(颜色混合模式)'),
      RadioGroupWidget<BlendMode>(_firstColorBlendMode, colorBlendModeValues, (value) {
        setState(() {
          _firstColorBlendMode = value;
          setting = setting.copyWith(colorBlendMode: value.value);
        });
      }),
      ValueTitleWidget('Fit(适配)'),
      RadioGroupWidget<BoxFit>(_firstFit, fitValues, (value) {
        setState(() {
          _firstFit = value;
          setting = setting.copyWith(fit: value.value);
        });
      }),
      ValueTitleWidget('Alignment(对齐)'),
      RadioGroupWidget<AlignmentGeometry>(_firstAlignment, alignmentValues, (value) {
        setState(() {
          _firstAlignment = value;
          setting = setting.copyWith(alignment: value.value);
        });
      }),
      ValueTitleWidget('Repeat(重复)'),
      RadioGroupWidget<ImageRepeat>(_firstRepeat, repeatValues, (value) {
        setState(() {
          _firstRepeat = value;
          setting = setting.copyWith(repeat: value.value);
        });
      }),
      ValueTitleWidget('CenterSlice(中心区域裁剪)'),
      RadioGroupWidget<Rect>(_firstCenterSlice, centerSlideValues, (value) {
        setState(() {
          _firstCenterSlice = value;
          setting = setting.copyWith(centerSlice: value.value);
        });
      }),
      SwitchValueTitleWidget(
        title: 'MatchTextDirection(匹配文本方向)',
        onChanged: (value) {
          setState(() {
            _firstMatchTextDirection = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(matchTextDirection: value);
          });
        },
        value: _firstMatchTextDirection?.value ?? false,
      ),
      SwitchValueTitleWidget(
        title: 'GaplessPlayback(图片改变使用旧图片)',
        onChanged: (value) {
          setState(() {
            _firstGaplessPlayback = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(gaplessPlayback: value);
          });
        },
        value: _firstGaplessPlayback?.value ?? false,
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
      image: setting.image,
      color: setting.color,
      colorBlendMode: setting.colorBlendMode,
      fit: setting.fit,
      alignment: setting.alignment,
      repeat: setting.repeat,
      centerSlice: setting.centerSlice,
      matchTextDirection: setting.matchTextDirection,
      gaplessPlayback: setting.gaplessPlayback,
    );
  }
}

class ImageSetting {
  final ImageProvider image;
  final Color color;
  final BlendMode colorBlendMode;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final ImageRepeat repeat;
  final Rect centerSlice;
  final bool matchTextDirection;
  final bool gaplessPlayback;

  ImageSetting({
    this.image,
    this.color,
    this.colorBlendMode,
    this.fit,
    this.alignment: Alignment.center,
    this.repeat: ImageRepeat.noRepeat,
    this.centerSlice,
    this.matchTextDirection: false,
    this.gaplessPlayback: false,
  });

  ImageSetting copyWith({
    ImageProvider image,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
    Alignment alignment,
    ImageRepeat repeat,
    Rect centerSlice,
    bool matchTextDirection,
    bool gaplessPlayback,
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
