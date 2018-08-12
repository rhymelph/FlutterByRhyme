import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/markdown_dart_code.dart';

class DataTableDemo extends StatefulWidget {
  static const String routeName = 'widgets/material/DataTable';
  final String detail = '''#  简单闲聊
> DataTable 这个名字在前端开发一定不陌生吧，与之同名的DataTable前端框架，大家都使用得很娴熟了，这个框架用于做为后台的数据展示跟操作，那么，在Flutter同样也是用于数据展示跟操作，Flutter里面怎么使用呢？让我们来一起学习吧！

# 1. DataTable参数
| 字段|类型| 
| - | - |
| columns（表头） | List<DataColumn> | 
| rows（内容行） | List<DataRow> | 
| sortColumnIndex（排序列索引） | int | 
| sortAscending（升序排序） | bool | 
| onSelectAll（点击全选） | ValueSetter<bool> | 

# 2. DataColumn参数
| 字段|类型| 
| - | - |
| label（标签，文本或者size=18的图标） | Widget | 
| tooltip（工具提示） | String | 
| numeric（是否包含数字） | bool | 
| onSort（排序时调用） | DataColumnSortCallback | 

# 3. DataRow参数
| 字段|类型| 
| - | - |
| selected（选中） | bool | 
| onSelectChanged（点击选中改变） | ValueChanged<bool> | 
| cells（子项） | List<DataCell> | 
| index（索引DataRow.byIndex特有） | int | 

# 4. DataCell参数
| 字段|类型| 
| - | - |
| child（子部件,一般为Text或DropdownButton） | Widget | 
| placeholder(是否为占位符，若child为Text，显示占位符文本样式) | bool | 
| showEditIcon(显示编辑图标，并非意义上的把child变为可编辑，需要结合onTap) | bool | 
| onTap（点击） | VoidCallback | 

# 5.使用DataTableSource 
>  新建一个Class继承DataTableSource这个抽象类，实现4个方法
```dart
class MyTable extends DataTableSource{
  int _selectCount=0;//当前选中的行数
  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
  }
  @override//是否行数不确定
  bool get isRowCountApproximate => false;

  @override//有多少行
  int get rowCount => _shops.length;

  @override//选中的行数
  int get selectedRowCount => _selectCount;
}
```
> 代码如上所示，现在table有了，那么，我们还需要数据源，我们一起弄一个商品库存清单出来吧！
```dart
class Shop{
  final String name;
  final int number;
  final String type;
  final double price;
  bool selected=false;//默认为未选中
  Shop(this.name, this.number, this.type, this.price,);
}

  List<Shop> _shops=<Shop>[
    Shop('小米6x', 100, '手机', 1699.0,),
    Shop('华为P20', 50, '手机', 4999.0,),
    Shop('华硕a61', 50, '电脑', 5700.0,),
    Shop('iphone7plus耳机', 9999, '耳机', 60.0,),
    Shop('iphone7plus256g', 1, '手机', 4760.0,),
    Shop('金士顿8g内存条', 66, '内存条', 399.0,),
    Shop('西门子洗衣机9.0kg', 890, '家电', 10399.0,),
    Shop('三星66寸液晶智能电视', 800, '家电', 20389.0,),
  ];
```
> 合并在一起
```dart
class Shop {
  final String name;
  final int number;
  final String type;
  final double price;
  bool selected = false; //默认为未选中
  Shop(
    this.name,
    this.number,
    this.type,
    this.price,
  );
}

class MyTable extends DataTableSource {
  List<Shop> _shops = <Shop>[
    Shop('小米6x', 100, '手机', 1699.0),
    Shop('华为P20', 50, '手机', 4999.0),
    Shop('华硕a61', 50, '电脑', 5700.0),
    Shop('iphone7plus耳机', 9999, '耳机', 60.0),
    Shop('iphone7plus256g', 1, '手机', 4760.0),
    Shop('金士顿8g内存条', 66, '内存条', 399.0),
    Shop('西门子洗衣机9.0kg', 890, '家电', 10399.0),
    Shop('三星66寸液晶智能电视', 800, '家电', 20389.0),
  ];

  int _selectCount = 0; //当前选中的行数
  bool _isRowCountApproximate = false;//行数确定

  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
    if (index >= _shops.length || index < 0) throw FlutterError('兄弟，取错数据了吧');
    //如果索引不在商品列表里面，抛出一个异常
    final Shop shop = _shops[index];
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(Text(shop.name)),
          DataCell(Text('\${shop.price}')),
          DataCell(Text('\${shop.number}')),
          DataCell(Text(shop.type)),
        ],
        selected: shop.selected,
        index: index,
        onSelectChanged: (isSelected) {
          selectOne(index, isSelected);
        });
  }

  @override //是否行数不确定
  bool get isRowCountApproximate => _isRowCountApproximate;

  @override //有多少行
  int get rowCount => _shops.length;

  @override //选中的行数
  int get selectedRowCount => _selectCount;

  //选中单个
  void selectOne(int index,bool isSelected){
    Shop shop=_shops[index];
    if (shop.selected != isSelected) {
      //如果选中就选中数量加一，否则减一
      _selectCount = _selectCount += isSelected ? 1 : -1;
      shop.selected = isSelected;
      //更新
      notifyListeners();
    }
  }
  //选中全部
  void selectAll(bool checked) {
    for (Shop _shop in _shops) {
      _shop.selected = checked;
    }
    _selectCount = checked ? _shops.length : 0;
    notifyListeners(); //通知监听器去刷新
  }

  //排序,
  void _sort<T>(Comparable<T> getField(Shop shop),bool b){
    _shops.sort((Shop s1,Shop s2){
      if(!b){//两个项进行交换
        final Shop temp=s1;
        s1=s2;
        s2=temp;
      }
      final Comparable<T> s1Value=getField(s1);
      final Comparable<T> s2Value=getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}
```
# 6.DataTableSource配合PaginatedDataTable
> PaginatedDataTable

| 字段|类型| 
| - | - |
| header (表名，通常为Text，也可以是ButtonBar，FlatButton)| Widget | 
| actions (动作)|List<Widget> | 
| sortColumnIndex（排序列索引） | int | 
| sortAscending（升序排序） | bool | 
| onSelectAll（点击全选） | ValueSetter<bool> | 
| initialFirstRowIndex (初始索引)| int | 
| onPageChanged (页数更改监听，左右箭头)| ValueChanged<int> | 
| rowsPerPage (默认一页显示的行数)| int | 
| availableRowsPerPage (可选择页数)| List<int> | 
| onRowsPerPageChanged (点击可选择页数下拉监听)| ValueChanged<int> | 
>下面就是结合两个东西的了
```dart
  //默认的行数
  int _defalutRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  int _sortColumnIndex;
  bool _sortAscending=true;
  MyTable table = MyTable();

  //排序关联_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Shop s),int index,bool b){
    table._sort(getField, b);
    setState(() {
      this._sortColumnIndex=index;
      this._sortAscending=b;
    });
  }
  List<DataColumn> getColumn() {
    return [
      DataColumn(label: Text('商品名'),onSort: (i,b){_sort<String>((Shop p) =>p.name, i, b);}),
      DataColumn(label: Text('价格'),onSort: (i,b){_sort<num>((Shop p) =>p.price, i, b);}),
      DataColumn(label: Text('库存'),onSort: (i,b){_sort<num>((Shop p) =>p.number, i, b);}),
      DataColumn(label: Text('类型'),onSort: (i,b){_sort<String>((Shop p) =>p.type, i, b);}),
    ];
  }

Widget getPaginatedDataTable(){
  return SingleChildScrollView(
        child: PaginatedDataTable(
          rowsPerPage: _defalutRowPageCount,
          onRowsPerPageChanged: (value) {
            setState(() {
              _defalutRowPageCount = value;
            });
          },
          sortColumnIndex: _sortColumnIndex,
          initialFirstRowIndex: 0,
          sortAscending: _sortAscending,
          availableRowsPerPage: [
            5,10
          ],
          onPageChanged: (value){
            print('\$value');
          },
          onSelectAll: table.selectAll,
          header: Text('商品库存'),
          columns: getColumn(),
          source: table,
        ),
      );
}
```
> 下面是一张图片：

![DataTable.gif](https://upload-images.jianshu.io/upload_images/12805100-0472bf85f47d26b3.gif?imageMogr2/auto-orient/strip)
''';

  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo>{
  //默认的行数
  int _defalutRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  int index;
  bool b=true;
  MyTable table = MyTable();

  void _sort<T>(Comparable<T> getField(Shop s),int index,bool b){
    table._sort(getField, b);
    setState(() {
      this.index=index;
      this.b=b;
    });
  }

  List<DataColumn> getColumn() {
    return [
      DataColumn(label: Text('商品名'),onSort: (i,b){_sort<String>((Shop p) =>p.name, i, b);}),
      DataColumn(label: Text('价格'),onSort: (i,b){_sort<num>((Shop p) =>p.price, i, b);}),
      DataColumn(label: Text('库存'),onSort: (i,b){_sort<num>((Shop p) =>p.number, i, b);}),
      DataColumn(label: Text('类型'),onSort: (i,b){_sort<String>((Shop p) =>p.type, i, b);}),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DataTable'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PaginatedDataTable(
              rowsPerPage: _defalutRowPageCount,
              onRowsPerPageChanged: (value) {
                setState(() {
                  _defalutRowPageCount = value;
                });
              },
              sortColumnIndex: index,
              initialFirstRowIndex: 0,
              sortAscending: b,
              availableRowsPerPage: [
                5,10
              ],
              onPageChanged: (value){
                print('$value');
              },
              onSelectAll: table.selectAll,
              header: Text('商品库存'),
              columns: getColumn(),
              source: table,
            ),
            DartMarkDown(widget.detail),
          ]
        ),
      ),
    );
  }
}

