import 'package:flutter/material.dart';

import 'package:flutterbyrhyme/widgets/basics/aBasicesShow.dart';
import 'package:flutterbyrhyme/widgets/material/aMaterialShow.dart';
import 'package:flutterbyrhyme/widgets/cupertino/aaCupertinoShow.dart';
import 'package:flutterbyrhyme/widgets/layout/aLayoutShow.dart';
import 'package:flutterbyrhyme/widgets/text/aaTextShow.dart';
import 'package:flutterbyrhyme/widgets/assets/aAssetsShow.dart';
import 'package:flutterbyrhyme/widgets/input/aaInputShow.dart';
import 'package:flutterbyrhyme/widgets/animated/aaAnimatedShow.dart';
import 'package:flutterbyrhyme/widgets/interaction/aInteractionShow.dart';
import 'package:flutterbyrhyme/widgets/styling/aStylingShow.dart';
import 'package:flutterbyrhyme/widgets/painting/aaPaintingShow.dart';
import 'package:flutterbyrhyme/widgets/async/aAsyncShow.dart';
import 'package:flutterbyrhyme/widgets/scrolling/aScrollingShow.dart';
import 'package:flutterbyrhyme/widgets/access/aAccessShow.dart';
import 'package:flutterbyrhyme/network/temp.dart';

import 'package:flutter/foundation.dart';

const String finishDemo='Container,Row,Column,Image,Text.Icon,RaisedButton,Scaffold,AppBar';

class BottomItem {
  final String title;
  final Icon icon;
  final Widget home;
  final Color lightColor;
  final Color darkColor;

  const BottomItem._(
      {this.title,
      this.icon,
      this.home,
      this.lightColor: Colors.white,
      this.darkColor: Colors.black});

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
    return typeOther.title == title && typeOther.lightColor == other;
  }
  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(title, icon,home,lightColor,darkColor);
}

const BottomItem widgetDemo = const BottomItem._(
  title: '部件',
  icon: const Icon(Icons.widgets),
  lightColor: Colors.blue,
  darkColor: const Color(0xFF002D75),
);

const BottomItem networkDemo = const BottomItem._(
  title: '网络',
  icon: const Icon(Icons.network_wifi),
  lightColor: Colors.green,
  darkColor: const Color(0xFF1B5E20),
);

const BottomItem designDemo = const BottomItem._(
  title: '设计',
  icon: const Icon(Icons.style),
  lightColor: Colors.pink,
  darkColor: const Color(0xFF880E4F),
);
const BottomItem deviceDemo = const BottomItem._(
  title: '平台',
  icon: const Icon(Icons.stay_primary_landscape),
  lightColor: Colors.lime,
  darkColor: const Color(0xFF827717),
);

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
  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(title, subhead,bottomItem);
}

const PageCategory _kBasics = const PageCategory._(
  title: '基础部件',
  subhead: '如果你想构建第一个Flutter应用，您绝对需要了解这些部件。',
  bottomItem: widgetDemo,
);

const PageCategory _kMDComponents = const PageCategory._(
  title: 'MD部件',
  subhead: '实现了Material Design 指南的视觉、效果的部件。',
  bottomItem: widgetDemo,
);

const PageCategory _kCupertino = const PageCategory._(
  title: 'IOS风格部件',
  subhead: '用于当前iOS设计语言的美丽和高保真部件。',
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
  subhead: 'MD部件和IOS风格部件中获取用户输入的部件。',
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
  subhead: '控件将视觉效果应用到其子部件，而不改变它们的布局、大小和位置。',
  bottomItem: widgetDemo,
);

const PageCategory _kAsync = const PageCategory._(
  title: '异步',
  subhead: 'Flutter应用的异步模式。',
  bottomItem: widgetDemo,
);

const PageCategory _kScrolling = const PageCategory._(
  title: '滚动',
  subhead: '滚动一个拥有多个子部件的父部件。',
  bottomItem: widgetDemo,
);

const PageCategory _kAccess = const PageCategory._(
  title: '辅助功能',
  subhead: '给你的App添加辅助功能(这是一个正在进行的工作)。',
  bottomItem: widgetDemo,
);

