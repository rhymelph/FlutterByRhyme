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
      ColorGroupWidget(setting.color, colorValues, (value) {
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
             final _firstMatchTextDirection = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(matchTextDirection: _firstMatchTextDirection);
          });
        },
        value: setting.matchTextDirection?.value ?? false,
      ),
      SwitchValueTitleWidget(
        title: StringParams.kGaplessPlayback,
        onChanged: (value) {
          setState(() {
            final _firstGaplessPlayback = Value<bool>(
              name: value ? 'true' : 'false',
              value: value,
              label: value ? 'true' : 'false',
            );
            setting = setting.copyWith(gaplessPlayback: _firstGaplessPlayback);
          });
        },
        value: setting.gaplessPlayback?.value ?? false,
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
  Value<ImageProvider> image;
  Value<Color> color;
  Value<BlendMode> colorBlendMode;
  Value<BoxFit> fit;
  Value<AlignmentGeometry> alignment;
  Value<ImageRepeat> repeat;
  Value<Rect> centerSlice;
  Value<bool> matchTextDirection;
  Value<bool> gaplessPlayback;
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
