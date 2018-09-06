import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/http/httpManager.dart' as httpManager;
import 'package:html/parser.dart';
import 'about.dart';
import 'package:url_launcher/url_launcher.dart';

const String _kUpgradeAddress =
    'https://www.coolapk.com/apk/com.rhyme.flutterbyrhyme';

class UpgradeInfo {
  final String version;
  final String upgradeInfo;
  final String size;
  final String downloadAddress;
  final bool haveUpgrade;

  UpgradeInfo({
    this.version,
    this.upgradeInfo,
    this.size,
    this.downloadAddress,
    this.haveUpgrade,
  });

  factory UpgradeInfo.formHtml(String html) {
    var d = parse(html);
    //获取版本号
    String version = d.getElementsByClassName('list_app_info')[0].text.trim();
    String size = d
        .getElementsByClassName('apk_topba_message')[0]
        .text
        .replaceAll(" ", "")
        .replaceAll("\n", "");
    size = size.substring(0, size.indexOf("/"));
    String upgradeInfo =
        d.getElementsByClassName('apk_left_title_info')[0].text;
    upgradeInfo = upgradeInfo.replaceAll(" ", "");
    bool haveUpgrade = false;
    String downloadAddress = _kUpgradeAddress;
//    var e=d.getElementsByTagName('script');
//    String f=e[e.length-2].text.replaceAll(" ", "");
//    downloadAddress=f.substring(f.indexOf("=")+1,f.indexOf(";")).replaceAll("\"", "");
    if (applicationVersion != version) {
      haveUpgrade = true;
    }
    return UpgradeInfo(
        version: version,
        size: size,
        upgradeInfo: upgradeInfo,
        haveUpgrade: haveUpgrade,
        downloadAddress: downloadAddress);
  }
}

void checkUpdate(BuildContext context, bool haveTip) {
  if(haveTip){
    showDialog(context: context,
        builder: (BuildContext context){
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: CircularProgressIndicator(),
                  ),
                  Text('检查更新中，请稍候...'),
                ],
              ),
            ],
          );
        });
  }

  httpManager.get(
      url: _kUpgradeAddress,
      onSend: () {},
      onSuccess: (result) {
        UpgradeInfo info = UpgradeInfo.formHtml(result);
        if (info.haveUpgrade) {
          showUpgradeDialog(context, info);
        } else if (haveTip) {
          Navigator.pop(context);
          showNoUpgradeDialog(context);
        }
      },
      onError: (error) {
        print(error.toString());
        if (haveTip) {
          showErrorDialog(context);
        }
      });
}

Future<Null> showErrorDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('提示'),
          contentPadding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text('无法检测更新，请检查网络...'),
          ],
        );
      });
}

Future<Null> showNoUpgradeDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('提示'),
          contentPadding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Text('已经是最新版本了...'),
          ],
        );
      });
}

Future<Null> showUpgradeDialog(BuildContext context, UpgradeInfo info) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Flutter教程-${info.version}'),
          content: SingleChildScrollView(child: Text(info.upgradeInfo)),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消')),
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  print('开始下载！');
                  startDownLoadAPK(info.downloadAddress);
                },
                child: Text('立即更新(${info.size})')),
          ],
        );
      });
}

void startDownLoadAPK(String address) async {
  bool isSuccess = await upgradeByMarket();
  if (!isSuccess) {
    if (await canLaunch(address)) {
      await launch(address,
          forceSafariVC: true,
          forceWebView: false,
          statusBarBrightness: Brightness.light);
    }
  }
}