class Shop {
  final String name;
  final int number;
  final String type;
  final double price;
  bool selected = false; //默认为未选中

  Shop(
    this.name,
    this.number,
    this.type,
    this.price,
  );
}

class MyTable extends DataTableSource {
  List<Shop> _shops = <Shop>[
    Shop('小米6x', 100, '手机', 1699.0),
    Shop('华为P20', 50, '手机', 4999.0),
    Shop('华硕a61', 50, '电脑', 5700.0),
    Shop('iphone7plus耳机', 9999, '耳机', 60.0),
    Shop('iphone7plus256g', 1, '手机', 4760.0),
    Shop('金士顿8g内存条', 66, '内存条', 399.0),
    Shop('西门子洗衣机9.0kg', 890, '家电', 10399.0),
    Shop('三星66寸液晶智能电视', 800, '家电', 20389.0),
  ];

  int _selectCount = 0; //当前选中的行数
  bool _isRowCountApproximate = false;

  @override
  DataRow getRow(int index) {
    //根据索引获取内容行
    if (index >= _shops.length || index < 0) throw FlutterError('兄弟，取错数据了吧,index:$index');
    //如果索引不在商品列表里面，抛出一个异常
    final Shop shop = _shops[index];
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(Text(shop.name)),
          DataCell(Text('${shop.price}')),
          DataCell(Text('${shop.number}')),
          DataCell(Text(shop.type)),
        ],
        selected: shop.selected,
        index: index,
        onSelectChanged: (isSelected) {
          selectOne(index, isSelected);
        });
  }

  @override //行数不确定
  bool get isRowCountApproximate => _isRowCountApproximate;

  @override //有多少行
  int get rowCount => _shops.length;

  @override //选中的行数
  int get selectedRowCount => _selectCount;

  //选中单个
  void selectOne(int index,bool isSelected){
    Shop shop=_shops[index];
    if (shop.selected != isSelected) {
      //如果选中就选中数量加一，否则减一
      _selectCount = _selectCount += isSelected ? 1 : -1;
      shop.selected = isSelected;
      //更新
      notifyListeners();
    }
  }
  //选中全部
  void selectAll(bool checked) {
    for (Shop _shop in _shops) {
      _shop.selected = checked;
    }
    _selectCount = checked ? _shops.length : 0;
    notifyListeners(); //通知监听器去刷新
  }

  //排序,
  void _sort<T>(Comparable<T> getField(Shop shop),bool b){
    _shops.sort((Shop s1,Shop s2){
      if(!b){//两个项进行交换
        final Shop temp=s1;
        s1=s2;
        s2=temp;
      }
      final Comparable<T> s1Value=getField(s1);
      final Comparable<T> s2Value=getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}
