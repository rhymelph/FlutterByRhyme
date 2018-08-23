import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/design/entity/shop.dart';
import 'package:flutterbyrhyme/http/httpManager.dart' as httpManager;

const String kAddress='http://pdr02afuu.bkt.clouddn.com/shop.json';

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
    httpManager.get(url: kAddress,headers: {
      'ContentType':'application/json;charset=gb2312',
    },
    onSend: (){
      setState(() {
        body=Center(child: CircularProgressIndicator());
      });
    },
    onSuccess: (result){
      print(result);

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
            Row(
              children: <Widget>[
                Text(shop.nowPrice,style: Theme.of(context).textTheme.body2,),
                SizedBox(
                  width: 3.0,
                ),
                Text(shop.sourcePrice,style: Theme.of(context).textTheme.body1.copyWith(decoration: TextDecoration.lineThrough),),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(shop.sale,style: Theme.of(context).textTheme.subhead.copyWith(fontSize: 8.0,),),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
