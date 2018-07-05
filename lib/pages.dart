import 'package:flutter/material.dart';

import 'package:flutterbyrhyme/widgets/basics/aBasicesShow.dart';
import 'package:flutterbyrhyme/widgets/material/aMaterialShow.dart';
import 'package:flutterbyrhyme/widgets/cupertino/aaCupertinoShow.dart';
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

const PageCategory _kLayout = const PageCategory._(
  title: '布局',
  subhead: '文本显示和样式。',
  bottomItem: widgetDemo,
);

const PageCategory _kText = const PageCategory._(
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
        title: 'Text',
        subhead: '单一格式的文本。',
        icon: null,
        category: _kBasics,
        routeName: TextDemo.routeName,
        buildRoute: (BuildContext context) => TextDemo()),
    Page(
        title: 'Icon',
        subhead: '一个Material Design图标。',
        icon: null,
        category: _kBasics,
        routeName: IconDemo.routeName,
        buildRoute: (BuildContext context) => IconDemo()),
    Page(
        title: 'RaisedButton',
        subhead: '一个凸起的材质矩形按钮。',
        icon: null,
        category: _kBasics,
        routeName: RaisedButtonDemo.routeName,
        buildRoute: (BuildContext context) => RaisedButtonDemo()),
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
        title: 'TabBar',
        subhead:
        '一个显示水平选项卡的Material Design 组件。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => TabBarDemo()),
    Page(
        title: 'TabBarView',
        subhead:
        '显示与当前选中的选项卡相对应的页面视图。通常和TabBar一起使用。',
        icon: null,
        category: _kMDComponents,
        routeName: TabBarViewDemo.routeName,
        buildRoute: (BuildContext context) => TabBarViewDemo()),
    Page(
        title: 'MaterialApp',
        subhead:
        '它封装了应用程序实现Material Design所需要的一些组件。',
        icon: null,
        category: _kMDComponents,
        routeName: MaterialAppDemo.routeName,
        buildRoute: (BuildContext context) => MaterialAppDemo()),
    Page(
        title: 'WidgetsApp',
        subhead:
        '它封装了应用程序通常需要的一些组件。',
        icon: null,
        category: _kMDComponents,
        routeName: WidgetsAppDemo.routeName,
        buildRoute: (BuildContext context) => WidgetsAppDemo()),
    Page(
        title: 'Drawer',
        subhead:
        '从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。',
        icon: null,
        category: _kMDComponents,
        routeName: DrawerDemo.routeName,
        buildRoute: (BuildContext context) => DrawerDemo()),
    Page(
        title: 'RaisedButton',
        subhead:
        '一个凸起的材质矩形按钮。',
        icon: null,
        category: _kMDComponents,
        routeName: RaisedButtonDemo.routeName,
        buildRoute: (BuildContext context) => RaisedButtonDemo()),
    Page(
        title: 'FloatingActionButton',
        subhead:
        '一个圆形图标按钮，它悬停在内容之上，以展示应用程序中的主要动作。',
        icon: null,
        category: _kMDComponents,
        routeName: FloatingActionButtonDemo.routeName,
        buildRoute: (BuildContext context) => FloatingActionButtonDemo()),
    Page(
        title: 'FlatButton',
        subhead:
        '一个扁平的Material按钮。',
        icon: null,
        category: _kMDComponents,
        routeName: FlatButtonDemo.routeName,
        buildRoute: (BuildContext context) => FlatButtonDemo()),
    Page(
        title: 'IconButton',
        subhead:
        '一个Material图标按钮，点击时会有水波动画。',
        icon: null,
        category: _kMDComponents,
        routeName: IconButtonDemo.routeName,
        buildRoute: (BuildContext context) => IconButtonDemo()),
    Page(
        title: 'PopupMenuButton',
        subhead:
        '当菜单隐藏时，点击或调用onSelected时显示一个弹出式菜单列表。',
        icon: null,
        category: _kMDComponents,
        routeName: PopupMenuButtonDemo.routeName,
        buildRoute: (BuildContext context) => PopupMenuButtonDemo()),
    Page(
        title: 'ButtonBar',
        subhead:
        '水平排列的按钮组。',
        icon: null,
        category: _kMDComponents,
        routeName: ButtonBarDemo.routeName,
        buildRoute: (BuildContext context) => ButtonBarDemo()),
    Page(
        title: 'TextField',
        subhead:
        '文本输入框。',
        icon: null,
        category: _kMDComponents,
        routeName: TextFieldDemo.routeName,
        buildRoute: (BuildContext context) => TextFieldDemo()),
    Page(
        title: 'Checkbox',
        subhead:
        '复选框，允许用户从一组中选择多个选项。',
        icon: null,
        category: _kMDComponents,
        routeName: CheckBoxDemo.routeName,
        buildRoute: (BuildContext context) => CheckBoxDemo()),
    Page(
        title: 'Radio',
        subhead:
        '单选框，允许用户从一组中选择一个选项。',
        icon: null,
        category: _kMDComponents,
        routeName: RadioDemo.routeName,
        buildRoute: (BuildContext context) => RadioDemo()),
    Page(
        title: 'Switch',
        subhead:
        'On/off 用于切换一个单一状态。',
        icon: null,
        category: _kMDComponents,
        routeName: SwitchDemo.routeName,
        buildRoute: (BuildContext context) => SwitchDemo()),
    Page(
        title: 'Slider',
        subhead:
        '滑块，允许用户通过滑动滑块来从一系列值中选择。',
        icon: null,
        category: _kMDComponents,
        routeName: SliderDemo.routeName,
        buildRoute: (BuildContext context) => SliderDemo()),
    Page(
        title: 'Date&Time Pickers',
        subhead:
        '日期&时间选择器。',
        icon: null,
        category: _kMDComponents,
        routeName: DateTimePickersDemo.routeName,
        buildRoute: (BuildContext context) => DateTimePickersDemo()),
    Page(
        title: 'SimpleDialog',
        subhead:
        '简单对话框可以显示附加的提示或操作。',
        icon: null,
        category: _kMDComponents,
        routeName: SimpleDialogDemo.routeName,
        buildRoute: (BuildContext context) => SimpleDialogDemo()),
    Page(
        title: 'AlertDialog',
        subhead:
        '一个会中断用户操作的对话框，需要用户确认。',
        icon: null,
        category: _kMDComponents,
        routeName: AlertDialogDemo.routeName,
        buildRoute: (BuildContext context) => AlertDialogDemo()),
    Page(
        title: 'BottomSheet',
        subhead:
        '一个从屏幕底部滑起的列表（以显示更多的内容）。',
        icon: null,
        category: _kMDComponents,
        routeName: BottomSheetDemo.routeName,
        buildRoute: (BuildContext context) => BottomSheetDemo()),
    Page(
        title: 'ExpansionPanel',
        subhead:
        '一个会扩展的面板组件。',
        icon: null,
        category: _kMDComponents,
        routeName: ExpansionPanelDemo.routeName,
        buildRoute: (BuildContext context) => ExpansionPanelDemo()),
    Page(
        title: 'SnackBar',
        subhead:
        '一个在屏幕的底部显示的具有可选操作的轻量级消息提示。',
        icon: null,
        category: _kMDComponents,
        routeName: SnackBarDemo.routeName,
        buildRoute: (BuildContext context) => SnackBarDemo()),
    Page(
        title: 'Image',
        subhead:
        '一个显示图片的组件。',
        icon: null,
        category: _kMDComponents,
        routeName: ImageDemo.routeName,
        buildRoute: (BuildContext context) => ImageDemo()),
    Page(
        title: 'Icon',
        subhead:
        '一个Material Design图标。',
        icon: null,
        category: _kMDComponents,
        routeName: IconDemo.routeName,
        buildRoute: (BuildContext context) => IconDemo()),
    Page(
        title: 'Chip',
        subhead:
        '一个Material widget标签。',
        icon: null,
        category: _kMDComponents,
        routeName: ChipDemo.routeName,
        buildRoute: (BuildContext context) => ChipDemo()),
    Page(
        title: 'Tooltip',
        subhead:
        '一个文本提示工具，通常长按下显示。',
        icon: null,
        category: _kMDComponents,
        routeName: TooltipDemo.routeName,
        buildRoute: (BuildContext context) => TooltipDemo()),
    Page(
        title: 'DataTable',
        subhead:
        '一个数据表，通常用于桌面产品。',
        icon: null,
        category: _kMDComponents,
        routeName: DataTableDemo.routeName,
        buildRoute: (BuildContext context) => DataTableDemo()),
    Page(
        title: 'Card',
        subhead:
        '一个 Material Design 卡片。拥有一个圆角和阴影。',
        icon: null,
        category: _kMDComponents,
        routeName: CardDemo.routeName,
        buildRoute: (BuildContext context) => CardDemo()),
    Page(
        title: 'LinearProgressIndicator',
        subhead:
        '一个线性进度条。',
        icon: null,
        category: _kMDComponents,
        routeName: LinearProgressIndicatorDemo.routeName,
        buildRoute: (BuildContext context) => LinearProgressIndicatorDemo()),
    Page(
        title: 'ListTile',
        subhead:
        '一个固定高度的行。',
        icon: null,
        category: _kMDComponents,
        routeName: ListTileDemo.routeName,
        buildRoute: (BuildContext context) => ListTileDemo()),
    Page(
        title: 'Stepper',
        subhead:
        '一个Material Design步骤指示器。',
        icon: null,
        category: _kMDComponents,
        routeName: StepperDemo.routeName,
        buildRoute: (BuildContext context) => StepperDemo()),
    Page(
        title: 'Divider',
        subhead:
        '一个1像素厚的水平分割线。',
        icon: null,
        category: _kMDComponents,
        routeName: DividerDemo.routeName,
        buildRoute: (BuildContext context) => DividerDemo()),

    ///Cupertino

    ///network
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
