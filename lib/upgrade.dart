import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/http/httpManager.dart' as httpManager;
import 'package:html/parser.dart';
import 'about.dart';
const String _kUpgradeAddress =
    'https://www.coolapk.com/apk/197700';

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
    var d=parse(html);
    //获取版本号
    String version=d.getElementsByClassName('list_app_info')[0].text.trim();
    String size=d.getElementsByClassName('apk_topba_message')[0].text.replaceAll(" ", "")
    .replaceAll("\n", "");
    size=size.substring(0,size.indexOf("/"));
    String upgradeInfo=d.getElementsByClassName('apk_left_title_info')[0].text;
    upgradeInfo=upgradeInfo.replaceAll(" ", "");
    bool haveUpgrade=false;
    if(applicationVersion!=version){
      haveUpgrade=true;
    }

    return UpgradeInfo(version: version,size: size,upgradeInfo: upgradeInfo,haveUpgrade: haveUpgrade);
  }
}

void checkUpdate(BuildContext context) {
  httpManager.get(
      url: _kUpgradeAddress,
      onSend: () {
        print('send');
      },
      onSuccess: (result) {
        UpgradeInfo info = UpgradeInfo.formHtml(result);
        if(!info.haveUpgrade){
          showUpgradeDialog(context, info);
        }
      },
      onError: (error) {
        print(error.toString());

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
            FlatButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('取消')),
            FlatButton(onPressed: () {
              Navigator.pop(context);
              print('开始下载！');
            }, child: Text('立即更新(${info.size})')),
          ],
        );
      });
}

void startDownLoadAPK(String address){
}