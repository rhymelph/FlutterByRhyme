import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/pages.dart';
import 'package:flutterbyrhyme/backdrop.dart';
import 'dart:developer';

import 'dart:async';
import 'dart:math' as math;
import 'package:flutterbyrhyme/upgrade.dart';

//const Color _kBlue = const Color(0xFF002D75);
const _kSwitchDuration = const Duration(milliseconds: 300);

///主页
class HomePage extends StatefulWidget {
  final Widget optionPage;
  final ValueChanged<BottomItem> colorChange;

  const HomePage({this.optionPage,this.colorChange});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //全局唯一key
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  static const AnimatedSwitcherLayoutBuilder _centerHomeLayout =
      AnimatedSwitcher.defaultLayoutBuilder;

  static Widget _topHomeLayout(
      Widget currentChild, List<Widget> previousChildren) {
    List<Widget> childes = previousChildren;
    if (currentChild != null) {
      childes = childes.toList()..add(currentChild);
    }
    return new Stack(
      children: childes,
      alignment: Alignment.topCenter,
    );
  }

  //动画控制器
  AnimationController _controller;

  Map<int, PageCategory> categoryMap;

  int _position = 0;

  double bottomOpcity = 1.0;

  bool haveMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryMap = Map();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    )..forward();

    //check to upgrade
    checkUpdate(context, false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _bottomBarTap(int index) {
    widget.colorChange(kAllBottomItem.toList()[index]);

    setState(() {
      _position = index;
      List<PageCategory> categorys =
          kAllBottomItemToCategory[kAllBottomItem.toList()[_position]];
      if (categorys.length == 1) {
        haveMore = false;
        categoryMap[_position] = categorys[0];
      } else {
        haveMore = true;
      }
    });
  }

  double bottomSize;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final MediaQueryData media = MediaQuery.of(context);
    //是否竖屏并且高度小于800
    final bool centerHome =
        media.orientation == Orientation.portrait && media.size.height < 800.0;

    const Curve switchOutCurve =
        const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn);
    const Curve switchInCurve = const Interval(0.4, 1.0, curve: Curves.easeIn);

    Widget home = Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      bottomNavigationBar: bottomOpcity == 1.0
          ? BottomNavigationBar(
              key: ValueKey(isDark.toString()),
              currentIndex: _position,
              type: BottomNavigationBarType.shifting,
              onTap: _bottomBarTap,
              items: kAllBottomItem.map<BottomNavigationBarItem>((item) {
                return BottomNavigationBarItem(
                  icon: item.icon,
                  title: Text(item.title),
                  backgroundColor: isDark ? item.darkColor : item.lightColor,
                );
              }).toList(),
            )
          : null,
      backgroundColor: theme.primaryColor,
      body: SafeArea(
          bottom: false,
          child: WillPopScope(

              ///注册回调
              child: Backdrop(
                valueChanged: (index) {
                  setState(() {
                    bottomOpcity = index;
                  });
                },
                backTitle: const Text('设置'),
                backLayer: widget.optionPage,
                frontAction: AnimatedSwitcher(
                  duration: _kSwitchDuration,
                  switchInCurve: switchInCurve,
                  switchOutCurve: switchOutCurve,
                  child: categoryMap[_position] == null ||
                          bottomOpcity == 0.0 ||
                          !haveMore
                      ? const FlutterLogo()
                      : IconButton(
                          icon: const BackButtonIcon(),
                          tooltip: '返回',
                          onPressed: () =>
                              setState(() => categoryMap[_position] = null),
                        ),
                ),
                frontTitle: AnimatedSwitcher(
                  switchInCurve: switchInCurve,
                  duration: _kSwitchDuration,
                  switchOutCurve: switchOutCurve,
                  child: categoryMap[_position] == null || !haveMore
                      ? const Text('Flutter 教程')
                      : Text(categoryMap[_position].title),
                ),
                frontHeading: Container(
                  height: 24.0,
                ),
                frontLayer: AnimatedSwitcher(
                  duration: _kSwitchDuration,
                  switchOutCurve: switchOutCurve,
                  switchInCurve: switchInCurve,
                  layoutBuilder:
                      centerHome ? _centerHomeLayout : _topHomeLayout,
                  child: categoryMap[_position] == null && haveMore
                      ? _CategoryList(
                          pageCategoryList: kAllBottomItemToCategory[
                              kAllBottomItem.toList()[_position]],
                          onCategoryTap: (PageCategory category) {
                            setState(() {
                              categoryMap[_position] = category;
                            });
                          },
                        )
                      : _PageList(categoryMap[_position]),
                ),
              ),
              onWillPop: () {
                if (categoryMap[_position] != null && haveMore) {
                  setState(() {
                    categoryMap[_position] = null;
                  });
                  return Future<bool>.value(false);
                }
                return Future<bool>.value(true);
              })),
    );
    return home;
  }
}

