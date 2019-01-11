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
        HelpImage(
          'images/help_search1.png',
        ),
        Text('然后会跳转到一个搜索界面，在搜索框中，输入你需要搜索的部件名字或者介绍（英文字母可忽略大小写）'),
        HelpImage(
          'images/help_search2.png',
        ),
        Text('输入完成后点击搜索图标按钮,就会匹配到你需要的部件'),
        HelpImage(
          'images/help_search3.png',
        ),
        Text('点击搜索出来的条目进入即可查看该部件'),
      ],
    ),
  ),
  HelpItem(
    '2.如何选中部件属性？',
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('打开部件后，可在视图下方选中属性'),
        HelpImage('images/help_widget_select1.png'),
      ],
    )
  ),
  HelpItem(
    '3.如何查看部件属性的代码？',
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('长按属性即可弹出部件属性代码'),
        HelpImage('images/help_widget_select2.png'),

      ],
    ),
  ),
  HelpItem(
    '4.如何查看当前部件的代码？',
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('在部件界面中，点击右上角的小图标即可查看'),
        HelpImage('images/help_widget_select2.png'),
      ],
    )
  ),
  HelpItem(
      '5.如何切换主题？',
      Column(
        children: <Widget>[
          Text('在主页面中点击右上角的菜单图标'),
          HelpImage('images/help_theme1.png'),
          Text('然后可以看到夜间模式,点击右边切换按钮即可切换'),
          HelpImage('images/help_theme2.png'),

        ],
      )),
  HelpItem(
    '6.账号系统机制在哪里？',
    Text('目前还没有账号系统机制，敬请期待!'),
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
              .map((item) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpansion) {
                    return HelpTitle(
                      title: item.title,
                    );
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

class HelpImage extends StatelessWidget {
  final String assertName;

  const HelpImage(this.assertName,{Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      width:150.0,
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assertName),),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}
