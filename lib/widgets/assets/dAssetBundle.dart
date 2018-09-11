import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code/example_code.dart';

class AssetBundleDemo extends StatefulWidget {
  static const String routeName = 'widgets/assets/AssetBundle';
  final String detail = '''''';

  @override
  _AssetBundleDemoState createState() =>
      _AssetBundleDemoState();
}

class _AssetBundleDemoState
    extends ExampleState<AssetBundleDemo> {
  AssetBundleSetting setting;

  @override
  void initState() {
    setting = AssetBundleSetting();
    super.initState();
  }

  @override
  String getDetail() {
    return widget.detail;
  }

  @override
  String getExampleCode() {
    return '''''';
  }

  @override
  List<Widget> getSetting() {
    return [];
  }

  @override
  String getTitle() {
    return 'AssetBundle';
  }


  @override
  Widget getWidget() {
//    PlatformAssetBundle assetBundle=new PlatformAssetBundle();

    return Text('');
  }
}

class AssetBundleSetting {

  final Value<String> asset;
  AssetBundleSetting({
    this. asset,
  });

  AssetBundleSetting copyWith({
    Value<String> asset,
  }) {
    return AssetBundleSetting(
    );
  }
}