const PageCategory _kNetWork = const PageCategory._(
  title: '网络',
  subhead: '待添加',
  bottomItem: networkDemo,
);
const PageCategory _kdesign = const PageCategory._(
  title: '设计',
  subhead: '待添加',
  bottomItem: designDemo,
);
const PageCategory _kdevice = const PageCategory._(
  title: '设备',
  subhead: '待添加',
  bottomItem: deviceDemo,
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
        subhead: '一个拥有绘制、定位、调整大小的部件。',
        icon: null,
        category: _kBasics,
        routeName: ContainerDemo.routeName,
        buildRoute: (BuildContext context) => ContainerDemo()),
    Page(
        title: 'Row',
        subhead: '在水平方向上排列子部件的列表。',
        icon: null,
        category: _kBasics,
        routeName: RowDemo.routeName,
        buildRoute: (BuildContext context) => RowDemo()),
    Page(
        title: 'Column',
        subhead: '在垂直方向上排列子部件的列表。',
        icon: null,
        category: _kBasics,
        routeName: ColumnDemo.routeName,
        buildRoute: (BuildContext context) => ColumnDemo()),
    Page(
        title: 'Image',
        subhead: '一个显示图片的部件。',
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
            '一个Material Design应用程序栏，由工具栏和其他可能的部件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kBasics,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),
    Page(
        title: 'FlutterLogo',
        subhead:
            '一个Material Design应用程序栏，由工具栏和其他可能的部件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kBasics,
        routeName: FlutterLogoDemo.routeName,
        buildRoute: (BuildContext context) => FlutterLogoDemo()),
    Page(
        title: 'PlaceHolder',
        subhead: '一个空白的盒子，代表以后有部件加入。',
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
            '一个Material Design应用程序栏，由工具栏和其他可能的部件（如TabBar和FlexibleSpaceBar）组成。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),
    Page(
        title: 'BottomNavigationBar',
        subhead: '底部导航条，可以很容易地在tap之间切换和浏览顶级视图。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => AppBarDemo()),
    Page(
        title: 'TabBar',
        subhead: '一个显示水平选项卡的Material Design 部件。',
        icon: null,
        category: _kMDComponents,
        routeName: AppBarDemo.routeName,
        buildRoute: (BuildContext context) => TabBarDemo()),
    Page(
        title: 'TabBarView',
        subhead: '显示与当前选中的选项卡相对应的页面视图。通常和TabBar一起使用。',
        icon: null,
        category: _kMDComponents,
        routeName: TabBarViewDemo.routeName,
        buildRoute: (BuildContext context) => TabBarViewDemo()),
    Page(
        title: 'MaterialApp',
        subhead: '它封装了应用程序实现Material Design所需要的一些部件。',
        icon: null,
        category: _kMDComponents,
        routeName: MaterialAppDemo.routeName,
        buildRoute: (BuildContext context) => MaterialAppDemo()),
    Page(
        title: 'WidgetsApp',
        subhead: '它封装了应用程序通常需要的一些部件。',
        icon: null,
        category: _kMDComponents,
        routeName: WidgetsAppDemo.routeName,
        buildRoute: (BuildContext context) => WidgetsAppDemo()),
    Page(
        title: 'Drawer',
        subhead: '从Scaffold边缘水平滑动以显示应用程序中导航链接的Material Design面板。',
        icon: null,
        category: _kMDComponents,
        routeName: DrawerDemo.routeName,
        buildRoute: (BuildContext context) => DrawerDemo()),
    Page(
        title: 'RaisedButton',
        subhead: '一个凸起的材质矩形按钮。',
        icon: null,
        category: _kMDComponents,
        routeName: RaisedButtonDemo.routeName,
        buildRoute: (BuildContext context) => RaisedButtonDemo()),
    Page(
        title: 'FloatingActionButton',
        subhead: '一个圆形图标按钮，它悬停在内容之上，以展示应用程序中的主要动作。',
        icon: null,
        category: _kMDComponents,
        routeName: FloatingActionButtonDemo.routeName,
        buildRoute: (BuildContext context) => FloatingActionButtonDemo()),
    Page(
        title: 'FlatButton',
        subhead: '一个扁平的Material按钮。',
        icon: null,
        category: _kMDComponents,
        routeName: FlatButtonDemo.routeName,
        buildRoute: (BuildContext context) => FlatButtonDemo()),
    Page(
        title: 'IconButton',
        subhead: '一个Material图标按钮，点击时会有水波动画。',
        icon: null,
        category: _kMDComponents,
        routeName: IconButtonDemo.routeName,
        buildRoute: (BuildContext context) => IconButtonDemo()),
    Page(
        title: 'PopupMenuButton',
        subhead: '当菜单隐藏时，点击或调用onSelected时显示一个弹出式菜单列表。',
        icon: null,
        category: _kMDComponents,
        routeName: PopupMenuButtonDemo.routeName,
        buildRoute: (BuildContext context) => PopupMenuButtonDemo()),
    Page(
        title: 'ButtonBar',
        subhead: '水平排列的按钮组。',
        icon: null,
        category: _kMDComponents,
        routeName: ButtonBarDemo.routeName,
        buildRoute: (BuildContext context) => ButtonBarDemo()),
    Page(
        title: 'TextField',
        subhead: '文本输入框。',
        icon: null,
        category: _kMDComponents,
        routeName: TextFieldDemo.routeName,
        buildRoute: (BuildContext context) => TextFieldDemo()),
    Page(
        title: 'Checkbox',
        subhead: '复选框，允许用户从一组中选择多个选项。',
        icon: null,
        category: _kMDComponents,
        routeName: CheckBoxDemo.routeName,
        buildRoute: (BuildContext context) => CheckBoxDemo()),
    Page(
        title: 'Radio',
        subhead: '单选框，允许用户从一组中选择一个选项。',
        icon: null,
        category: _kMDComponents,
        routeName: RadioDemo.routeName,
        buildRoute: (BuildContext context) => RadioDemo()),
    Page(
        title: 'Switch',
        subhead: 'On/off 用于切换一个单一状态。',
        icon: null,
        category: _kMDComponents,
        routeName: SwitchDemo.routeName,
        buildRoute: (BuildContext context) => SwitchDemo()),
    Page(
        title: 'Slider',
        subhead: '滑块，允许用户通过滑动滑块来从一系列值中选择。',
        icon: null,
        category: _kMDComponents,
        routeName: SliderDemo.routeName,
        buildRoute: (BuildContext context) => SliderDemo()),
    Page(
        title: 'Date&Time Pickers',
        subhead: '日期&时间选择器。',
        icon: null,
        category: _kMDComponents,
        routeName: DateTimePickersDemo.routeName,
        buildRoute: (BuildContext context) => DateTimePickersDemo()),
    Page(
        title: 'SimpleDialog',
        subhead: '简单对话框可以显示附加的提示或操作。',
        icon: null,
        category: _kMDComponents,
        routeName: SimpleDialogDemo.routeName,
        buildRoute: (BuildContext context) => SimpleDialogDemo()),
    Page(
        title: 'AlertDialog',
        subhead: '一个会中断用户操作的对话框，需要用户确认。',
        icon: null,
        category: _kMDComponents,
        routeName: AlertDialogDemo.routeName,
        buildRoute: (BuildContext context) => AlertDialogDemo()),
    Page(
        title: 'BottomSheet',
        subhead: '一个从屏幕底部滑起的列表（以显示更多的内容）。',
        icon: null,
        category: _kMDComponents,
        routeName: BottomSheetDemo.routeName,
        buildRoute: (BuildContext context) => BottomSheetDemo()),
    Page(
        title: 'ExpansionPanel',
        subhead: '一个会扩展的面板部件。',
        icon: null,
        category: _kMDComponents,
        routeName: ExpansionPanelDemo.routeName,
        buildRoute: (BuildContext context) => ExpansionPanelDemo()),
    Page(
        title: 'SnackBar',
        subhead: '一个在屏幕的底部显示的具有可选操作的轻量级消息提示。',
        icon: null,
        category: _kMDComponents,
        routeName: SnackBarDemo.routeName,
        buildRoute: (BuildContext context) => SnackBarDemo()),
    Page(
        title: 'Image',
        subhead: '一个显示图片的部件。',
        icon: null,
        category: _kMDComponents,
        routeName: ImageDemo.routeName,
        buildRoute: (BuildContext context) => ImageDemo()),
    Page(
        title: 'Icon',
        subhead: '一个Material Design图标。',
        icon: null,
        category: _kMDComponents,
        routeName: IconDemo.routeName,
        buildRoute: (BuildContext context) => IconDemo()),
    Page(
        title: 'Chip',
        subhead: '一个Material widget标签。',
        icon: null,
        category: _kMDComponents,
        routeName: ChipDemo.routeName,
        buildRoute: (BuildContext context) => ChipDemo()),
    Page(
        title: 'Tooltip',
        subhead: '一个文本提示工具，通常长按下显示。',
        icon: null,
        category: _kMDComponents,
        routeName: TooltipDemo.routeName,
        buildRoute: (BuildContext context) => TooltipDemo()),
    Page(
        title: 'DataTable',
        subhead: '一个数据表，通常用于桌面产品。',
        icon: null,
        category: _kMDComponents,
        routeName: DataTableDemo.routeName,
        buildRoute: (BuildContext context) => DataTableDemo()),
    Page(
        title: 'Card',
        subhead: '一个 Material Design 卡片。拥有一个圆角和阴影。',
        icon: null,
        category: _kMDComponents,
        routeName: CardDemo.routeName,
        buildRoute: (BuildContext context) => CardDemo()),
    Page(
        title: 'LinearProgressIndicator',
        subhead: '一个线性进度条。',
        icon: null,
        category: _kMDComponents,
        routeName: LinearProgressIndicatorDemo.routeName,
        buildRoute: (BuildContext context) => LinearProgressIndicatorDemo()),
    Page(
        title: 'ListTile',
        subhead: '一个固定高度的行。',
        icon: null,
        category: _kMDComponents,
        routeName: ListTileDemo.routeName,
        buildRoute: (BuildContext context) => ListTileDemo()),
    Page(
        title: 'Stepper',
        subhead: '一个Material Design步骤指示器。',
        icon: null,
        category: _kMDComponents,
        routeName: StepperDemo.routeName,
        buildRoute: (BuildContext context) => StepperDemo()),
    Page(
        title: 'Divider',
        subhead: '一个1像素厚的水平分割线。',
        icon: null,
        category: _kMDComponents,
        routeName: DividerDemo.routeName,
        buildRoute: (BuildContext context) => DividerDemo()),

    ///Cupertino
    Page(
        title: 'CupertinoActivityIndicator',
        subhead: '一个iOS风格的加载指示器。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoActivityIndicatorDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoActivityIndicatorDemo()),
    Page(
        title: 'CupertinoAlertDialog',
        subhead: '一个iOS风格的会中断用户操作的对话框。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoAlertDialogDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoAlertDialogDemo()),
    Page(
        title: 'CupertinoButton',
        subhead: '一个iOS风格的按钮。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoButtonDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoButtonDemo()),
    Page(
        title: 'CupertinoDialog',
        subhead: '一个iOS风格的对话框。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoDialogDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoDialogDemo()),
    Page(
        title: 'CupertinoDialogAction',
        subhead: '用于CupertinoAlertDialog的一个按钮。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoDialogActionDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoDialogActionDemo()),
    Page(
        title: 'CupertinoSlider',
        subhead: '一个IOS风格的滑块。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoSliderDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoSliderDemo()),
    Page(
        title: 'CupertinoSlider',
        subhead: '一个IOS风格的滑块。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoSliderDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoSliderDemo()),
    Page(
        title: 'CupertinoSwitch',
        subhead: '一个IOS风格的开关，单一状态的开关。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoSwitchDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoSwitchDemo()),
    Page(
        title: 'CupertinoPageTransition',
        subhead: '一个iOS风格的页面过度动画。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoPageTransitionDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoPageTransitionDemo()),
    Page(
        title: 'CupertinoFullscreenDialogTransition',
        subhead: '一个iOS风格的过渡，用于调用全屏对话框。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoFullscreenDialogTransitionDemo.routeName,
        buildRoute: (BuildContext context) =>
            CupertinoFullscreenDialogTransitionDemo()),
    Page(
        title: 'CupertinoNavigationBar',
        subhead: '一个iOS风格的导航栏。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoNavigationBarDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoNavigationBarDemo()),
    Page(
        title: 'CupertinoTabBar',
        subhead: '一个iOS风格的底部选项卡。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoTabBarDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoTabBarDemo()),
    Page(
        title: 'CupertinoPageScaffold',
        subhead: '一个iOS风格的页面的基本布局结构。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoPageScaffoldDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoPageScaffoldDemo()),
    Page(
        title: 'CupertinoTabScaffold',
        subhead: '一个标签式iOS应用程序的结构。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoTabScaffoldDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoTabScaffoldDemo()),
    Page(
        title: 'CupertinoTabView',
        subhead: '支持选项卡间并行导航项卡的根内容。',
        icon: null,
        category: _kCupertino,
        routeName: CupertinoTabViewDemo.routeName,
        buildRoute: (BuildContext context) => CupertinoTabViewDemo()),

    ///Layout
    Page(
        title: 'Container',
        subhead: '一个拥有绘制、定位、调整大小的部件。',
        icon: null,
        category: _kLayout,
        routeName: ContainerDemo.routeName,
        buildRoute: (BuildContext context) => ContainerDemo()),
    Page(
        title: 'Padding',
        subhead: '一个会给其子部件添加指定填充的部件。',
        icon: null,
        category: _kLayout,
        routeName: PaddingDemo.routeName,
        buildRoute: (BuildContext context) => PaddingDemo()),
    Page(
        title: 'Center',
        subhead: '一个将其子部件居中显示在自身内部的部件。',
        icon: null,
        category: _kLayout,
        routeName: CenterDemo.routeName,
        buildRoute: (BuildContext context) => CenterDemo()),
    Page(
        title: 'Align',
        subhead: '一个可以将其子部件对齐，并可以根据子部件的大小自动调整大小的部件。',
        icon: null,
        category: _kLayout,
        routeName: AlignDemo.routeName,
        buildRoute: (BuildContext context) => AlignDemo()),
    Page(
        title: 'FittedBox',
        subhead: '按自己的大小调整其子部件的大小和位置。',
        icon: null,
        category: _kLayout,
        routeName: FittedBoxDemo.routeName,
        buildRoute: (BuildContext context) => FittedBoxDemo()),
    Page(
        title: 'AspectRatio',
        subhead: '一个试图将子widget的大小指定为某个特定长宽比的部件。',
        icon: null,
        category: _kLayout,
        routeName: AspectRatioDemo.routeName,
        buildRoute: (BuildContext context) => AspectRatioDemo()),
    Page(
        title: 'ConstrainedBox',
        subhead: '对其子项施加附加约束的部件。',
        icon: null,
        category: _kLayout,
        routeName: ConstrainedBoxDemo.routeName,
        buildRoute: (BuildContext context) => ConstrainedBoxDemo()),
    Page(
        title: 'Baseline',
        subhead: '根据子项的基线对它们的位置进行定位的部件。',
        icon: null,
        category: _kLayout,
        routeName: BaselineDemo.routeName,
        buildRoute: (BuildContext context) => BaselineDemo()),
    Page(
        title: 'FractionallySizedBox',
        subhead: '一个把它自己的子项放在可用空间的一小部分的部件。',
        icon: null,
        category: _kLayout,
        routeName: FractionallySizedBoxDemo.routeName,
        buildRoute: (BuildContext context) => FractionallySizedBoxDemo()),
    Page(
        title: 'IntrinsicHeight',
        subhead: '一个将它自己的子部件的高度调整其本身实际高度的部件。',
        icon: null,
        category: _kLayout,
        routeName: IntrinsicHeightDemo.routeName,
        buildRoute: (BuildContext context) => IntrinsicHeightDemo()),
    Page(
        title: 'IntrinsicWidth',
        subhead: '一个将它自己的子部件的宽度调整其本身实际宽度的部件。',
        icon: null,
        category: _kLayout,
        routeName: IntrinsicWidthDemo.routeName,
        buildRoute: (BuildContext context) => IntrinsicWidthDemo()),
    Page(
        title: 'LimitedBox',
        subhead: '一个当其自身不受约束时才限制其大小的盒子',
        icon: null,
        category: _kLayout,
        routeName: LimitedBoxDemo.routeName,
        buildRoute: (BuildContext context) => LimitedBoxDemo()),
    Page(
        title: 'Offstage',
        subhead: '一个可以控制其子widget的显示和隐藏的部件。',
        icon: null,
        category: _kLayout,
        routeName: OffstageDemo.routeName,
        buildRoute: (BuildContext context) => OffstageDemo()),
    Page(
        title: 'OverflowBox',
        subhead: '对其子项施加不同约束的部件，它可能允许子项溢出父级。',
        icon: null,
        category: _kLayout,
        routeName: OverflowBoxDemo.routeName,
        buildRoute: (BuildContext context) => OverflowBoxDemo()),
    Page(
        title: 'SizedBox',
        subhead: '一个特定大小的盒子。如宽高为NULL，则此盒子大小匹配到子部件的大小。',
        icon: null,
        category: _kLayout,
        routeName: SizedBoxDemo.routeName,
        buildRoute: (BuildContext context) => SizedBoxDemo()),
    Page(
        title: 'SizedOverflowBox',
        subhead: 'SizedBox跟OverflowBox结合体。',
        icon: null,
        category: _kLayout,
        routeName: SizedOverflowBoxDemo.routeName,
        buildRoute: (BuildContext context) => SizedOverflowBoxDemo()),
    Page(
        title: 'Transform',
        subhead: '在绘制子部件之前应用转换的部件。',
        icon: null,
        category: _kLayout,
        routeName: TransformDemo.routeName,
        buildRoute: (BuildContext context) => TransformDemo()),
    Page(
        title: 'CustomSingleChildLayout',
        subhead: '一个自定义的拥有单个子部件的布局部件。',
        icon: null,
        category: _kLayout,
        routeName: CustomSingleChildLayoutDemo.routeName,
        buildRoute: (BuildContext context) => CustomSingleChildLayoutDemo()),
    Page(
        title: 'Row',
        subhead: '在水平方向上排列子部件的列表。',
        icon: null,
        category: _kLayout,
        routeName: RowDemo.routeName,
        buildRoute: (BuildContext context) => RowDemo()),
    Page(
        title: 'Column',
        subhead: '在垂直方向上排列子部件的列表。',
        icon: null,
        category: _kLayout,
        routeName: ColumnDemo.routeName,
        buildRoute: (BuildContext context) => ColumnDemo()),
    Page(
        title: 'Stack',
        subhead: '可以允许其子部件简单的堆叠在一起。',
        icon: null,
        category: _kLayout,
        routeName: StackDemo.routeName,
        buildRoute: (BuildContext context) => StackDemo()),
    Page(
        title: 'IndexedStack',
        subhead: '从一个子部件列表中显示单个孩子的Stack。',
        icon: null,
        category: _kLayout,
        routeName: IndexedStackDemo.routeName,
        buildRoute: (BuildContext context) => IndexedStackDemo()),
    Page(
        title: 'Container',
        subhead: '一个拥有绘制、定位、调整大小的部件。',
        icon: null,
        category: _kLayout,
        routeName: ContainerDemo.routeName,
        buildRoute: (BuildContext context) => ContainerDemo()),
    Page(
        title: 'Flow',
        subhead: '一个实现流式布局算法的部件。',
        icon: null,
        category: _kLayout,
        routeName: FlowDemo.routeName,
        buildRoute: (BuildContext context) => FlowDemo()),
    Page(
        title: 'Table',
        subhead: '一个实现表格布局算法的部件。',
        icon: null,
        category: _kLayout,
        routeName: TableDemo.routeName,
        buildRoute: (BuildContext context) => TableDemo()),
    Page(
        title: 'Wrap',
        subhead: '可以在水平或垂直方向多行显示其子部件。',
        icon: null,
        category: _kLayout,
        routeName: WrapDemo.routeName,
        buildRoute: (BuildContext context) => WrapDemo()),
    Page(
        title: 'ListBody',
        subhead: '一个沿着一个给定的轴，顺序排列子元素的部件。',
        icon: null,
        category: _kLayout,
        routeName: ListBodyDemo.routeName,
        buildRoute: (BuildContext context) => ListBodyDemo()),
    Page(
        title: 'ListView',
        subhead: '可滚动的列表部件。',
        icon: null,
        category: _kLayout,
        routeName: ListViewDemo.routeName,
        buildRoute: (BuildContext context) => ListViewDemo()),
    Page(
        title: 'CustomMultiChildLayout',
        subhead: '使用一个委托来对多个孩子进行设置大小和定位的小部件。',
        icon: null,
        category: _kLayout,
        routeName: CustomMultiChildLayoutDemo.routeName,
        buildRoute: (BuildContext context) => CustomMultiChildLayoutDemo()),
    Page(
        title: 'LayoutBuilder',
        subhead: '构建一个可以依赖父窗口大小的部件树。',
        icon: null,
        category: _kLayout,
        routeName: LayoutBuilderDemo.routeName,
        buildRoute: (BuildContext context) => LayoutBuilderDemo()),

    ///Text
    Page(
        title: 'Text',
        subhead: '单一格式的文本。',
        icon: null,
        category: _kText,
        routeName: TextDemo.routeName,
        buildRoute: (BuildContext context) => TextDemo()),
    Page(
        title: 'RichText',
        subhead: '一个富文本Text，可以显示多种样式的text。',
        icon: null,
        category: _kText,
        routeName: RichTextDemo.routeName,
        buildRoute: (BuildContext context) => RichTextDemo()),
    Page(
        title: 'DefaultTextStyle',
        subhead: '文字样式，用于指定Text部件的文字样式。',
        icon: null,
        category: _kText,
        routeName: DefaultTextStyleDemo.routeName,
        buildRoute: (BuildContext context) => DefaultTextStyleDemo()),

    ///assets
    Page(
        title: 'RawImage',
        subhead: '一个直接显示dart:ui.Image的部件。',
        icon: null,
        category: _kAssertII,
        routeName: RawImageDemo.routeName,
        buildRoute: (BuildContext context) => RawImageDemo()),
    Page(
        title: 'AssetBundle',
        subhead: '应用程序使用的资源集合。',
        icon: null,
        category: _kAssertII,
        routeName: AssetBundleDemo.routeName,
        buildRoute: (BuildContext context) => AssetBundleDemo()),

    ///input
    Page(
        title: 'Form',
        subhead: '一个可选的、用于给多个TextField分组的部件。',
        icon: null,
        category: _kInput,
        routeName: FormDemo.routeName,
        buildRoute: (BuildContext context) => FormDemo()),
    Page(
        title: 'FormField',
        subhead: '一个单独的表单字段。',
        icon: null,
        category: _kInput,
        routeName: FormFieldDemo.routeName,
        buildRoute: (BuildContext context) => FormFieldDemo()),
    Page(
        title: 'RawKeyboardListener',
        subhead: '用户按下或释放键盘上的键时调用回调的部件。',
        icon: null,
        category: _kInput,
        routeName: RawKeyboardListenerDemo.routeName,
        buildRoute: (BuildContext context) => RawKeyboardListenerDemo()),

    ///Animated
    Page(
        title: 'AnimatedContainer',
        subhead: '在一段时间内逐渐改变其值的容器。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedContainerDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedContainerDemo()),
    Page(
        title: 'AnimatedCrossFade',
        subhead: '在两个子部件之间交叉淡入，并同时调整他们的尺寸。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedCrossFadeDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedCrossFadeDemo()),
    Page(
        title: 'Hero',
        subhead: '将其子项标记为hero动画候选的部件。',
        icon: null,
        category: _kAnimation,
        routeName: HeroDemo.routeName,
        buildRoute: (BuildContext context) => HeroDemo()),
    Page(
        title: 'AnimatedBuilder',
        subhead: '用于构建动画的通用小部件',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedBuilderDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedBuilderDemo()),
    Page(
        title: 'DecoratedBoxTransition',
        subhead: '可以给它的Decoration不同属性使用动画。',
        icon: null,
        category: _kAnimation,
        routeName: DecoratedBoxTransitionDemo.routeName,
        buildRoute: (BuildContext context) => DecoratedBoxTransitionDemo()),
    Page(
        title: 'FadeTransition',
        subhead: '对子项使用透明度动画。',
        icon: null,
        category: _kAnimation,
        routeName: FadeTransitionDemo.routeName,
        buildRoute: (BuildContext context) => FadeTransitionDemo()),
    Page(
        title: 'PositionedTransition',
        subhead: '可以给它的Positioned不同属性使用动画，需要起始位置和结束位置。',
        icon: null,
        category: _kAnimation,
        routeName: PositionedTransitionDemo.routeName,
        buildRoute: (BuildContext context) => PositionedTransitionDemo()),
    Page(
        title: 'RotationTransition',
        subhead: '对子项使用旋转动画。',
        icon: null,
        category: _kAnimation,
        routeName: RotationTransitionDemo.routeName,
        buildRoute: (BuildContext context) => RotationTransitionDemo()),
    Page(
        title: 'ScaleTransition',
        subhead: '对子项使用缩放动画。',
        icon: null,
        category: _kAnimation,
        routeName: ScaleTransitionDemo.routeName,
        buildRoute: (BuildContext context) => ScaleTransitionDemo()),
    Page(
        title: 'SizeTransition',
        subhead: '动画自己的大小和剪辑，并对齐子项。',
        icon: null,
        category: _kAnimation,
        routeName: SizeTransitionDemo.routeName,
        buildRoute: (BuildContext context) => SizeTransitionDemo()),
    Page(
        title: 'SlideTransition',
        subhead: '对相对于其正常位置的某个位置之间使用动画。',
        icon: null,
        category: _kAnimation,
        routeName: SlideTransitionDemo.routeName,
        buildRoute: (BuildContext context) => SlideTransitionDemo()),
    Page(
        title: 'AnimatedDefaultTextStyle',
        subhead: '在文本样式切换时使用动画。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedDefaultTextStyleDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedDefaultTextStyleDemo()),
    Page(
        title: 'AnimatedListState',
        subhead: '动画列表的state。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedListStateDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedListStateDemo()),
    Page(
        title: 'AnimatedModalBarrier',
        subhead: '一个阻止用户与widget交互的部件。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedModalBarrierDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedModalBarrierDemo()),
    Page(
        title: 'AnimatedOpacity',
        subhead: '对子项使用透明度动画。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedOpacityDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedOpacityDemo()),
    Page(
        title: 'AnimatedPhysicalModel',
        subhead: 'PhysicalModel的动画版本.',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedPhysicalModelDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedPhysicalModelDemo()),
    Page(
        title: 'AnimatedPositioned',
        subhead: '当给定位置的变化，自动在给定的时间内转换孩子位置的部件。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedPositionedDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedPositionedDemo()),
    Page(
        title: 'AnimatedSize',
        subhead: '当给定的孩子的大小变化时，它自动地在给定时间内转换它大小的部件。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedSizeDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedSizeDemo()),
    Page(
        title: 'AnimatedWidget',
        subhead: '当给定的Listenable改变值时，会重新构建该widget。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedWidgetDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedWidgetDemo()),
    Page(
        title: 'AnimatedWidgetBaseState',
        subhead: '具有隐式动画的部件的基类。',
        icon: null,
        category: _kAnimation,
        routeName: AnimatedWidgetBaseStateDemo.routeName,
        buildRoute: (BuildContext context) => AnimatedWidgetBaseStateDemo()),

    ///interaction
    Page(
        title: 'LongPressDraggable',
        subhead: '可以使其子部件在长按时可拖动。',
        icon: null,
        category: _kInteraction,
        routeName: LongPressDraggableDemo.routeName,
        buildRoute: (BuildContext context) => LongPressDraggableDemo()),
    Page(
        title: 'GestureDetector',
        subhead: '一个检测手势的部件。',
        icon: null,
        category: _kInteraction,
        routeName: GestureDetectorDemo.routeName,
        buildRoute: (BuildContext context) => GestureDetectorDemo()),
    Page(
        title: 'DragTarget',
        subhead: '一个拖动的目标部件，在完成拖动时它可以接收数据。',
        icon: null,
        category: _kInteraction,
        routeName: DragTargetDemo.routeName,
        buildRoute: (BuildContext context) => DragTargetDemo()),
    Page(
        title: 'Dismissible',
        subhead: '可以在拖动时隐藏的部件。',
        icon: null,
        category: _kInteraction,
        routeName: DismissibleDemo.routeName,
        buildRoute: (BuildContext context) => DismissibleDemo()),
    Page(
        title: 'IgnorePointer',
        subhead: '在hit test不可见，当ignore为true，此部件不响应事件。',
        icon: null,
        category: _kInteraction,
        routeName: IgnorePointerDemo.routeName,
        buildRoute: (BuildContext context) => IgnorePointerDemo()),
    Page(
        title: 'AbsorbPointer',
        subhead: '在hit test拦截事件，当absorbing为true时，此小部件阻止其子树通过终止命中测试来接收指针事件。。',
        icon: null,
        category: _kInteraction,
        routeName: AbsorbPointerDemo.routeName,
        buildRoute: (BuildContext context) => AbsorbPointerDemo()),
    Page(
        title: 'Navigator',
        subhead: '导航器，可以在多个页面(路由)栈之间跳转。',
        icon: null,
        category: _kInteraction,
        routeName: NavigatorDemo.routeName,
        buildRoute: (BuildContext context) => NavigatorDemo()),
    Page(
        title: 'Scrollable',
        subhead: '实现了可滚动widget的交互模型，但不包含UI显示相关的逻辑。',
        icon: null,
        category: _kInteraction,
        routeName: ScrollableDemo.routeName,
        buildRoute: (BuildContext context) => ScrollableDemo()),

    ///Styling
    Page(
        title: 'Padding',
        subhead: '一个会给其子部件添加指定填充的部件。',
        icon: null,
        category: _kStyling,
        routeName: PaddingDemo.routeName,
        buildRoute: (BuildContext context) => PaddingDemo()),
    Page(
        title: 'Theme',
        subhead: '将主题应用于子部件。主题描述了应用选择的颜色和字体。',
        icon: null,
        category: _kStyling,
        routeName: ThemeDemo.routeName,
        buildRoute: (BuildContext context) => ThemeDemo()),
    Page(
        title: 'MediaQuery',
        subhead: '建立一个子树，在树中媒体查询解析不同的给定数据。',
        icon: null,
        category: _kStyling,
        routeName: MediaQueryDemo.routeName,
        buildRoute: (BuildContext context) => MediaQueryDemo()),

    ///painting
    Page(
        title: 'Opacity',
        subhead: '使其子widget透明的部件。',
        icon: null,
        category: _kPainting,
        routeName: OpacityDemo.routeName,
        buildRoute: (BuildContext context) => OpacityDemo()),
    Page(
        title: 'Transform',
        subhead: '在绘制子部件之前应用转换的部件。',
        icon: null,
        category: _kPainting,
        routeName: TransformDemo.routeName,
        buildRoute: (BuildContext context) => TransformDemo()),
    Page(
        title: 'DecoratedBox',
        subhead: '在孩子绘制之前或之后绘制装饰的部件。',
        icon: null,
        category: _kPainting,
        routeName: DecoratedBoxDemo.routeName,
        buildRoute: (BuildContext context) => DecoratedBoxDemo()),
    Page(
        title: 'FractionalTranslation',
        subhead: '绘制盒子之前给其添加一个偏移转换。',
        icon: null,
        category: _kPainting,
        routeName: FractionalTranslationDemo.routeName,
        buildRoute: (BuildContext context) => FractionalTranslationDemo()),
    Page(
        title: 'RotatedBox',
        subhead: '可以延顺时针以90度的倍数旋转其子部件。',
        icon: null,
        category: _kPainting,
        routeName: RotatedBoxDemo.routeName,
        buildRoute: (BuildContext context) => RotatedBoxDemo()),
    Page(
        title: 'ClipOval',
        subhead: '用椭圆剪辑其子项的部件。',
        icon: null,
        category: _kPainting,
        routeName: ClipOvalDemo.routeName,
        buildRoute: (BuildContext context) => ClipOvalDemo()),
    Page(
        title: 'ClipPath',
        subhead: '用path剪辑其子项的部件。',
        icon: null,
        category: _kPainting,
        routeName: ClipPathDemo.routeName,
        buildRoute: (BuildContext context) => ClipPathDemo()),
    Page(
        title: 'ClipRect',
        subhead: '用矩形剪辑其子项的部件。',
        icon: null,
        category: _kPainting,
        routeName: ClipRectDemo.routeName,
        buildRoute: (BuildContext context) => ClipRectDemo()),
    Page(
        title: 'CustomPaint',
        subhead: '提供画布，用于绘制自定义的图形。',
        icon: null,
        category: _kPainting,
        routeName: CustomPaintDemo.routeName,
        buildRoute: (BuildContext context) => CustomPaintDemo()),
    Page(
        title: 'BackdropFilter',
        subhead: '过滤应用现有的绘图内容，然后绘制子项。',
        icon: null,
        category: _kPainting,
        routeName: BackdropFilterDemo.routeName,
        buildRoute: (BuildContext context) => BackdropFilterDemo()),

    ///async
    Page(
        title: 'FutureBuilder',
        subhead: '基于交互来构建自身的部件。',
        icon: null,
        category: _kAsync,
        routeName: FutureBuilderDemo.routeName,
        buildRoute: (BuildContext context) => FutureBuilderDemo()),
    Page(
        title: 'StreamBuilder',
        subhead: '基于数据流交互来构建自身的部件。',
        icon: null,
        category: _kAsync,
        routeName: StreamBuilderDemo.routeName,
        buildRoute: (BuildContext context) => StreamBuilderDemo()),

    ///scrolling
    Page(
        title: 'ListView',
        subhead: '一个可滚动的列表。',
        icon: null,
        category: _kScrolling,
        routeName: ListViewDemo.routeName,
        buildRoute: (BuildContext context) => ListViewDemo()),
    Page(
        title: 'NestedScrollView',
        subhead: '一个可以嵌套其它可滚动部件的部件。',
        icon: null,
        category: _kScrolling,
        routeName: NestedScrollViewDemo.routeName,
        buildRoute: (BuildContext context) => NestedScrollViewDemo()),
    Page(
        title: 'GridView',
        subhead: '一个可滚动的二维空间数组。',
        icon: null,
        category: _kScrolling,
        routeName: GridViewDemo.routeName,
        buildRoute: (BuildContext context) => GridViewDemo()),
    Page(
        title: 'SingleChildScrollView',
        subhead: '只能有一个子项的可滚动的部件，子项内容超过父容器时可以滚动。',
        icon: null,
        category: _kScrolling,
        routeName: ListViewDemo.routeName,
        buildRoute: (BuildContext context) => ListViewDemo()),
    Page(
        title: 'Scrollable',
        subhead: '实现了可滚动部件的交互模型，但不包含UI显示相关的逻辑。',
        icon: null,
        category: _kScrolling,
        routeName: ScrollableDemo.routeName,
        buildRoute: (BuildContext context) => ScrollableDemo()),
    Page(
        title: 'Scrollbar',
        subhead: '一个Material Design滚动条，表示当前滚动到了什么位置。',
        icon: null,
        category: _kScrolling,
        routeName: ScrollbarDemo.routeName,
        buildRoute: (BuildContext context) => ScrollbarDemo()),
    Page(
        title: 'CustomScrollView',
        subhead: '一个使用slivers创建自定义的滚动效果的ScrollView。',
        icon: null,
        category: _kScrolling,
        routeName: CustomScrollViewDemo.routeName,
        buildRoute: (BuildContext context) => CustomScrollViewDemo()),
    Page(
        title: 'NotificationListener',
        subhead: '一个用来监听树上冒泡通知的子项。',
        icon: null,
        category: _kScrolling,
        routeName: NotificationListenerDemo.routeName,
        buildRoute: (BuildContext context) => NotificationListenerDemo()),
    Page(
        title: 'ScrollConfiguration',
        subhead: '控制可滚动组件在子树中的表现行为。',
        icon: null,
        category: _kScrolling,
        routeName: ScrollConfigurationDemo.routeName,
        buildRoute: (BuildContext context) => ScrollConfigurationDemo()),
    Page(
        title: 'RefreshIndicator',
        subhead: 'Material Design下拉刷新指示器，包装一个可滚动部件。',
        icon: null,
        category: _kScrolling,
        routeName: RefreshIndicatorDemo.routeName,
        buildRoute: (BuildContext context) => RefreshIndicatorDemo()),

    ///access
    Page(
        title: 'Semantics',
        subhead: '用于描述部件树的具体语义。使用辅助工具、搜索引擎和其他语义分析软件来确定应用程序的含义。',
        icon: null,
        category: _kAccess,
        routeName: SemanticsDemo.routeName,
        buildRoute: (BuildContext context) => SemanticsDemo()),
    Page(
        title: 'MergeSemantics',
        subhead: '合并其后代语义。',
        icon: null,
        category: _kAccess,
        routeName: MergeSemanticsDemo.routeName,
        buildRoute: (BuildContext context) => MergeSemanticsDemo()),
    Page(
        title: 'ExcludeSemantics',
        subhead: '删除其后代所有语义。',
        icon: null,
        category: _kAccess,
        routeName: ExcludeSemanticsDemo.routeName,
        buildRoute: (BuildContext context) => ExcludeSemanticsDemo()),

    ///network
    Page(
        title: '网络',
        subhead: '待添加',
        icon: null,
        category: _kNetWork,
        routeName: Temp.routeName,
        buildRoute: (BuildContext context) => Temp()),

    ///design
    Page(
        title: '设计',
        subhead: '待添加',
        icon: null,
        category: _kdesign,
        routeName: Temp.routeName,
        buildRoute: (BuildContext context) => Temp()),

    ///design
    Page(
        title: '设备',
        subhead: '待添加',
        icon: null,
        category: _kdevice,
        routeName: Temp.routeName,
        buildRoute: (BuildContext context) => Temp()),
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
