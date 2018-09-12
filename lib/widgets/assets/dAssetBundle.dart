import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code/markdown_dart_code.dart';
class AssetBundleDemo extends StatelessWidget {
  static const String routeName='widgets/assets/AssetBundle';
  static const String detail='''> AssetBundle是一个抽象类，主要有以下方法

```dart
//加载图片,返回二进制图片
Future<ByteData> load(String key)
//加载文本，cache是否使用缓存，返回String类型
Future<String> loadString(String key, { bool cache = true })
//加载结构化数据，parser进行检索值
Future<T> loadStructuredData<T>(String key, Future<T> parser(String value))
//清除缓存，下次重新在资源包中读取
void evict(String key)
```

> 已实现AssetBundle的类有

-  NetworkAssetBundle

-  CachingAssetBundle -> PlatformAssetBundle

## NetworkAssetBundle
> 用于加载网络资源，该类不会缓存任何资源
```dart
//示例
  void loadNetWorkImage() async{
    NetworkAssetBundle networkAssetBundle = NetworkAssetBundle(Uri.parse('http://img.zcool.cn/community/'));
    ByteData byteData = await networkAssetBundle.load('0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg');
  }
//上述最后会加载http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg
```

## CachingAssetBundle
> 该类也是一个抽象类，封装了缓存方法，继承于AssetBundle ，实现于PlatformAssetBundle，只会缓存loadString()方法的字符串内容

## PlatformAssetBundle
> 该类继承了CachingAssetBundle，重写了AssetBundle的一个方法load()
```dart
//示例
    void loadCacheString() async{
      PlatformAssetBundle platformAssetBundle=new PlatformAssetBundle();
      ByteData byteData = await platformAssetBundle.load('images/burgers.jpg');
    }
//会加载项目下的images/burgers.jpg 文件,该文件需要在pubspec.yaml文件中声明
```
## 注意
使用AssetBundle需要导入package:flutter/services.dart 包，rootBundle其实就是PlatformAssetBundle类的对象.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssetBundle'),
      ),
      body: SingleChildScrollView(
        child: DartMarkDown(AssetBundleDemo.detail),
      ),
    );
  }

}