class _CategoryList extends StatelessWidget {
  _CategoryList({Key key, this.pageCategoryList, this.onCategoryTap})
      : super(key: key);
  final List<PageCategory> pageCategoryList;
  final ValueChanged<PageCategory> onCategoryTap;

  @override
  Widget build(BuildContext context) {
    const double aspectRatio = 160.0 / 180.0;
    final int columnCount =
        (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3;

    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      label: 'Page CateGory',
      explicitChildNodes: true,
      child: SingleChildScrollView(
        key: const PageStorageKey<String>('categories'),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          final double columnWidth =
              constraints.biggest.width / columnCount.toDouble();
          final double rowHeight = math.min(225.0, columnWidth * aspectRatio);
          final int rowCount =
              (pageCategoryList.length + columnCount - 1) ~/ columnCount;

          return RepaintBoundary(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: new List<Widget>.generate(rowCount, (int rowIndex) {
                final int columnCountForRow = rowIndex == rowCount - 1
                    ? pageCategoryList.length -
                        columnCount * math.max(0, rowCount - 1)
                    : columnCount;

                return new Row(
                  children: new List<Widget>.generate(columnCountForRow,
                      (int columnIndex) {
                    final int index = rowIndex * columnCount + columnIndex;
                    final PageCategory indexCategory = pageCategoryList[index];
                    return SizedBox(
                      width: columnWidth,
                      height: rowHeight,
                      child: _CategoryItem(indexCategory, () {
                        onCategoryTap(indexCategory);
                      }),
                    );
                  }),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final PageCategory pageCategory;
  final VoidCallback onTap;

  _CategoryItem(this.pageCategory, this.onTap);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    return RepaintBoundary(
      child: Card(
        child: RawMaterialButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          splashColor: theme.primaryColor.withOpacity(0.12),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  pageCategory.title,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: isDark ? Colors.white : const Color(0xFF202124),
                      ),
                ),
                Text(
                  pageCategory.subhead,
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PageList extends StatelessWidget {
  const _PageList(this.pageCategory);

  //根据标签查找对应的page
  final PageCategory pageCategory;

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList =
        kAllCategorysToPages[pageCategory].map<Widget>((Page page) {
      return _PageItem(
        page: page,
      );
    }).toList();
    return new KeyedSubtree(
        key: const ValueKey('PageDemoList'),
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: pageCategory.title,
          explicitChildNodes: true,
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            key: PageStorageKey<String>(pageCategory.title),
            padding: const EdgeInsets.only(top: 8.0),
            children: pageList,
          ),
        ));
  }
}

const double _kPageItemHeight = 64.0;

class _PageItem extends StatelessWidget {
  const _PageItem({Key key, this.page}) : super(key: key);
  final Page page;

  //点击后跳转到对应的demo
  void _launchPage(BuildContext context) {
    if (page.routeName != null) {
      Timeline.instantSync('Start Transition', arguments: <String, String>{
        'form': '/',
        'to': page.routeName,
      });
    }
    Navigator.pushNamed(context, page.routeName);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData data = Theme.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double textScale = MediaQuery.textScaleFactorOf(context);

    List<Widget> children = <Widget>[
      Text(
        page.title,
        style: data.textTheme.title.copyWith(
          color: isDark ? Colors.white : const Color(0xFF202124),
        ),
      ),
      Text(
        page.subhead,
        style: data.textTheme.subhead.copyWith(
          color: Colors.grey,
        ),
      )
    ];
    if (page.icon != null) {
      children.insert(
          0,
          Icon(
            page.icon,
            size: 20.0,
          ));
    }
    Widget pageHome = Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: _kPageItemHeight * textScale),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
    if (!finishDemo.contains(page.title)) {
      pageHome = Stack(
        children: [
          pageHome,
          Positioned(
              top: 10.0,
              right: 10.0,
              child: Icon(
                Icons.lock,
                color: isDark ? Colors.white : Colors.black,
              )),
        ],
      );
    }
    return Card(
      child: RawMaterialButton(
          padding: EdgeInsets.zero,
          splashColor: data.primaryColor.withOpacity(0.12),
          highlightColor: Colors.transparent,
          onPressed: () {
            if (finishDemo.contains(page.title)) {
              _launchPage(context);
            }
          },
          child: pageHome),
    );
  }
}
