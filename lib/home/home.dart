import 'package:flutter/material.dart' hide Page;
import 'package:flutterbyrhyme/pages.dart';
import 'package:flutterbyrhyme/backdrop.dart';
import 'package:flutterbyrhyme/search.dart';
import 'package:flutterbyrhyme/options/help.dart';
import 'dart:developer';
import 'package:flutterbyrhyme/options/options.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutterbyrhyme/upgrade.dart';

const _kSwitchDuration = const Duration(milliseconds: 300);

///主页
class HomePage extends StatefulWidget {
  final Widget optionPage;
  final ValueChanged<BottomItem> colorChange;

  const HomePage({this.optionPage, this.colorChange});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //全局唯一key
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  Map<int, PageCategory> categoryMap;
  int _position = 0;
  double bottomOpcity = 1.0;
  bool haveMore = true;

  //点击帮助
  void _onHelp() {
    Navigator.of(context).push(_pageSearchOrHelpJump(HelpPage()));
  }


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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryMap = Map();
    //check to upgrade
    checkUpdate(context, false);
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

  _pageSearchOrHelpJump(Widget child) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return child;
        },
        opaque: true,
        transitionDuration: Duration(milliseconds: 150),
        transitionsBuilder: (__, Animation<double> animation, ____,
                Widget child) =>
            SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation),
              child: child,
            ));
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final MediaQueryData media = MediaQuery.of(context);
    //是否竖屏并且高度小于800
    final bool centerHome =
        media.orientation == Orientation.portrait;

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
              child: Backdrop(
                helpAction: _onHelp,
                searchAction: () async {
                  String routeName = await showSearch(
                      context: context, delegate: SearchPage());
                  if (routeName.isEmpty) {
                    return;
                  }
                  Navigator.of(context).pushNamed(routeName);
                },
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
          OptionContext optionContext = OptionContext.of(context);
          int listStyle = optionContext.options.listStyle.listStyle;
          if (listStyle == 1) {
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
                      final PageCategory indexCategory =
                          pageCategoryList[index];
                      return SizedBox(
                        width: columnWidth,
                        height: rowHeight,
                        child: _CategoryGridItem(indexCategory, () {
                          onCategoryTap(indexCategory);
                        }),
                      );
                    }),
                  );
                }),
              ),
            );
          } else {
            return Column(
              children: pageCategoryList.map((pageCategory) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 5.0),
                      )),
                  child: ListTile(
                    onTap: () {
                      onCategoryTap(pageCategory);
                    },
                    title: Text(
                      pageCategory.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      pageCategory.subhead,
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                );
              }).toList(),
            );
          }
        }),
      ),
    );
  }
}

class _CategoryGridItem extends StatelessWidget {
  final PageCategory pageCategory;
  final VoidCallback onTap;

  _CategoryGridItem(this.pageCategory, this.onTap);

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
            padding: const EdgeInsets.all(6.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  pageCategory.title,
                  style: Theme.of(context).textTheme.title.copyWith(
                        color: isDark ? Colors.white : const Color(0xFF202124),
                      ),
                ),
                SizedBox(
                  height: 32.0,
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
    Widget child;
    var optionContext = OptionContext.of(context);
    if (optionContext.options.listStyle.listStyle == 1) {
      List<Widget> pageList =
          kAllCategorysToPages[pageCategory].map<Widget>((Page page) {
        return _PageGridItem(
          page: page,
        );
      }).toList();
      child = GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        key: PageStorageKey<String>(pageCategory.title),
        padding: const EdgeInsets.only(top: 8.0),
        children: pageList,
      );
    } else {
      child = ListView(
        children: ListTile.divideTiles(
          color: Colors.grey,
          tiles: kAllCategorysToPages[pageCategory].map((page) {
            return _PageListItem(
              page: page,
            );
          }).toList(),
        ).toList(),
      );
    }
    return new KeyedSubtree(
        key: const ValueKey('PageDemoList'),
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: pageCategory.title,
          explicitChildNodes: true,
          child: child,
        ));
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const _ListItem({Key key, this.title, this.subTitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[200], width: 5.0),
          )),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final bool showLock;

  const _GridItem(
      {Key key, this.onTap, this.title, this.subTitle, this.showLock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData data = Theme.of(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double textScale = MediaQuery.textScaleFactorOf(context);
    return Card(
      child: RawMaterialButton(
          padding: EdgeInsets.zero,
          splashColor: data.primaryColor.withOpacity(0.12),
          highlightColor: Colors.transparent,
          onPressed: onTap,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.center,
                constraints:
                    BoxConstraints(minHeight: _kPageItemHeight * textScale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      title,
                      style: data.textTheme.title.copyWith(
                        color: isDark ? Colors.white : const Color(0xFF202124),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      subTitle,
                      style: data.textTheme.subhead.copyWith(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ]..add(
                showLock
                    ? Positioned(
                        top: 10.0,
                        right: 10.0,
                        child: Icon(
                          Icons.lock,
                          color: isDark ? Colors.white : Colors.black,
                        ))
                    : Container(),
              ),
          )),
    );
  }
}

class _PageListItem extends StatelessWidget {
  const _PageListItem({Key key, this.page}) : super(key: key);
  final Page page;

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
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[200], width: 5.0),
          )),
      child: ListTile(
        onTap: () {
          _launchPage(context);
        },
        title: Text(
          page.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          page.subhead,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}

const double _kPageItemHeight = 64.0;

class _PageGridItem extends StatelessWidget {
  const _PageGridItem({Key key, this.page}) : super(key: key);
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
      SizedBox(
        height: 16.0,
      ),
      Text(
        page.title,
        style: data.textTheme.title.copyWith(
          color: isDark ? Colors.white : const Color(0xFF202124),
        ),
      ),
      SizedBox(
        height: 16.0,
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
      padding: const EdgeInsets.all(6.0),
      alignment: Alignment.center,
      constraints: BoxConstraints(minHeight: _kPageItemHeight * textScale),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
