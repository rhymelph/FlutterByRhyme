import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

const String applicationVersion = '0.0.1';
const String applicationLegalese = '© 2018 the rhymelph author';
const about_platform = const MethodChannel('samples.flutter.io/about');
const AliPay = 'DonateToMe';
const QQTalk = 'QQCallMe';
const ERCODE = 'FKX05369RYXWBANXWYFR43';

String _defaultApplicationName(BuildContext context) {
  final Title ancestorTitle = context.ancestorWidgetOfExactType(Title);
  return ancestorTitle?.title ??
      Platform.resolvedExecutable.split(Platform.pathSeparator).last;
}

class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String url, String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                await launch(url,
                    forceSafariVC: true,
                    forceWebView: true,
                    statusBarBrightness: Brightness.light);
              });
}

class _PayTextSpan extends TextSpan {
  _PayTextSpan({BuildContext context, TextStyle style, String text})
      : super(
            style: style,
            text: text,
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                bool success =
                    await about_platform.invokeMethod(AliPay, [ERCODE]);
                if (!success) {
                  _showErrorDialog(context, '不支持该功能或未下载支付宝');
                }
              });
}

void showMyAboutDialog(BuildContext context) {
  final ThemeData data = Theme.of(context);
  final TextStyle abouleTextStyle = data.textTheme.body2;
  final TextStyle linkStyle =
      data.textTheme.body2.copyWith(color: data.accentColor);

  showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return new MyAboutDialog(
          applicationVersion: applicationVersion,
          applicationIcon: const FlutterLogo(),
          applicationLegalese: applicationLegalese,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      style: abouleTextStyle,
                      text: 'Flutter 教程是学习Flutter的一个软件，'
                          '主要风格模仿自Flutter Gallery应用，'
                          '开发此应用的主要目的是：帮助初学者了解和使用基本的部件、'
                          '加快初学者的学习进度、让他们能了解到官网的一些知识外，'
                          '还可以学习到作者通过源码总结的一些经验等，还有更多。'
                          '\n\n如果您在此软件上得到帮助，不妨请作者喝杯咖啡：\n\n',
                    ),
                    _PayTextSpan(
                      style: linkStyle,
                      context: context,
                      text: '支付宝买杯咖啡',
                    ),
                    TextSpan(
                      style: abouleTextStyle,
                      text: '\n\nFlutter官网:\n\n',
                    ),
                    _LinkTextSpan(
                      style: linkStyle,
                      text: 'https://flutter.io',
                      url: 'https://flutter.io',
                    ),
                    TextSpan(
                      style: abouleTextStyle,
                      text: '\n\n若要查看本应用源代码，请访问：\n\n',
                    ),
                    _LinkTextSpan(
                      style: linkStyle,
                      text: 'https://github.com/rhymelph/FlutterByRhyme',
                      url: 'https://github.com/rhymelph/FlutterByRhyme',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}

_showErrorDialog(BuildContext context, String content) {
  assert(context != null);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('提示'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('确定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MyAboutDialog extends StatelessWidget {
  const MyAboutDialog({
    Key key,
    this.applicationName,
    this.applicationVersion,
    this.applicationIcon,
    this.applicationLegalese,
    this.children,
  }) : super(key: key);

  final String applicationName;

  final String applicationVersion;

  final Widget applicationIcon;

  final String applicationLegalese;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final String name = applicationName ?? _defaultApplicationName(context);
    final String version = applicationVersion ?? '';
    final Widget icon = applicationIcon ?? FlutterLogo();
    List<Widget> body = <Widget>[];
    if (icon != null)
      body.add(
          new IconTheme(data: const IconThemeData(size: 48.0), child: icon));
    body.add(new Expanded(
        child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: new ListBody(children: <Widget>[
              new Text(name, style: Theme.of(context).textTheme.headline),
              new Text(version, style: Theme.of(context).textTheme.body1),
              new Container(height: 18.0),
              new Text(applicationLegalese ?? '',
                  style: Theme.of(context).textTheme.caption)
            ]))));
    body = <Widget>[
      new Row(crossAxisAlignment: CrossAxisAlignment.start, children: body),
    ];
    if (children != null) body.addAll(children);
    return new AlertDialog(
        content: new SingleChildScrollView(
          child: new ListBody(children: body),
        ),
        actions: <Widget>[
          new FlatButton(
              child: new Text('联系作者'),
              onPressed: () async{
               bool success=await about_platform.invokeMethod(QQTalk,[708959817]);
               if(!success){
                 _showErrorDialog(context, '不支持该功能或未下载QQ\n\n作者QQ:708959817');
               }
              }),
          new FlatButton(
              child: new Text('查看许可证'),
              onPressed: () {
                showLicensePage(
                    context: context,
                    applicationName: applicationName,
                    applicationVersion: applicationVersion,
                    applicationIcon: applicationIcon,
                    applicationLegalese: applicationLegalese);
              }),
          new FlatButton(
              child: new Text('关闭'),
              onPressed: () {
                Navigator.pop(context);
              }),
        ]);
  }
}
