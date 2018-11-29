import 'package:flutter/material.dart';

class HelpItem {
  final String title;
  final Widget body;
  bool isShow = false;

  HelpItem(this.title, this.body);
}

List<HelpItem> items = [
  HelpItem(
    '1.如何搜索部件？',
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('在主界面中,点击搜索按钮图标'),
        Image.asset('images/pazzer.jpg', width: 200.0, height: 200.0,),
        Text('然后会跳转到一个搜索界面，在搜索框中，输入你需要搜索的部件名字，或者介绍（英文字母可忽略大小写）'),
        Image.asset('images/pazzer.jpg', width: 200.0, height: 200.0,),
        Text('输入完成后点击搜索图标按钮,就会匹配到你需要的部件'),
        Image.asset('images/pazzer.jpg', width: 200.0, height: 200.0,),
        Text('先这样，然后这个'),
      ],
    ),

  ),
  HelpItem(
    '2.如何选中部件属性？',
    Text('先这样，然后这个'),
  ),
  HelpItem(
    '3.如何查看部件属性的代码？',
    Text('先这样，然后这个'),
  ),
  HelpItem(
    '4.如何查看当前部件的代码？',
    Text('先这样，然后这个'),
  ),
  HelpItem(
    '5.如何切换主题？',
    Text('先这样，然后这个'),
  ),
  HelpItem(
      '6.账号系统机制在哪里？',
    Text('先这样，然后这个'),
  ),
];

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用帮助'),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 300),
          expansionCallback: (position, isExpansion) {
            HelpItem item = items[position];
            setState(() {
              item.isShow = !isExpansion;
            });
          },
          children: items
              .map((item) =>
              ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpansion) {
                    return HelpTitle(title: item.title,);
                  },
                  body: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: item.body,
                  ),
                  isExpanded: item.isShow))
              .toList(),
        ),
      ),
    );
  }
}

class HelpTitle extends StatelessWidget {
  final String title;

  const HelpTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(title),
    );
  }
}

