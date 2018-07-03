import 'package:flutter/material.dart';

import 'package:flutterbyrhyme/widgets/basics/abasicesShow.dart';
import 'package:flutter/foundation.dart';

class BottomItem {
  final String title;
  final Icon icon;
  final Widget home;
  final Color color;

  const BottomItem._(
      {this.title, this.icon, this.home, this.color: Colors.white});

  @override
  bool operator ==(other) {
    // TODO: implement ==
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final BottomItem typeOther = other;
    return typeOther.title == title && typeOther.color == other;
  }
}

const BottomItem widgetDemo = const BottomItem._(
    title: '组件',
    icon: const Icon(Icons.widgets),
    color: Colors.blue);

const BottomItem networkDemo = const BottomItem._(
    title: '网络',
    icon: const Icon(Icons.network_wifi),
    color: Colors.green);

const BottomItem designDemo = const BottomItem._(
    title: '设计',
    icon: const Icon(Icons.style),
    color: Colors.pink);
const BottomItem deviceDemo = const BottomItem._(
    title: '平台',
    icon: const Icon(Icons.stay_primary_landscape),
    color: Colors.lime);

class PageCategory {
  final String title;
  final String subhead;
  final BottomItem bottomItem;

  const PageCategory._(
      {final this.title, final this.subhead, final this.bottomItem});

  @override
  bool operator ==(other) {
    // TODO: implement ==
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final PageCategory typeOther = other;
    return typeOther.title == title && typeOther.subhead == subhead;
  }
}

const PageCategory _kBasics = const PageCategory._(
  title: '基础组件',
  subhead: '如果你想构建第一个Flutter应用，您绝对需要了解这些组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kMDComponents = const PageCategory._(
  title: 'MD组件',
  subhead: '实现了Material Design 指南的视觉、效果的组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kCupertino = const PageCategory._(
  title: 'IOS风格组件',
  subhead: '用于当前iOS设计语言的美丽和高保真组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kText = const PageCategory._(
  title: 'IOS风格组件',
  subhead: '用于当前iOS设计语言的美丽和高保真组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kLayout = const PageCategory._(
  title: '文本',
  subhead: '文本显示和样式。',
  bottomItem: widgetDemo,
);

const PageCategory _kAssertII = const PageCategory._(
  title: '资源、图片、图标',
  subhead: '管理资源, 显示图片和图标。',
  bottomItem: widgetDemo,
);

const PageCategory _kInput = const PageCategory._(
  title: '用户输入',
  subhead: 'MD组件和IOS风格组件中获取用户输入的组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kAnimation = const PageCategory._(
  title: '动画和触摸',
  subhead: '在您的应用中使用动画。',
  bottomItem: widgetDemo,
);

const PageCategory _kInteraction = const PageCategory._(
  title: '交互模式',
  subhead: '响应触摸事件并将用户路由到不同的页面视图。',
  bottomItem: widgetDemo,
);

const PageCategory _kStyling = const PageCategory._(
  title: '样式',
  subhead: '管理应用的主题，使应用能够响应式的适应屏幕尺寸或添加填充。',
  bottomItem: widgetDemo,
);

const PageCategory _kPainting = const PageCategory._(
  title: '绘制和视觉效果',
  subhead: '控件将视觉效果应用到其子组件，而不改变它们的布局、大小和位置。',
  bottomItem: widgetDemo,
);

const PageCategory _kAsync = const PageCategory._(
  title: '异步',
  subhead: 'Flutter应用的异步模式。',
  bottomItem: widgetDemo,
);

const PageCategory _kScrolling = const PageCategory._(
  title: '滚动',
  subhead: '滚动一个拥有多个子组件的父组件。',
  bottomItem: widgetDemo,
);

const PageCategory _kAccess = const PageCategory._(
  title: '辅助功能',
  subhead: '给你的App添加辅助功能(这是一个正在进行的工作)。',
  bottomItem: widgetDemo,
);

const PageCategory _kNetWork =const PageCategory._(
  title: '网络',
  subhead: '待添加',
  bottomItem: networkDemo,
);

class Page {
  final String title;
  final String subhead;
  final IconData icon;
  final String routeName;
  final WidgetBuilder buildRoute;
  final PageCategory category;

