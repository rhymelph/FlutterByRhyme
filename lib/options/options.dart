import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/options/help.dart';
import 'theme.dart';
import 'scales.dart';
import 'package:flutterbyrhyme/about.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutterbyrhyme/upgrade.dart';
///主题设置相关
class MyOptions {
  final MyTheme theme; //主题
  final MyTextValueScale textScale; //文本大小
  final TextDirection textDirection; //文本方向
  final double timeDilation; //时间速率
  final TargetPlatform platform; //设备信息
  MyOptions({
    this.theme,
    this.textScale,
    this.textDirection: TextDirection.ltr,
    this.timeDilation: 1.0,
    this.platform,
  });

  static Future<MyOptions> initOption() async{
    SharedPreferences shareP= await _shareF;
    String modeBl = shareP.getString(_kMode);
    MyTheme theme = kLightTheme;
    if (modeBl == 'true') {
      theme = kDarkTheme;
    }
    String textDirectionBl = shareP.getString(_kTextDirection);
    TextDirection textDirection = TextDirection.ltr;
    if (textDirectionBl == 'true') {
      textDirection = TextDirection.rtl;
    }
    String targetPlatformVl = shareP.getString(_kTargetPlatform);
    TargetPlatform targetPlatform = getTargetPlatFrom(targetPlatformVl);

    String textScaleVl = shareP.getString(_kMyTextValueScale);
    MyTextValueScale textValueScale = kAllMyTextValue[0];
    kAllMyTextValue.forEach((value) {
      if (value.label == textScaleVl) {
        textValueScale = value;
      }
    });
    return MyOptions(
        theme: theme,
        textDirection: textDirection,
        platform: targetPlatform,
        textScale: textValueScale,
        timeDilation: 1.0);
  }

  static TargetPlatform getTargetPlatFrom(String value) {
    switch (value) {
      case 'IOS':
        return TargetPlatform.iOS;
      case 'Android':
        return TargetPlatform.android;
      case 'Fuchsia':
        return TargetPlatform.fuchsia;
    }
    return defaultTargetPlatform;
  }

  MyOptions copyWith({
    MyTheme theme,
    MyTextValueScale textScale,
    TextDirection textDirection,
    double timeDilation,
    TargetPlatform platform,
  }) {
    return new MyOptions(
      theme: theme ?? this.theme,
      textScale: textScale ?? this.textScale,
      textDirection: textDirection ?? this.textDirection,
      timeDilation: timeDilation ?? this.timeDilation,
      platform: platform ?? this.platform,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final MyOptions typedOther = other;
    return theme == typedOther.theme &&
        textScale == typedOther.textScale &&
        textDirection == typedOther.textDirection &&
        platform == typedOther.platform;
  }

  @override
  int get hashCode => hashValues(
        theme,
        textScale,
        textDirection,
        timeDilation,
        platform,
      );

  @override
  String toString() {
    return '$runtimeType($theme)';
  }
}

const String _kMode = 'mode';
const String _kTextDirection = 'textDirection';
const String _kMyTextValueScale = 'myTextValueScale';
const String _kTargetPlatform = 'TargetPlatform';
final Future<SharedPreferences> _shareF = SharedPreferences.getInstance();

void _saveValue(String key, String value) async {
  final SharedPreferences prefs = await _shareF;
  await prefs.setString(key, value);
}


///配置页面
class OptionsPage extends StatelessWidget {
  const OptionsPage({
    Key key,
    this.options,
    this.onOptionsChanged,
  }) : super(key: key);

  final MyOptions options;
  final ValueChanged<MyOptions> onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DefaultTextStyle(
        style: theme.primaryTextTheme.subhead,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 124.0),
          children: <Widget>[
            const _Header('显示'),
            _ThemeItem(
              options: options,
              onOptionsChanged: onOptionsChanged,
            ),
            _TextScaleFactorItem(
              options: options,
              onOptionsChanged: onOptionsChanged,
            ),
            _TextDirectionItem(
              options: options,
              onOptionsChanged: onOptionsChanged,
            ),
            const Divider(),
            const _Header('设备'),
            _PlatformItem(
              options: options,
              onOptionsChanged: onOptionsChanged,
            ),
            const _Header('关于'),
//            _ActionItem('使用帮助', () {
//              pushToHelp(context);
//            }),
            _ActionItem('关于Flutter教程', () {
              showMyAboutDialog(context);
            }),
            _ActionItem('检查更新', () {
              checkUpdate(context,true);
            }),
          ],
        ));
  }

  void pushToHelp(BuildContext context){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => HelpPage()));
  }
}

