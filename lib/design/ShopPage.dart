import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/design/entity/shop.dart';
import 'package:flutterbyrhyme/http/httpManager.dart' as httpManager;
import 'package:url_launcher/url_launcher.dart';
const String kAddress='https://raw.githubusercontent.com/rhymelph/FlutterByRhyme/master/lib/design/entity/shop.json';

class ShopPage extends StatefulWidget {
  static const String routeName = 'design/ShopPage';

  @override
  _ShopPageState createState() => _ShopPageState();
}


class _ShopPageState extends State<ShopPage> {
  Widget body=Center(child: CircularProgressIndicator());

  @override
  void initState() {
    // TODO: implement initState
    initData();

    super.initState();
  }

  initData(){
    httpManager.get(url: kAddress,
    onSend: (){
      setState(() {
        body=Center(child: CircularProgressIndicator());
      });
    },
    onSuccess: (result){

      List<Shop> shopList=Shop.decode(result);
      setState(() {
        body=_ShopListBody(shopList);
      });
    },
    onError: (error){
      error.toString();
      setState(() {
        body=Center(
          child: FlatButton(onPressed: (){
            initData();
          }, child: Text('加载失败，点击重新加载')),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: body,
    );
  }
}

class _ShopListBody extends StatelessWidget {
  final List<Shop> shopList;

  const _ShopListBody(this.shopList);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          double width=constraints.biggest.width/2;

          List<Shop> list1=[];
          List<Shop> list2=[];
          for(int i=0; i<shopList.length;i++){
            Shop shop =shopList[i];
            if(i%2==0){
              list1.add(shop);
            }else{
              list2.add(shop);
            }
          }
          return Row(
            children: <Widget>[
              Column(
                children: list1.map((shop){
                  return SizedBox(
                    width: width,
                    child: _ShopItem(shop: shop,),
                  );
                }).toList(),
              ),
              Column(
                children: list2.map((shop){
                  return SizedBox(
                    width: width,
                    child: _ShopItem(shop: shop,),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}


class _ShopItem extends StatelessWidget {
  final Shop shop;
  const _ShopItem({this.shop});
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4.0,
        child: RawMaterialButton(
          onPressed: () async {
            if (await canLaunch(shop.address)) {
            await launch(shop.address,
            forceSafariVC: true,
            forceWebView: false,
            statusBarBrightness: Brightness.light);
            }
          },
          padding: EdgeInsets.zero,
          splashColor: Theme.of(context).primaryColor.withOpacity(0.12),
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(shop.image,fit: BoxFit.cover,),
              Row(
                children: <Widget>[
                  Expanded(child: Text(shop.name)),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(shop.nowPrice,style: Theme.of(context).textTheme.title,),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(shop.sourcePrice,style: Theme.of(context).textTheme.body1.copyWith(decoration: TextDecoration.lineThrough),),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(shop.sale,style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 12.0,),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