  Page(
      {@required this.title,
      @required this.subhead,
      @required this.icon,
      @required this.category,
      @required this.routeName,
      @required this.buildRoute});

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final Page typeOther = other;

    return typeOther.routeName == routeName &&
        title == typeOther.title &&
        subhead == typeOther.subhead;
  }

  @override
  int get hashCode => hashValues(title, subhead, routeName);

  @override
  String toString() {
    return '$runtimeType($title,$subhead,$routeName)';
  }
}

List<Page> _buildPage() {
  final List<Page> _pageList = <Page>[
    ///basices
    Page(
        title: 'Container',
        subhead: '一个拥有绘制、定位、调整大小的组件。',
        icon: null,
        category: _kBasics,
        routeName: ContainerDemo.routeName,
        buildRoute: (BuildContext context) => ContainerDemo()),
    Page(
        title: 'Row',
        subhead: '在水平方向上排列子组件的列表。',
        icon: null,
        category: _kBasics,
        routeName: RowDemo.routeName,
        buildRoute: (BuildContext context) => RowDemo()),
    Page(
        title: 'Column',
        subhead: '在垂直方向上排列子组件的列表。',
        icon: null,
        category: _kBasics,
        routeName: RowDemo.routeName,
        buildRoute: (BuildContext context) => ColumnDemo()),
    Page(
        title: 'Image',
        subhead: '一个显示图片的组件。',
        icon: null,
        category: _kBasics,
        routeName: ImageDemo.routeName,
        buildRoute: (BuildContext context) => ImageDemo()),
    Page(
        title: 'Scaffold',
        subhead:
            'Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。',
        icon: null,
        category: _kBasics,
        routeName: ScaffoldDemo.routeName,
        buildRoute: (BuildContext context) => ScaffoldDemo()),
    Page(
        title: 'AppBar',
        subhead:
            '一个Material Design应用程序栏，由工具栏和其他可能的组件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kBasics,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),
    Page(
        title: 'FlutterLogo',
        subhead:
            '一个Material Design应用程序栏，由工具栏和其他可能的组件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kBasics,
        routeName: FlutterLogoDemo.routeName,
        buildRoute: (BuildContext context) => FlutterLogoDemo()),
    Page(
        title: 'PlaceHolder',
        subhead: '一个空白的盒子，代表以后有组件加入。',
        icon: null,
        category: _kBasics,
        routeName: FlutterLogoDemo.routeName,
        buildRoute: (BuildContext context) => FlutterLogoDemo()),
    ///Material ComPonents
    Page(
        title: 'Scaffold',
        subhead:
        'Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。',
        icon: null,
        category: _kMDComponents,
        routeName: ScaffoldDemo.routeName,
        buildRoute: (BuildContext context) => ScaffoldDemo()),
    Page(
        title: 'AppBar',
        subhead:
        '一个Material Design应用程序栏，由工具栏和其他可能的组件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),
    Page(
        title: 'BottomNavigationBar',
        subhead:
        '底部导航条，可以很容易地在tap之间切换和浏览顶级视图。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),

    Page(
        title: '网络',
        subhead: '待添加',
        icon: null,
        category: _kNetWork,
        routeName: FlutterLogoDemo.routeName,
        buildRoute: (BuildContext context) => FlutterLogoDemo()),

  ];

  return _pageList;
}

///全部页面
final List<Page> kAllPages = _buildPage();

///全部标签
final Set<PageCategory> kAllPageCategorys =
    kAllPages.map((Page page) => page.category).toSet();

///标签对应的页面列表
final Map<PageCategory, List<Page>> kAllCategorysToPages =
    new Map.fromIterable(kAllPageCategorys, value: (dynamic category) {
  return kAllPages.where((Page page) => page.category == category).toList();
});

///全部底部栏标签
final Set<BottomItem> kAllBottomItem = kAllPageCategorys
    .map((PageCategory category) => category.bottomItem)
    .toSet();

///底部栏标签对应标签
final Map<BottomItem, List<PageCategory>> kAllBottomItemToCategory =
    new Map.fromIterable(kAllBottomItem, value: (dynamic bottomItem) {
  return kAllPageCategorys
      .where((PageCategory category) => category.bottomItem == bottomItem)
      .toList();
});
