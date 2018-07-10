import 'package:flutter/material.dart';
import 'theme.dart';
import 'scales.dart';

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
          ),
          child: Semantics(
            child: Text(title),
            header: true,
          )),
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
        onOptionsChanged(options.copyWith(
          textDirection: value ? TextDirection.rtl : TextDirection.ltr,
        ));
      },
    );
  }
}

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
        onOptionsChanged(
          options.copyWith(theme: value ? kDarkTheme : kLightTheme),
        );
      },
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
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(child: Text(title)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
            activeTrackColor: isDark ? Colors.white24 : Colors.black26,
          )
        ],
      ),
    );
  }
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
          ],
        ));
  }
}

const double _kItemHeight = 48.0;

///选项高度
const EdgeInsetsDirectional _kPadding =
    const EdgeInsetsDirectional.only(start: 56.0);

///内边距

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
