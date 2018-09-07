import 'package:html/parser.dart';
import 'dart:convert' show json;

class Shop {
  final String num_iid; //数字标识
  final String commission_rate; //佣金率
  final String sign; //签名

  final String name; //名字
  final String image; //图片
  final String sourcePrice; //原价
  final String nowPrice; //现价
  final String sale; //折扣
  final String address;//地址，跳转链接

  Shop({
    this.num_iid,
    this.commission_rate,
    this.sign,
    this.name,
    this.image,
    this.sourcePrice,
    this.nowPrice,
    this.sale,
    this.address,
  });

  factory Shop.formatFromJson(dynamic itemsJson){

    return new Shop(num_iid: itemsJson['num_iid'],
    commission_rate: itemsJson['commission_rate'],
    sign: itemsJson['sign'],
    name: itemsJson['name'],
    image: itemsJson['image'],
    sourcePrice: itemsJson['sourcePrice'],
    nowPrice: itemsJson['nowPrice'],
    sale: itemsJson['sale'],
    address: itemsJson['address'],);
  }
  @override
  String toString() {
    // TODO: implement toString
    return '{"num_iid":"$num_iid","commission_rate":"$commission_rate","sign":"$sign","name":"$name","image":"$image","sourcePrice":"$sourcePrice","nowPrice":"$nowPrice","sale":"$sale","address":"$address"}';
  }

  static String encode(String html){
    var doc=parse(html);
    var a=doc.getElementById('divList');
    var b=a.getElementsByClassName('tb-zx-item');
    List<Shop> shops=[];
    for(var c in b){
      String info=c.attributes['onclick'];
      String image=c.getElementsByTagName('img')[0].attributes['src'];
      String name=c.getElementsByClassName('cf_itemname')[0].text.trim();
      String nowPrice=c.getElementsByClassName('tb-cfprice')[0].text.trim();
      String sourcePrice=c.getElementsByClassName('item-cf_flegg')[0].text.trim();
      String sale=c.getElementsByClassName('cf_saler')[0].text.trim().replaceAll('&nbsp;', '');

      String address=info.substring(info.indexOf('http'),info.indexOf('\');'));
      List<String> clickLogs=info.substring(info.indexOf('clicklogs(')+10,info.lastIndexOf(')')).replaceAll('\'', '').split(',');

      
      String num_iid='';
      String commission_rate='';
      String sign='';
      if(clickLogs.length==3){
        num_iid=clickLogs[0];
        commission_rate=clickLogs[1];
        sign=clickLogs[2];
      }
      shops.add(new Shop(num_iid: num_iid,commission_rate: commission_rate,sign: sign,name: name,image: image,sourcePrice: sourcePrice,nowPrice: nowPrice,sale: sale,address: address,));
    }
    String content='';
    for(Shop shop in shops){
      content+=shop.toString()+",";
    }
    print('[${content.substring(0,content.length-1)}]');
    return '[${content.substring(0,content.length-1)}]';
  }

  static List<Shop> decode(Object jsonContnet){

    var decode = json.decode(jsonContnet.toString());

    List<Shop> shops=[];
    for(var info in decode){
      shops.add(new Shop.formatFromJson(info));
    }
    return shops;

  }
}
