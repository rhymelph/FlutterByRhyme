import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  static const String routeName = 'design/ShopPage';

  @override
  _ShopPageState createState() => _ShopPageState();
}

List<_ShopItem> items=[
  const _ShopItem(name: '1',),
  const _ShopItem(name: '2',),
  const _ShopItem(name: '3',),
  const _ShopItem(name: '4',),
  const _ShopItem(name: '5',),
  const _ShopItem(name: '6',),
  const _ShopItem(name: '7',),
  const _ShopItem(name: '8',),
];
class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            double width=constraints.biggest.width/2;
            double height=225.0;

            return Row(
              children: <Widget>[
                Column(
                  children: items.map((shop){
                    return SizedBox(
                      width: width,
                      height: int.parse(shop.name)%2==0?height:height+30.0,
                      child: shop,
                    );
                  }).toList(),
                ),
                Column(
                  children: items.map((shop){
                    return SizedBox(
                      width: width,
                      height: int.parse(shop.name)%5==0?height:height+30.0,
                      child: shop,
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  final String name;

  const _ShopItem({this.name});
  @override
  Widget build(BuildContext context) {
    return  Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1,child: Image.asset('images/burgers.jpg',fit: BoxFit.cover,)),
            Text('商品$name'),
          ],
        ),
    );
  }
}