///头部
class _Header extends StatelessWidget {
  const _Header(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData data = Theme.of(context);
    return _OptionsItem(
      child: new DefaultTextStyle(
          style: data.textTheme.body1.copyWith(
            fontFamily: 'qlYouYuan',
            color: data.accentColor,
            fontWeight: FontWeight.bold,
          ),
          child: Semantics(
            child: Text(title),
            header: true,
          )),
    );
  }
}

///主题切换选项
class _ThemeItem extends StatelessWidget {
  _ThemeItem({this.options, this.onOptionsChanged});

  final MyOptions options;
  final ValueChanged<MyOptions> onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return _BooleanItem(
      title: '夜间模式',
      value: options.theme == kDarkTheme,
      onChanged: (bool value) {
        _saveValue(_kMode, value.toString());

        onOptionsChanged(
          options.copyWith(theme: value ? kDarkTheme : kLightTheme),
        );
      },
    );
  }
}

///文字大小切换
class _TextScaleFactorItem extends StatelessWidget {
  _TextScaleFactorItem({this.options, this.onOptionsChanged});

  final MyOptions options;
  final ValueChanged<MyOptions> onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(child: Text('文字大小')),
          Text('${options.textScale.label}'),
          PopupMenuButton<MyTextValueScale>(
            padding: const EdgeInsets.only(right: 16.0),
            icon: const Icon(Icons.keyboard_arrow_down),
            itemBuilder: (BuildContext context) {
              return kAllMyTextValue.map((MyTextValueScale scale) {
                return PopupMenuItem<MyTextValueScale>(
                  value: scale,
                  child: Text(scale.label),
                );
              }).toList();
            },
            onSelected: (MyTextValueScale scale) {
              _saveValue(_kMyTextValueScale, scale.label);

              onOptionsChanged(options.copyWith(
                textScale: scale,
              ));
            },
          ),
        ],
      ),
    );
  }
}

///文字方向切换
class _TextDirectionItem extends StatelessWidget {
  _TextDirectionItem({this.options, this.onOptionsChanged});

  final MyOptions options;
  final ValueChanged<MyOptions> onOptionsChanged;

  @override
  Widget build(BuildContext context) {
    return _BooleanItem(
      title: '文字向右对齐',
      value: options.textDirection == TextDirection.rtl,
      onChanged: (bool value) {
        _saveValue(_kTextDirection, value.toString());

        onOptionsChanged(options.copyWith(
          textDirection: value ? TextDirection.rtl : TextDirection.ltr,
        ));
      },
    );
  }
}

///设备切换
class _PlatformItem extends StatelessWidget {
  const _PlatformItem({this.options, this.onOptionsChanged});

  final MyOptions options;
  final ValueChanged<MyOptions> onOptionsChanged;

  String _platformLabel(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return 'IOS';
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(child: Text('当前设备')),
          Text('${_platformLabel(options.platform)}'),
          PopupMenuButton<TargetPlatform>(
            padding: const EdgeInsets.only(right: 16.0),
            icon: const Icon(Icons.keyboard_arrow_down),
            itemBuilder: (BuildContext context) {
              return TargetPlatform.values.map((TargetPlatform platform) {
                return PopupMenuItem<TargetPlatform>(
                  value: platform,
                  child: Text(_platformLabel(platform)),
                );
              }).toList();
            },
            onSelected: (TargetPlatform platform) {
              _saveValue(_kTargetPlatform, _platformLabel(platform));

              onOptionsChanged(options.copyWith(
                platform: platform,
              ));
            },
          ),
        ],
      ),
    );
  }
}

///点击选项
class _ActionItem extends StatelessWidget {
  const _ActionItem(this.text, this.onTap);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: _FlatButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

class _FlatButton extends StatelessWidget {
  const _FlatButton({this.onPressed, this.child});

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPressed,
      child: new DefaultTextStyle(
        style: Theme.of(context).primaryTextTheme.subhead,
        child: child,
      ),
    );
  }
}

///选项高度
const double _kItemHeight = 48.0;

///内边距
const EdgeInsetsDirectional _kPadding =
    const EdgeInsetsDirectional.only(start: 56.0);

///配置选项
class _OptionsItem extends StatelessWidget {
  const _OptionsItem({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double textScale = MediaQuery.textScaleFactorOf(context);
    return MergeSemantics(
      ///合并语义的小组件
      child: Container(
        constraints: BoxConstraints(minHeight: _kItemHeight * textScale),
        padding: _kPadding,
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
            style: DefaultTextStyle.of(context).style,
            maxLines: 2,
            overflow: TextOverflow.fade,
            child: IconTheme(
              data: Theme.of(context).primaryIconTheme,
              child: child,
            )),
      ),
    );
  }
}

///是与否选项
class _BooleanItem extends StatelessWidget {
  const _BooleanItem({this.title, this.value, this.onChanged});

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(child: Text(title)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).accentColor,
            activeTrackColor: Theme.of(context).accentColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
