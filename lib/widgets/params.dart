import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Value<T> {
  final String name;
  final String label;
  final T value;

  const Value({this.name, this.value, this.label});

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    Value typeOther = other;
    return typeOther.label == label && typeOther.name == name;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => hashValues(name, label);
}

class StringParams {
  static final String kAlignment = 'Alignment(对齐)';
  static final String kColor = 'Color(颜色)';
  static final String kPadding = 'Padding(内边距)';
  static final String kDecoration = 'Decoration(装饰)';
  static final String kForegroundDecoration = 'ForegroundDecoration(前景装饰)';
  static final String kMargin = 'Margin(外边距)';
  static final String kTransform = 'transform(绘制之前转换)';

  static final String kMainAxisAlignment = 'MainAxisAlignment(主轴对齐)';
  static final String kMainAxisSize = 'MainAxisSize(主轴尺寸)';
  static final String kCrossAxisAlignment = 'CrossAxisAlignment(横轴对齐)';
  static final String kTextDirection = 'TextDirection(文本方向)';
  static final String kVerticalDirection = 'VerticalDirection(垂直方向)';
  static final String kTextBaseline = 'TextBaseline(文本基线)';
  static final String kBaseline = 'Baseline(基线)';
  static final String kBaselineType = 'BaselineType(基线类型)';

  static final String kImage = 'Image(图片)';
  static final String kColorBlendMode = 'ColorBlendMode(颜色混合模式)';
  static final String kFit = 'Fit(适配)';
  static final String kRepeat = 'Repeat(重复)';
  static final String kCenterSlice = 'CenterSlice(中心区域裁剪)';
  static final String kMatchTextDirection = 'MatchTextDirection(匹配文本方向)';
  static final String kGaplessPlayback = 'GaplessPlayback(图片改变使用旧图片)';

  static final String kStyle = 'Style(样式)';
  static final String kTextAlign = 'TextAlign(文本对齐)';
  static final String kSoftWrap = 'SoftWrap(自动换行,如果超出屏幕)';
  static final String kOverflow = 'Overflow(处理文本溢出)';
  static final String kTextScaleFactor = 'TextScaleFactor(文本比例)';
  static final String kMaxLines = 'MaxLines(最大行数)';
  static final String kInherit = 'Inherit';
  static final String kFontSize = 'FontSize(字体大小)';
  static final String kFontWeight = 'FontWeight(字体粗细)';
  static final String kFontStyle = 'FontStyle(字体样式)';
  static final String kLetterSpacing = 'LetterSpacing(字母间距)';
  static final String kWordSpacing = 'WordSpacing（单词间距）';
  static final String kBackground = 'Background(背景)';
  static final String kBackgroundColor = 'BackgroundColor(背景颜色)';
  static final String kTextDecoration = 'Decoration(文本装饰)';
  static final String kDecorationColor = 'DecorationColor(装饰颜色)';
  static final String kDecorationStyle = 'DecorationStyle(文本装饰样式)';
  static final String kSize = 'Size(大小)';

  static final String konPressed = 'onPressed(点击)';
  static final String kTextTheme = 'TextTheme(文本主题)';
  static final String kTextColor = 'TextColor(文本颜色)';
  static final String kDisabledTextColor = 'DisabledTextColor(不可用文本颜色)';
  static final String kDisabledColor = 'DisabledColor(不可用颜色)';
  static final String kHighlightColor = 'HighlightColor(高亮颜色)';
  static final String kSplashColor = 'SplashColor(圆形扩展颜色)';
  static final String kBrightness = 'Brightness(亮度)';
  static final String kColorBrightness = 'ColorBrightness(色彩亮度)';
  static final String kElevation = 'Elevation(高度)';
  static final String kDisabledElevation = 'DisabledElevation(不可用高度)';
  static final String kTextHighlightElevationColor = 'HighlightElevation(高亮高度)';
  static final String kShape = 'Shape(形状)';
  static final String kAnimationDuration = 'AnimationDuration(动画持续时间)';
  static final String kDuration = 'Duration(持续时间)';

  static final String kAppBar = 'AppBar(导航栏)';
  static final String kFloatingActionButton = 'FloatingActionButton(浮动操作按钮)';
  static final String kFloatingActionButtonLocation =
      'FloatingActionButtonLocation(浮动操作按钮位置)';
  static final String kFloatingActionButtonAnimator =
      'FloatingActionButtonAnimator(浮动操作按钮动画)';
  static final String kDrawer = 'Drawer(抽屉)';
  static final String kEndDrawer = 'EndDrawer(右抽屉)';
  static final String kBottomNavigationBar = 'BottomNavigationBar(底部导航栏)';
  static final String kResizeToAvoidBottomPadding =
      'ResizeToAvoidBottomPadding\n(调整大小防止底部填充)';
  static final String kPrimary = 'Primary(_)';

  static final String kLeading = 'Leading(导航栏首位)';
  static final String kAutomaticallyImplyLeading =
      'automaticallyImplyLeading(自动添加leading)';
  static final String kTitle = 'title(标题)';
  static final String kActions = 'Actions(操作)';
  static final String kFlexibleSpace = 'FlexibleSpace(弹性空间)';
  static final String kBottom = 'bottom(底部栏)';
  static final String kIconTheme = 'iconTheme(图标主题)';
  static final String kCenterTitle = 'centerTitle(中心标题)';
  static final String kTitleSpacing = 'titleSpacing(标题间距)';
  static final String kToolbarOpacity = 'toolbarOpacity(工具栏不透明度)';
  static final String kBottomOpacity = 'bottomOpacity(底部栏栏不透明度)';
  static final String kOpacity = 'Opacity(不透明度)';

  static final String kColors = 'Colors(调色板)';
  static final String kCurve = 'Curve(动画曲线)';

  static final String kStrokeWidth = 'StrokeWidth(笔画宽度)';
  static final String kFallbackWidth = 'FallbackWidth(后退宽度)';
  static final String kFallbackHeight = 'FallbackHeight(后退高度)';

  static final String kSave = 'Save(from scaffold)';
  static final String kType = 'Type(类型)';
  static final String kIconSize = 'IconSize(图标大小)';

  static final String kItems = 'Items(子项)';

  static final String kTabs = 'Tabs(标签)';
  static final String kIsScrollable = 'IsScrollable(可滚动)';
  static final String kIndicator = 'Indicator(指示器)';
  static final String kIndicatorColor = 'IndicatorColor(指示器颜色)';
  static final String kIndicatorSize = 'IndicatorSize(指示器大小)';
  static final String kIndicatorWeight = 'IndicatorWeight(指示器权重)';
  static final String kIndicatorPadding = 'IndicatorPadding(指示器内边距)';
  static final String kLabelStyle = 'LabelStyle(标签样式)';
  static final String kLabelColor = 'LabelColor(标签颜色)';
  static final String kUnselectedLabelStyle = 'UnselectedLabelStyle(未选中标签样式)';
  static final String kUnselectedLabelColor = 'UnselectedLabelColor(未选中标签颜色)';

  static final String kPhysics = 'Physics(物理响应)';
  static final String kDrawerHeader = 'DrawerHeader(侧滑栏头部)';

  static final String kMini = 'Mini(迷你)';
  static final String kIsExtended = 'IsExtended(是否扩展)';
  static final String kTooltip = 'Tooltip(工具提示)';
  static final String kForegroundColor = 'ForegroundColor(前景颜色)';
  static final String kHighlightElevation = 'HighlightElevation(高亮高度)';
  static final String kNotchMargin = 'NotchMargin(切口边缘)';

  static final String kItemBuilder = 'ItemBuilder(选项建造者)';
  static final String kChildren = 'Children(孩子)';

  static final String kFixedColor = 'FixedColor(固定类型时的颜色)';
  static final String kIcon = 'Icon(图标)';
  static final String kContentPadding = 'ContentPadding(内容内边距)';
  static final String kBorder = 'Border(边界)';
  static final String kEnabled = 'Enabled(启用)';
  static final String kIsDense = 'IsDense(是否密集)';
  static final String kFillColor = 'FillColor(填充颜色)';
  static final String kFilled = 'Filled(填充)';
  static final String kHintText = 'HintText(提示文本)';
  static final String kHintStyle = 'HintStyle(提示文本样式)';
  static final String kLabelText = 'LabelText(标签文本)';
  static final String kHelperText = 'HelperText(辅助文本)';
  static final String kHelperStyle = 'HelperStyle(辅助文本样式)';
  static final String kErrorText = 'ErrorText(错误文本)';
  static final String kErrorStyle = 'ErrorStyle(错误文本样式)';
  static final String kErrorMaxLines = 'ErrorMaxLines(错误文本最大行数)';
  static final String kCounterText = 'CounterText(反文本)';
  static final String kCounterStyle = 'CounterStyle(反文本样式)';
  static final String kPrefixIcon = 'PrefixIcon(前缀图标)';
  static final String kPrefixText = 'PrefixText(前缀文本)';
  static final String kPrefixStyle = 'PrefixStyle(前缀文本样式)';

  static final String kSuffixIcon = 'SuffixIcon(后缀图标)';
  static final String kSuffixText = 'SuffixText(后缀文本)';
  static final String kSuffixStyle = 'SuffixStyle(后缀文本样式)';

  static final String kKeyboardType = 'KeyboardType(键盘类型)';
  static final String kInputFormatters = 'InputFormatters(输入格式化)';
  static final String kAutoFocus = 'AutoFocus(自动聚焦)';
  static final String kAutoCorrect = 'AutoCorrect(自动校正)';
  static final String kObscureText = 'ObscureText(模糊文本)';
  static final String kMaxLengthEnforced = 'MaxLengthEnforced(最大长度限制)';
  static final String kMaxLength = 'MaxLength(最大长度)';
  static final String kActiveColor = 'ActiveColor(激活颜色)';
  static final String kInActiveColor = 'InActiveColor(未激活颜色)';

  static final String kValue = 'Value(值)';
  static final String kGroupValue = 'GroupValue(群值)';

  static final String kTristate = 'Tristate(三态true,false,null)';

  static final String kActiveTrackColor = 'ActiveTrackColor(激活轨迹颜色)';
  static final String kActiveThumbImage = 'ActiveThumbImage(激活滑块图片)';
  static final String kInActiveThumbColor = 'InActiveThumbColor(未激活滑块颜色)';
  static final String kInActiveTrackColor = 'InActiveTrackColor(未激活轨迹颜色)';
  static final String kInActiveThumbImage = 'InActiveThumbImage(未激活滑块图片)';

  static final String kDivisions = 'Divisions(划分)';
  static final String kMin = 'Min(最小值)';
  static final String kMax = 'Max(最大值)';

  static final String kChangeToTimePickers = '日期选择器/时间选择器';
  static final String kInitialTime = 'InitialTime(初始时间)';
  static final String kInitialDate = 'InitialDate(初始日期)';
  static final String kFirstDate = 'FirstDate(起始日期)';
  static final String kLastDate = 'LastDate(最后日期)';
  static final String kInitialDatePickerMode = 'InitialDatePickerMode(初始日期选择器)';
  static final String kTitlePadding = 'TitlePadding(标题内边距)';

  static final String kContent = 'Content(内容)';
  static final String kBarrierDismissible = 'BarrierDismissible(点外部可取消)';
  static final String kLowerBound = 'LowerBound(下限)';
  static final String kUpperBound = 'UpperBound(上限)';
  static final String kIsExpanded = 'IsExpanded(是否膨胀)';
  static final String kDeleteIconColor = 'DeleteIconColor(删除图标颜色)';
  static final String kMaterialTapTargetSize = 'MaterialTapTargetSize(物料目标尺寸)';
  static final String kDeleteIcon = 'DeleteIcon(删除图标)';
  static final String kLabelPadding = 'LabelPadding(标签内边距)';
  static final String kAvatar = 'Avatar(头像)';
  static final String kDeleteButtonTooltipMessage =
      'DeleteButtonTooltipMessage\n(删除按钮提示信息)';
  static final String kHeight = "Height(高度)";
  static final String kVerticalOffset = 'VerticalOffset(垂直偏移)';
  static final String kPreferBelow = 'PreferBelow(位于下面)';
  static final String kExcludeFromSemantics = 'ExcludeFromSemantics(排除语义)';
  static final String kSemanticContainer = 'SemanticContainer(语义容器)';
  static final String kDense = 'Dense(密集的)';
  static final String kSelected = 'elected(选中的)';

  static final String kIndent = 'Indent(缩进)';
  static final String kIsThreeLine = 'IsThreeLine(三线)';
  static final String kRadius = 'Radius(半径)';
  static final String kAnimating = 'Animating(支持动画)';
  static final String kMinSize = 'MinSize(最小尺寸)';
  static final String kPressedOpacity = 'PressedOpacity（按下不透明度）';
  static final String kIsDefaultAction = 'IsDefaultAction(为默认按钮)';
  static final String kIsDestructiveAction = 'IsDestructiveAction(为删除按钮)';

  static final String kOnDeleted = 'OnDeleted(删除监听)';

  static final String kLinearTransition = 'LinearTransition(线性过渡)';

  static final String kMiddle = 'Middle(中间)';

  static final String kActionsForegroundColor =
      'ActionsForegroundColor(动作前景颜色)';

  static final String kNavigationBar = 'NavigationBar(导航栏)';

  static final String kWidthFactor = 'WidthFactor(宽度比例)';
  static final String kHeightFactor = 'HeightFactor(高度比例)';

  static final String kAspectRatio = 'AspectRatio(纵横比)';

  static final String kStepWidth = 'StepWidth(阶梯宽度)';
  static final String kStepHeight = 'StepHeight(阶梯高度)';

  static final String kMaxHeight = 'MaxHeight(最大高度)';
  static final String kMinHeight = 'MinHeight(最小高度)';

  static final String kMaxWidth = 'MaxWidth(最大宽度)';
  static final String kMinWidth = 'MinWidth(最小宽度)';

  static final String kWidth = 'Width(宽度)';

  static final String kOffstage = 'Offstage(舞台外)';

  static final String kConstraints = 'Constraints(约束条件)';

  static final String kTransformHitTests = 'TransformHitTests(变换测试)';

  static final String kOrigin = 'Origin(原点)';

  static final String kIndex = 'Index(索引)';

  static final String kSizing = 'Sizing(尺寸)';

  static final String kDefaultVerticalAlignment =
      'DefaultVerticalAlignment(默认垂直对齐)';

  static final String kDefaultColumnWidth = 'defaultColumnWidth(默认栏宽)';

  static final String kDirection ='Direction(方向)';

  static final String kRunAlignment ='RunAlignment(运行对准)';
  static final String kRunSpacing = 'RunSpacing(跑道间距)';
  static final String kSpecing = 'Spacing(间距)';
  static final String kMainAxis = 'MainAxis（主轴）';

  static final kReverse = 'Reverse(反向)';

  static final String kScrollDirection = 'ScrollDirection(滚动方向)';

  static final String kShrinkWrap ='ShrinkWrap(收缩)';
  static final String kAddAutomaticKeepAlives ='AddAutomaticKeepAlives(添加自动保存别名)';
  static final String kAddRepaintBoundaries ='AddRepaintBoundaries(添加重新绘制边界)';

  static final String kItemExtent = 'ItemExtent(项目范围)';
  static final String kCacheExtent = 'CacheExtent(缓存范围)';

  static final String kAutovalidate = 'Autovalidate(自动校验)';

  static final String kFirstCurve = 'FirstCurve(第一个动画曲线)';
  static final String kSecondCurve = 'SecondCurve(第二个动画曲线)';
  static final String kSizeCurve = 'SizeCurve(尺寸动画曲线)';

  static final String kCrossFadeState ='CrossFadeState(交叉状态)';

  static final String kPosition = 'Position(位置)';

  static final String kAlwaysIncludeSemantics = 'AlwaysIncludeSemantics(总是包含语义)';


}

const List<Value<AlignmentGeometry>> alignmentValues = [
  const Value(
    name: 'topLeft',
    value: Alignment.topLeft,
    label: 'Alignment.topLeft',
  ),
  const Value(
    name: 'topCenter',
    value: Alignment.topCenter,
    label: 'Alignment.topCenter',
  ),
  const Value(
    name: 'topRight',
    value: Alignment.topRight,
    label: 'Alignment.topRight',
  ),
  const Value(
    name: 'centerLeft',
    value: Alignment.centerLeft,
    label: 'Alignment.centerLeft',
  ),
  const Value(
    name: 'center',
    value: Alignment.center,
    label: 'Alignment.center',
  ),
  const Value(
    name: 'centerRight',
    value: Alignment.centerRight,
    label: 'Alignment.centerRight',
  ),
  const Value(
    name: 'bottomLeft',
    value: Alignment.bottomLeft,
    label: 'Alignment.bottomLeft',
  ),
  const Value(
    name: 'bottomCenter',
    value: Alignment.bottomCenter,
    label: 'Alignment.bottomCenter',
  ),
  const Value(
    name: 'bottomRight',
    value: Alignment.bottomRight,
    label: 'Alignment.bottomRight',
  ),
];

const List<Value<EdgeInsetsGeometry>> paddingValues = [
  const Value(
      name: 'EdgeInsets.fromLTRB',
      value: const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0),
      label: 'const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 50.0)'),
  const Value(
      name: 'EdgeInsets.symmetric',
      value: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      label: 'const EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0)'),
  const Value(
      name: 'EdgeInsets.all',
      value: const EdgeInsets.all(20.0),
      label: 'const EdgeInsets.all(20.0)'),
  const Value(
      name: 'EdgeInsets.only',
      value: const EdgeInsets.only(top: 30.0),
      label: 'const EdgeInsets.only(top: 30.0)'),
];

const List<Value<Color>> colorValues = [
  const Value(
    name: 'white',
    value: Colors.white,
    label: 'Colors.white',
  ),
  const Value(
    name: 'red',
    value: Colors.red,
    label: 'Colors.red',
  ),
  const Value(
    name: 'orangeAccent',
    value: Colors.orangeAccent,
    label: 'Colors.orangeAccent',
  ),
  const Value(
    name: 'yellow',
    value: Colors.yellow,
    label: 'Colors.yellow',
  ),
  const Value(
    name: 'green',
    value: Colors.green,
    label: 'Colors.green',
  ),
  const Value(
    name: 'cyan',
    value: Colors.cyan,
    label: 'Colors.cyan',
  ),
  const Value(
    name: 'blue',
    value: Colors.blue,
    label: 'Colors.blue',
  ),
  const Value(
    name: 'purple',
    value: Colors.purple,
    label: 'Colors.purple',
  ),
  const Value(
    name: 'pink',
    value: Colors.pink,
    label: 'Colors.pink',
  ),
  const Value(
    name: 'transparent',
    value: Colors.transparent,
    label: 'Colors.transparent',
  ),
];

List<Value<Decoration>> decorationValues = [
  const Value(
    name: 'BoxDecoration.color',
    value: BoxDecoration(color: Colors.green),
    label: 'BoxDecoration(color: Colors.green)',
  ),
  const Value(
    name: 'BoxDecoration.borderRadius',
    value: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    label: '''BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.all(Radius.circular(32.0)))''',
  ),
  const Value(
    name: 'BoxDecoration.boxShadow',
    value: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.purple,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.red,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ]),
    label: '''BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.purple,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.red,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ])''',
  ),
  Value(
    name: 'BoxDecoration.border',
    value: BoxDecoration(
      border: Border.all(color: Colors.green, width: 2.0),
    ),
    label: '''BoxDecoration(
      border: Border.all(color: Colors.green,width: 2.0),
    )''',
  ),
  Value(
    name: 'BoxDecoration.gradient',
    value: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.lightGreen,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    label: '''BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.lightGreen,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    )''',
  ),
  Value(
    name: 'BoxDecoration.image',
    value: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('images/burgers.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    label: '''DecorationImage(
          image: ExactAssetImage('images/burgers.jpg'),
          fit: BoxFit.cover,
        )''',
  ),
];

List<Value<Decoration>> foregroundDecorationValues = [
  const Value(
      name: 'BoxDecoration.color',
      value: BoxDecoration(color: Colors.blue),
      label: 'BoxDecoration(color: Colors.blue)'),
  const Value(
    name: 'BoxDecoration.borderRadius',
    value: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(64.0))),
    label: '''BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.all(Radius.circular(64.0)))''',
  ),
  const Value(
    name: 'BoxDecoration.BoxShadow',
    value: BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.orangeAccent,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.yellow,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ]),
    label: '''BoxDecoration(boxShadow: [
      BoxShadow(
          color: Colors.orangeAccent,
          offset: Offset(5.0, 10.0),
          blurRadius: 3.0,
          spreadRadius: 3.0),
      BoxShadow(
          color: Colors.yellow,
          offset: Offset(10.0, 5.0),
          blurRadius: 3.0,
          spreadRadius: 4.0),
    ])''',
  ),
  Value(
    name: 'BoxDecoration.border',
    value: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2.0),
    ),
    label: '''BoxDecoration(
      border: Border.all(color: Colors.blue,width: 2.0),
    ),''',
  ),
  Value(
    name: 'BoxDecoration.LinearGradient',
    value: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.red,
          Colors.purple,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    ),
    label: '''BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.red,
          Colors.purple,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ),
    )''',
  ),
  Value(
    name: 'BoxDecoration.image',
    value: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage('images/pazzer.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    label: '''DecorationImage(
          image: ExactAssetImage('images/pazzer.jpg'),
          fit: BoxFit.cover,
        )''',
  ),
];

const List<Value<EdgeInsetsGeometry>> marginValues = [
  const Value(
    name: 'EdgeInsets.fromLTRB',
    value: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
    label: 'const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0)',
  ),
  const Value(
    name: 'EdgeInsets.symmetric',
    value: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    label: 'const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0)',
  ),
  const Value(
    name: 'EdgeInsets.all',
    value: const EdgeInsets.all(10.0),
    label: 'const EdgeInsets.all(10.0)',
  ),
  const Value(
    name: 'EdgeInsets.only',
    value: const EdgeInsets.only(top: 10.0),
    label: 'const EdgeInsets.only(top: 10.0)',
  )
];

List<Value<Matrix4>> transformValues = [
  Value(
    name: 'Matrix4.diagonal3Values',
    value: Matrix4.diagonal3Values(5.0, 10.0, 20.0),
    label: 'Matrix4.diagonal3Values(5.0, 10.0, 20.0)',
  ),
  Value(
    name: 'Matrix4.rotationX',
    value: Matrix4.rotationX(20.0),
    label: 'Matrix4.rotationX(20.0)',
  ),
  Value(
    name: 'Matrix4.skewX',
    value: Matrix4.skewX(30.0),
    label: 'Matrix4.skewX(30.0)',
  ),
  Value(
    name: 'Matrix4.translationValues',
    value: Matrix4.translationValues(10.0, 20.0, 30.0),
    label: 'Matrix4.translationValues(10.0, 20.0, 30.0)',
  ),
];

const List<Value<MainAxisAlignment>> mainAxisAlignmentValues = [
  const Value(
    name: 'start',
    value: MainAxisAlignment.start,
    label: 'MainAxisAlignment.start',
  ),
  const Value(
    name: 'center',
    value: MainAxisAlignment.center,
    label: 'MainAxisAlignment.center',
  ),
  const Value(
    name: 'end',
    value: MainAxisAlignment.end,
    label: 'MainAxisAlignment.end',
  ),
  const Value(
    name: 'spaceEvenly',
    value: MainAxisAlignment.spaceEvenly,
    label: 'MainAxisAlignment.spaceEvenly',
  ),
  const Value(
    name: 'spaceBetween',
    value: MainAxisAlignment.spaceBetween,
    label: 'MainAxisAlignment.spaceBetween',
  ),
  const Value(
    name: 'spaceAround',
    value: MainAxisAlignment.spaceAround,
    label: 'MainAxisAlignment.spaceAround',
  ),
];

const List<Value<MainAxisSize>> mainAxisSizeValues = [
  Value(
    name: 'min',
    value: MainAxisSize.min,
    label: 'MainAxisSize.min',
  ),
  Value(
    name: 'max',
    value: MainAxisSize.max,
    label: 'MainAxisSize.max',
  ),
];

const List<Value<CrossAxisAlignment>> crossAxisAlignmentValues = [
  const Value(
    name: 'start',
    value: CrossAxisAlignment.start,
    label: 'CrossAxisAlignment.start',
  ),
  const Value(
    name: 'center',
    value: CrossAxisAlignment.center,
    label: 'CrossAxisAlignment.center',
  ),
  const Value(
    name: 'end',
    value: CrossAxisAlignment.end,
    label: 'CrossAxisAlignment.end',
  ),
  const Value(
    name: 'stretch',
    value: CrossAxisAlignment.stretch,
    label: 'CrossAxisAlignment.stretch',
  ),
  const Value(
    name: 'baseline',
    value: CrossAxisAlignment.baseline,
    label: 'CrossAxisAlignment.baseline',
  ),
];

const List<Value<TextDirection>> textDirectionValues = [
  Value(
    name: 'rtl(right-to-left从右往左)',
    value: TextDirection.rtl,
    label: 'TextDirection.rtl',
  ),
  Value(
    name: 'ltr(left-to-right从左往右)',
    value: TextDirection.ltr,
    label: 'TextDirection.ltr',
  ),
];

const List<Value<VerticalDirection>> verticalDirectionValues = [
  Value(
    name: 'down',
    value: VerticalDirection.down,
    label: 'VerticalDirection.down',
  ),
  Value(
    name: 'up',
    value: VerticalDirection.up,
    label: 'VerticalDirection.up',
  ),
];

const List<Value<TextBaseline>> TextBaselineValues = [
  Value(
    name: 'alphabetic(对齐字母字符底部)',
    value: TextBaseline.alphabetic,
    label: 'TextBaseline.alphabetic',
  ),
  Value(
    name: 'ideographic(对齐表意字符底部)',
    value: TextBaseline.ideographic,
    label: 'TextBaseline.ideographic',
  ),
];

const List<Value<ImageProvider>> imageValues = [
  Value(
    name: 'Assert.burgers',
    value: AssetImage('images/burgers.jpg'),
    label: "AssetImage('images/burgers.jpg')",
  ),
  Value(
    name: 'Assert.pazzer',
    value: AssetImage('images/pazzer.jpg'),
    label: "AssetImage('images/pazzer.jpg')",
  ),
  Value(
    name: 'Assert.chewCrispyChicken',
    value: AssetImage('images/chewCrispyChicken.9.jpg'),
    label: "AssetImage('images/chewCrispyChicken.9.jpg')",
  ),
  Value(
    name: 'Network.image',
    value: NetworkImage(
        'https://cdn.cnn.com/cnnnext/dam/assets/171027052520-processed-foods-exlarge-tease.jpg'),
    label:
        "NetworkImage('https://cdn.cnn.com/cnnnext/dam/assets/171027052520-processed-foods-exlarge-tease.jpg')",
  ),
];

const List<Value<ImageRepeat>> repeatValues = [
  Value(
    name: 'noRepeat',
    value: ImageRepeat.noRepeat,
    label: "ImageRepeat.noRepeat",
  ),
  Value(
    name: 'repeat',
    value: ImageRepeat.repeat,
    label: "ImageRepeat.repeat",
  ),
  Value(
    name: 'repeatX',
    value: ImageRepeat.repeatX,
    label: "ImageRepeat.repeatX",
  ),
  Value(
    name: 'repeatY',
    value: ImageRepeat.repeatY,
    label: "ImageRepeat.repeatY",
  ),
];

const List<Value<BlendMode>> colorBlendModeValues = [
  Value(
    name: 'clear',
    value: BlendMode.clear,
    label: "BlendMode.clear",
  ),
  Value(
    name: 'src',
    value: BlendMode.src,
    label: "BlendMode.src",
  ),
  Value(
    name: 'dst',
    value: BlendMode.dst,
    label: "BlendMode.dst",
  ),
  Value(
    name: 'srcOver',
    value: BlendMode.srcOver,
    label: "BlendMode.srcOver",
  ),
  Value(
    name: 'dstOver',
    value: BlendMode.dstOver,
    label: "BlendMode.dstOver",
  ),
  Value(
    name: 'srcIn',
    value: BlendMode.srcIn,
    label: "BlendMode.srcIn",
  ),
  Value(
    name: 'dstIn',
    value: BlendMode.dstIn,
    label: "BlendMode.dstIn",
  ),
  Value(
    name: 'srcOut',
    value: BlendMode.srcOut,
    label: "BlendMode.srcOut",
  ),
  Value(
    name: 'dstOut',
    value: BlendMode.dstOut,
    label: "BlendMode.dstOut",
  ),
  Value(
    name: 'srcATop',
    value: BlendMode.srcATop,
    label: "BlendMode.srcATop",
  ),
  Value(
    name: 'dstATop',
    value: BlendMode.dstATop,
    label: "BlendMode.dstATop",
  ),
  Value(
    name: 'xor',
    value: BlendMode.xor,
    label: "BlendMode.xor",
  ),
  Value(
    name: 'plus',
    value: BlendMode.plus,
    label: "BlendMode.plus",
  ),
  Value(
    name: 'modulate',
    value: BlendMode.modulate,
    label: "BlendMode.modulate",
  ),
  Value(
    name: 'screen',
    value: BlendMode.screen,
    label: "BlendMode.screen",
  ),
  Value(
    name: 'overlay',
    value: BlendMode.overlay,
    label: "BlendMode.overlay",
  ),
  Value(
    name: 'darken',
    value: BlendMode.darken,
    label: "BlendMode.darken",
  ),
  Value(
    name: 'lighten',
    value: BlendMode.lighten,
    label: "BlendMode.lighten",
  ),
  Value(
    name: 'colorDodge',
    value: BlendMode.colorDodge,
    label: "BlendMode.colorDodge",
  ),
  Value(
    name: 'colorBurn',
    value: BlendMode.colorBurn,
    label: "BlendMode.colorBurn",
  ),
  Value(
    name: 'hardLight',
    value: BlendMode.hardLight,
    label: "BlendMode.hardLight",
  ),
  Value(
    name: 'softLight',
    value: BlendMode.softLight,
    label: "BlendMode.softLight",
  ),
  Value(
    name: 'difference',
    value: BlendMode.difference,
    label: "BlendMode.difference",
  ),
  Value(
    name: 'exclusion',
    value: BlendMode.exclusion,
    label: "BlendMode.exclusion",
  ),
  Value(
    name: 'multiply',
    value: BlendMode.multiply,
    label: "BlendMode.multiply",
  ),
  Value(
    name: 'hue',
    value: BlendMode.hue,
    label: "BlendMode.hue",
  ),
  Value(
    name: 'saturation',
    value: BlendMode.saturation,
    label: "BlendMode.saturation",
  ),
  Value(
    name: 'color',
    value: BlendMode.color,
    label: "BlendMode.color",
  ),
  Value(
    name: 'luminosity',
    value: BlendMode.luminosity,
    label: "BlendMode.luminosity",
  ),
];

const List<Value<BoxFit>> fitValues = [
  Value(
    name: 'none',
    value: BoxFit.none,
    label: 'BoxFit.none',
  ),
  Value(
    name: 'cover',
    value: BoxFit.cover,
    label: 'BoxFit.cover',
  ),
  Value(
    name: 'contain',
    value: BoxFit.contain,
    label: 'BoxFit.contain',
  ),
  Value(
    name: 'scaleDown',
    value: BoxFit.scaleDown,
    label: 'BoxFit.scaleDown',
  ),
  Value(
    name: 'fill',
    value: BoxFit.fill,
    label: 'BoxFit.fill',
  ),
  Value(
    name: 'fitHeight',
    value: BoxFit.fitHeight,
    label: 'BoxFit.fitHeight',
  ),
  Value(
    name: 'fitWidth',
    value: BoxFit.fitWidth,
    label: 'BoxFit.fitWidth',
  ),
];

List<Value<Rect>> centerSlideValues = [
  Value(
    name: 'Rect.zero',
    value: Rect.zero,
    label: 'Rect.zero',
  ),
  Value(
    name: 'Rect.fromCircle',
    value: Rect.fromCircle(
      center: Offset(
        25.0,
        25.0,
      ),
      radius: 16.0,
    ),
    label: '''Rect.fromCircle(
      center: Offset(
        25.0,
        25.0,
      ),
      radius: 16.0,
    )''',
  ),
  Value(
    name: 'Rect.fromLTRB',
    value: Rect.fromLTRB(
      25.0,
      25.0,
      50.0,
      50.0,
    ),
    label: '''Rect.fromLTRB(
      25.0,
      25.0,
      50.0,
      50.0,
    )''',
  ),
  Value(
    name: 'Rect.fromLTWH',
    value: Rect.fromLTWH(
      25.0,
      25.0,
      50.0,
      50.0,
    ),
    label: '''Rect.fromLTWH(
      25.0,
      25.0,
      50.0,
      50.0,
    )''',
  ),
  Value(
    name: 'Rect.fromPoints',
    value: Rect.fromPoints(
        Offset(
          25.0,
          25.0,
        ),
        Offset(
          50.0,
          50.0,
        )),
    label: '''Rect.fromPoints(
        Offset(
          25.0,
          25.0,
        ),
        Offset(
          50.0,
          50.0,
        ))''',
  ),
  Value(
    name: 'Rect.largest',
    value: Rect.largest,
    label: 'Rect.largest',
  ),
];

const List<Value<TextAlign>> textAlignValues = [
  const Value(
    name: 'start',
    value: TextAlign.start,
    label: 'TextAlign.start',
  ),
  const Value(
    name: 'center',
    value: TextAlign.center,
    label: 'TextAlign.center',
  ),
  const Value(
    name: 'end',
    value: TextAlign.end,
    label: 'TextAlign.end',
  ),
  const Value(
    name: 'justify',
    value: TextAlign.justify,
    label: 'TextAlign.justify',
  ),
  const Value(
    name: 'left',
    value: TextAlign.left,
    label: 'TextAlign.left',
  ),
  const Value(
    name: 'right',
    value: TextAlign.right,
    label: 'TextAlign.right',
  ),
];

const List<Value<TextOverflow>> textOverflowValues = [
  const Value(
    name: 'fade',
    value: TextOverflow.fade,
    label: 'TextOverflow.fade',
  ),
  const Value(
    name: 'ellipsis',
    value: TextOverflow.ellipsis,
    label: 'TextOverflow.ellipsis',
  ),
  const Value(
    name: 'clip',
    value: TextOverflow.clip,
    label: 'TextOverflow.clip',
  ),
];

const List<Value<Overflow>> overflowValues = [
  const Value(
    name: 'clip',
    value: Overflow.clip,
    label: 'Overflow.clip',
  ),
  const Value(
    name: 'visible',
    value: Overflow.visible,
    label: 'Overflow.visible',
  ),
];

const List<Value<int>> intMini2Values = [
  const Value(
    name: '0',
    value: 0,
    label: '0',
  ),
  const Value(
    name: '1',
    value: 1,
    label: '1',
  ),
  const Value(
    name: '2',
    value: 2,
    label: '2',
  ),
  const Value(
    name: '3',
    value: 3,
    label: '3',
  ),
  const Value(
    name: '4',
    value: 4,
    label: '4',
  ),
];
const List<Value<int>> intMiniValues = [
  const Value(
    name: '1',
    value: 1,
    label: '1',
  ),
  const Value(
    name: '2',
    value: 2,
    label: '2',
  ),
  const Value(
    name: '3',
    value: 3,
    label: '3',
  ),
  const Value(
    name: '4',
    value: 4,
    label: '4',
  ),
];
const List<Value<int>> intLargeValues = [
  const Value(
    name: '10',
    value: 10,
    label: '10',
  ),
  const Value(
    name: '20',
    value: 20,
    label: '20',
  ),
  const Value(
    name: '30',
    value: 30,
    label: '30',
  ),
  const Value(
    name: '40',
    value: 40,
    label: '40',
  ),
];

const List<Value<double>> doubleAspectValue = [
  Value(
    name: '4.0/3.0',
    value: 4.0 / 3.0,
    label: '4.0/3.0',
  ),
  Value(
    name: '5.0/5.0',
    value: 5.0 / 5.0,
    label: '5.0/5.0',
  ),
  Value(
    name: '16.0/9.0',
    value: 16.0 / 9.0,
    label: '16.0/9.0',
  ),
];

const List<Value<double>> doubleOneValues = [
  const Value(
    name: 'null',
    value: null,
    label: 'null',
  ),
  const Value(
    name: '0.0',
    value: 0.0,
    label: '0.0',
  ),
  const Value(
    name: '0.2',
    value: 0.2,
    label: '0.2',
  ),
  const Value(
    name: '0.4',
    value: 0.4,
    label: '0.4',
  ),
  const Value(
    name: '0.6',
    value: 0.6,
    label: '0.6',
  ),
  const Value(
    name: '1.0',
    value: 1.0,
    label: '1.0',
  ),
];
const List<Value<double>> doubleMiniValues = [
  const Value(
    name: '0.0',
    value: 0.0,
    label: '0.0',
  ),
  const Value(
    name: '1.0',
    value: 1.0,
    label: '1.0',
  ),
  const Value(
    name: '2.0',
    value: 2.0,
    label: '2.0',
  ),
  const Value(
    name: '3.0',
    value: 3.0,
    label: '3.0',
  ),
  const Value(
    name: '4.0',
    value: 4.0,
    label: '4.0',
  ),
];
const List<Value<double>> doubleLargeValues = [
  const Value(
    name: '0.0',
    value: 0.0,
    label: '0.0',
  ),
  const Value(
    name: '2.0',
    value: 2.0,
    label: '2.0',
  ),
  const Value(
    name: '8.0',
    value: 8.0,
    label: '8.0',
  ),
  const Value(
    name: '16.0',
    value: 16.0,
    label: '16.0',
  ),
  const Value(
    name: '32.0',
    value: 32.0,
    label: '32.0',
  ),
];
const List<Value<double>> doubleXlargeValues = [
  const Value(
    name: '10.0',
    value: 10.0,
    label: '10.0',
  ),
  const Value(
    name: '20.0',
    value: 20.0,
    label: '20.0',
  ),
  const Value(
    name: '40.0',
    value: 40.0,
    label: '40.0',
  ),
  const Value(
    name: '80.0',
    value: 80.0,
    label: '80.0',
  ),
];
const List<Value<double>> doubleHugeValues = [
  const Value(
    name: '100.0',
    value: 100.0,
    label: '100.0',
  ),
  const Value(
    name: '200.0',
    value: 200.0,
    label: '200.0',
  ),
  const Value(
    name: '400.0',
    value: 400.0,
    label: '400.0',
  ),
  const Value(
    name: '800.0',
    value: 800.0,
    label: '800.0',
  ),
];
const List<Value<double>> fontSizeValues = [
  const Value(
    name: 'null(默认)',
    value: null,
    label: 'null',
  ),
  const Value(
    name: '8.0',
    value: 8.0,
    label: '8.0',
  ),
  const Value(
    name: '12.0',
    value: 12.0,
    label: '12.0',
  ),
  const Value(
    name: '16.0',
    value: 16.0,
    label: '16.0',
  )
];

const List<Value<FontWeight>> fontWeightValues = [
  const Value(
    name: 'normal',
    value: FontWeight.normal,
    label: 'FontWeight.normal',
  ),
  const Value(
    name: 'bold',
    value: FontWeight.bold,
    label: 'FontWeight.bold',
  ),
  const Value(
    name: 'w100',
    value: FontWeight.w100,
    label: 'FontWeight.w100',
  ),
  const Value(
    name: 'w900',
    value: FontWeight.w900,
    label: 'FontWeight.w900',
  ),
];

const List<Value<FontStyle>> fontStyleValues = [
  const Value(
    name: 'normal',
    value: FontStyle.normal,
    label: 'FontStyle.normal',
  ),
  const Value(
    name: 'italic',
    value: FontStyle.italic,
    label: 'FontStyle.italic',
  ),
];

Paint _paintOne() {
  Paint paint = Paint();
  paint.style = PaintingStyle.stroke;
  paint.color = Colors.grey;
  paint.strokeWidth = 3.0;
  return paint;
}

Paint _paintTwo() {
  Paint paint = Paint();
  paint.style = PaintingStyle.stroke;
  paint.color = Colors.blue;
  paint.strokeWidth = 1.0;
  paint.strokeCap = StrokeCap.square;
  paint.isAntiAlias = true;
  return paint;
}

List<Value<Paint>> paintValues = [
  Value(
    name: 'paintOne',
    value: _paintOne(),
    label: 'Paint('
        'style:stroke,'
        'color:grey,'
        'strokeWidth:3.0,'
        ')',
  ),
  Value(
    name: 'paintTwo',
    value: _paintTwo(),
    label: 'Paint(style:stroke,'
        'color:blue,'
        'strokeWidth:1.0,'
        'strokeCap:square,'
        'isAntiAlias:true,'
        ')',
  ),
];

List<Value<TextDecoration>> textDecorationValues = [
  Value(
    name: 'none',
    value: TextDecoration.none,
    label: 'TextDecoration.none',
  ),
  Value(
    name: 'lineThrough',
    value: TextDecoration.lineThrough,
    label: 'TextDecoration.lineThrough',
  ),
  Value(
    name: 'overline',
    value: TextDecoration.overline,
    label: 'TextDecoration.overline',
  ),
  Value(
    name: 'underline',
    value: TextDecoration.underline,
    label: 'TextDecoration.underline',
  ),
];

List<Value<TextDecorationStyle>> textDecorationStyleValues = [
  Value(
    name: 'dashed',
    value: TextDecorationStyle.dashed,
    label: 'TextDecorationStyle.dashed',
  ),
  Value(
    name: 'double',
    value: TextDecorationStyle.double,
    label: 'TextDecorationStyle.double',
  ),
  Value(
    name: 'dotted',
    value: TextDecorationStyle.dotted,
    label: 'TextDecorationStyle.dotted',
  ),
  Value(
    name: 'solid',
    value: TextDecorationStyle.solid,
    label: 'TextDecorationStyle.solid',
  ),
  Value(
    name: 'wavy',
    value: TextDecorationStyle.wavy,
    label: 'TextDecorationStyle.wavy',
  ),
];

const List<Value<double>> sizeValues = [
  const Value(
    name: '4.0',
    value: 4.0,
    label: '4.0',
  ),
  const Value(
    name: '12.0',
    value: 12.0,
    label: '12.0',
  ),
  const Value(
    name: '16.0',
    value: 16.0,
    label: '16.0',
  ),
  const Value(
    name: '24.0',
    value: 24.0,
    label: '24.0',
  ),
  const Value(
    name: '36.0',
    value: 36.0,
    label: '36.0',
  ),
  const Value(
    name: '48.0',
    value: 48.0,
    label: '48.0',
  ),
];

const List<Value<ButtonTextTheme>> buttonTextThemeValues = [
  const Value(
    name: 'normal',
    value: ButtonTextTheme.normal,
    label: 'ButtonTextTheme.normal',
  ),
  const Value(
    name: 'accent',
    value: ButtonTextTheme.accent,
    label: 'ButtonTextTheme.accent',
  ),
  const Value(
    name: 'primary',
    value: ButtonTextTheme.primary,
    label: 'ButtonTextTheme.primary',
  ),
];

const List<Value<Brightness>> colorBrightnessValues = [
  const Value(
    name: 'dark',
    value: Brightness.dark,
    label: 'Brightness.dark',
  ),
  const Value(
    name: 'light',
    value: Brightness.light,
    label: 'Brightness.light',
  ),
];

List<Value<ValueChanged<GlobalKey<ScaffoldState>>>> onPressValues = [
  Value(
    name: 'showSnack',
    value: (key) {
      key.currentState.showSnackBar(SnackBar(content: Text('Hello guys!')));
    },
    label: '''(){
    showSnackBar(SnackBar(content: Text('Hello guys!')));
    }''',
  ),
  const Value(
    name: 'disable',
    value: null,
    label: 'null',
  ),
];

List<Value<ShapeBorder>> shapeValues = [
  const Value(
      name: 'CircleBorder',
      value: CircleBorder(
        side: BorderSide(
          color: Colors.green,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      ),
      label: '''CircleBorder(
        side: BorderSide(
          color: Colors.green,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      )'''),
  Value(
      name: 'RoundedRectangleBorder',
      value: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      label: '''RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 3.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(12.0),
      )'''),
  Value(
      name: 'StadiumBorder',
      value: BeveledRectangleBorder(
          side: BorderSide(
            color: Colors.red,
            width: 3.0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(12.0)),
      label: '''BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 3.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(12.0)
      )'''),
  const Value(
      name: 'StadiumBorder',
      value: StadiumBorder(
        side: BorderSide(
          color: Colors.yellow,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      ),
      label: '''RoundedRectangleBorder(
        side: StadiumBorder(
          color: Colors.yellow,
          width: 3.0,
          style: BorderStyle.solid,
        ),
      )'''),
];

const List<Value<Duration>> durationValues = [
  Value(
    name: 'Duration.milliseconds',
    value: const Duration(milliseconds: 200),
    label: 'const Duration(milliseconds: 200)',
  ),
  Value(
    name: 'Duration.microseconds',
    value: const Duration(microseconds: 200),
    label: 'const Duration(microseconds: 200)',
  ),
  Value(
    name: 'Duration.seconds',
    value: const Duration(seconds: 1),
    label: 'const Duration(seconds: 1)',
  ),
  Value(
    name: 'Duration.minutes[<-_<-]',
    value: const Duration(minutes: 1),
    label: 'const Duration(minutes: 1)',
  ),
  Value(
    name: 'Duration.hours[<-_<-]',
    value: const Duration(hours: 1),
    label: 'const Duration(hours: 1)',
  ),
  Value(
    name: 'Duration.days[<-_<-]',
    value: const Duration(days: 1),
    label: 'const Duration(days: 1)',
  ),
];

List<Value<FloatingActionButtonLocation>> floatingActionButtonLocationValues = [
  Value(
    name: 'centerDocked',
    value: FloatingActionButtonLocation.centerDocked,
    label: 'FloatingActionButtonLocation.centerDocked',
  ),
  Value(
    name: 'endDocked',
    value: FloatingActionButtonLocation.endDocked,
    label: 'FloatingActionButtonLocation.endDocked',
  ),
  Value(
    name: 'centerFloat',
    value: FloatingActionButtonLocation.centerFloat,
    label: 'FloatingActionButtonLocation.centerFloat',
  ),
  Value(
    name: 'endFloat',
    value: FloatingActionButtonLocation.endFloat,
    label: 'FloatingActionButtonLocation.endFloat',
  ),
];

List<Value<FloatingActionButtonAnimator>> floatingActionButtonAnimatorValues = [
  Value(
    name: 'null',
    value: null,
    label: 'null',
  ),
  Value(
    name: 'scaling',
    value: FloatingActionButtonAnimator.scaling,
    label: 'FloatingActionButtonAnimator.scaling',
  ),

//idea FloatingActionButtonAnimator
//FloatingActionButtonAnimator one(){
//  return FloatingAnimator();
//}
//class FloatingAnimator extends FloatingActionButtonAnimator{
//  @override
//  Offset getOffset({Offset begin, Offset end, double progress}) {
//  }
//  @override
//  Animation<double> getRotationAnimation({Animation<double> parent}) {
//  }
//  @override
//  Animation<double> getScaleAnimation({Animation<double> parent}) {
//  }
//}
];
const List<Value<List<Widget>>> actionsValues = [
  Value(
    name: 'oneAction',
    value: [
      const Icon(Icons.add),
    ],
    label: '''[ 
        const Icon(Icons.add),
    ]''',
  ),
  Value(
    name: 'twoActions',
    value: [
      const Icon(Icons.add),
      const Icon(Icons.remove),
    ],
    label: '''[
        const Icon(Icons.add),
        const Icon(Icons.remove),
    ]''',
  ),
  Value(
    name: 'threeAction',
    value: [
      const Icon(Icons.add),
      const Icon(Icons.repeat),
      const Icon(Icons.remove),
    ],
    label: '''[
        const Icon(Icons.add),
        const Icon(Icons.repeat),
        const Icon(Icons.remove),
    ]''',
  ),
];

List<Value<Widget>> flexibleSpaceValues = [
  Value(
    name: 'image',
    value: FlexibleSpaceBar(
      background: Image.asset('images/burgers.jpg'),
    ),
    label: '''FlexibleSpaceBar(
          background: Image.asset('images/burgers.jpg'),
    )''',
  ),
  Value(
    name: 'image,title',
    value: FlexibleSpaceBar(
      title: const Text('title'),
      background: Image.asset('images/burgers.jpg'),
    ),
    label: '''FlexibleSpaceBar(
          title: const Text('title'),
          background: Image.asset('images/burgers.jpg'),
    )''',
  ),
  Value(
    name: 'image,title,centerTitle',
    value: FlexibleSpaceBar(
      title: const Text('title'),
      background: Image.asset('images/burgers.jpg'),
      centerTitle: true,
    ),
    label: '''FlexibleSpaceBar(
          title: const Text('title'),
          background: Image.asset('images/burgers.jpg'),
          centerTitle: true,
    )''',
  ),
];

List<Value<IconButton>> iconButtonValues = [
  Value(
    name: 'close',
    value: IconButton(
      icon: Icon(Icons.close),
      onPressed: null,
    ),
    label: '''IconButton(
          icon: Icon(Icons.close),
          onPressed: null,
    )''',
  ),
  Value(
    name: 'arrow_back',
    value: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: null,
    ),
    label: '''IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: null,
    )''',
  ),
];

List<Value<FlutterLogoStyle>> logoStyleValues = [
  Value(
    name: 'markOnly',
    value: FlutterLogoStyle.markOnly,
    label: 'FlutterLogoStyle.markOnly',
  ),
  Value(
    name: 'stacked',
    value: FlutterLogoStyle.stacked,
    label: 'FlutterLogoStyle.stacked',
  ),
  Value(
    name: 'horizontal',
    value: FlutterLogoStyle.horizontal,
    label: 'FlutterLogoStyle.horizontal',
  ),
];

List<Value<Curve>> curveValues = [
  Value(
    name: 'ease',
    value: Curves.ease,
    label: 'Curves.ease',
  ),
  Value(
    name: 'easeIn',
    value: Curves.easeIn,
    label: 'Curves.easeIn',
  ),
  Value(
    name: 'easeOut',
    value: Curves.easeOut,
    label: 'Curves.easeOut',
  ),
  Value(
    name: 'easeInOut',
    value: Curves.easeInOut,
    label: 'Curves.easeInOut',
  ),
  Value(
    name: 'elasticIn',
    value: Curves.elasticIn,
    label: 'Curves.elasticIn',
  ),
  Value(
    name: 'elasticOut',
    value: Curves.elasticOut,
    label: 'Curves.elasticOut',
  ),
  Value(
    name: 'elasticInOut',
    value: Curves.elasticInOut,
    label: 'Curves.elasticInOut',
  ),
  Value(
    name: 'bounceIn',
    value: Curves.bounceIn,
    label: 'Curves.bounceIn',
  ),
  Value(
    name: 'bounceOut',
    value: Curves.bounceOut,
    label: 'Curves.bounceOut',
  ),
  Value(
    name: 'bounceInOut',
    value: Curves.bounceInOut,
    label: 'Curves.bounceInOut',
  ),
  Value(
    name: 'fastOutSlowIn',
    value: Curves.fastOutSlowIn,
    label: 'Curves.fastOutSlowIn',
  ),
  Value(
    name: 'decelerate',
    value: Curves.decelerate,
    label: 'Curves.decelerate',
  ),
  Value(
    name: 'linear',
    value: Curves.linear,
    label: 'Curves.linear',
  ),
];

//use to FlutterLogoStyle
List<Value<MaterialColor>> materialColorValues = [
  Value(
    name: 'RedPink',
    value: MaterialColor(
      400,
      {
        400: Colors.red,
        900: Colors.pink,
      },
    ),
    label: '''MaterialColor(
      400,
      {
        400: Colors.red,
        900: Colors.pink,
      },
    )''',
  ),
  Value(
    name: 'RedPink',
    value: MaterialColor(
      400,
      {
        400: Colors.green,
        900: Colors.greenAccent,
      },
    ),
    label: '''MaterialColor(
      400,
      {
        400: Colors.green,
        900: Colors.greenAccent,
      },
    )''',
  ),
  Value(
    name: 'BlueCyan',
    value: MaterialColor(
      400,
      {
        400: Colors.blue,
        900: Colors.cyan,
      },
    ),
    label: '''MaterialColor(
      400,
      {
        400: Colors.blue,
        900: Colors.cyan,
      },
    )''',
  ),
];

List<Value<List<BottomNavigationBarItem>>> bottomNavigationBarItemValues = [
  Value(
    name: 'four item',
    value: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.question_answer),
        title: Text('Question'),
        backgroundColor: Colors.yellow,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        title: Text('map'),
        backgroundColor: Colors.grey,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Person'),
        backgroundColor: Colors.green,
      ),
    ],
    label: '''[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.question_answer),
      title: Text('Question'),
      backgroundColor: Colors.yellow,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.map),
        title: Text('map'),
        backgroundColor: Colors.grey,
      ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Person'),
        backgroundColor: Colors.green,
      ),
  ]''',
  ),
  Value(
    name: 'three item',
    value: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.question_answer),
        title: Text('Question'),
        backgroundColor: Colors.yellow,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Person'),
        backgroundColor: Colors.green,
      ),
    ],
    label: '''[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.question_answer),
      title: Text('Question'),
      backgroundColor: Colors.yellow,
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Person'),
        backgroundColor: Colors.green,
      ),
  ]''',
  ),
  Value(
    name: 'two item',
    value: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.question_answer),
        title: Text('Question'),
        backgroundColor: Colors.yellow,
      ),
    ],
    label: '''[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
      backgroundColor: Colors.blue,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.question_answer),
      title: Text('Question'),
      backgroundColor: Colors.yellow,
    ),
  ]''',
  ),
];

List<Value<BottomNavigationBarType>> bottomNavigationBarTypeValues = [
  Value(
    name: 'shifting',
    value: BottomNavigationBarType.shifting,
    label: 'BottomNavigationBarType.shifting',
  ),
  Value(
    name: 'fixed',
    value: BottomNavigationBarType.fixed,
    label: 'BottomNavigationBarType.fixed',
  ),
];

List<Value<List<Widget>>> tabValues = [
  Value(name: 'six', value: [
    Tab(
      text: 'tab1',
      icon: Icon(Icons.title),
    ),
    Tab(
      text: 'tab2',
      icon: Icon(Icons.brightness_1),
    ),
    Tab(
      text: 'tab3',
      icon: Icon(Icons.label),
    ),
    Tab(
      text: 'tab4',
      icon: Icon(Icons.style),
    ),
    Tab(
      text: 'tab5',
      icon: Icon(Icons.add),
    ),
    Tab(
      text: 'tab6',
      icon: Icon(Icons.print),
    ),
  ], label: '''[
      Tab(
        text: 'tab1',
        icon: Icon(Icons.title),
      ),
      Tab(
        text: 'tab2',
        icon: Icon(Icons.brightness_1),
      ),
      Tab(
        text: 'tab3',
        icon: Icon(Icons.label),
      ),
      Tab(
        text: 'tab4',
        icon: Icon(Icons.style),
      ),
      Tab(
          text: 'tab5',
          icon: Icon(Icons.add),
      ),
      Tab(
          text: 'tab6',
          icon: Icon(Icons.print),
      ),
    ]'''),
  Value(name: 'five', value: [
    Tab(
      text: 'tab1',
      icon: Icon(Icons.title),
    ),
    Tab(
      text: 'tab2',
      icon: Icon(Icons.brightness_1),
    ),
    Tab(
      text: 'tab3',
      icon: Icon(Icons.label),
    ),
    Tab(
      text: 'tab4',
      icon: Icon(Icons.style),
    ),
    Tab(
      text: 'tab5',
      icon: Icon(Icons.add),
    ),
  ], label: '''[
      Tab(
        text: 'tab1',
        icon: Icon(Icons.title),
      ),
      Tab(
        text: 'tab2',
        icon: Icon(Icons.brightness_1),
      ),
      Tab(
        text: 'tab3',
        icon: Icon(Icons.label),
      ),
      Tab(
        text: 'tab4',
        icon: Icon(Icons.style),
      ),
      Tab(
          text: 'tab5',
          icon: Icon(Icons.add),
        ),
    ]'''),
  Value(name: 'four', value: [
    Tab(
      text: 'tab1',
      icon: Icon(Icons.title),
    ),
    Tab(
      text: 'tab2',
      icon: Icon(Icons.brightness_1),
    ),
    Tab(
      text: 'tab3',
      icon: Icon(Icons.label),
    ),
    Tab(
      text: 'tab4',
      icon: Icon(Icons.style),
    ),
  ], label: '''[
      Tab(
        text: 'tab1',
        icon: Icon(Icons.title),
      ),
      Tab(
        text: 'tab2',
        icon: Icon(Icons.brightness_1),
      ),
      Tab(
        text: 'tab3',
        icon: Icon(Icons.label),
      ),
      Tab(
        text: 'tab4',
        icon: Icon(Icons.style),
      ),
    ]'''),
];

List<Value<TabBarIndicatorSize>> tabBarIndicatorSizeValues = [
  Value(
    name: 'label',
    value: TabBarIndicatorSize.label,
    label: 'TabBarIndicatorSize.label',
  ),
  Value(
    name: 'tab',
    value: TabBarIndicatorSize.tab,
    label: 'TabBarIndicatorSize.tab',
  ),
];

List<Value<ScrollPhysics>> physicsValues = [
  Value(
    name: 'ScrollPhysics',
    value: ScrollPhysics(),
    label: 'ScrollPhysics()',
  ),
  Value(
    name: 'BouncingScrollPhysics',
    value: BouncingScrollPhysics(),
    label: 'BouncingScrollPhysics()',
  ),
  Value(
    name: 'ClampingScrollPhysics',
    value: ClampingScrollPhysics(),
    label: 'ClampingScrollPhysics()',
  ),
  Value(
    name: 'FixedExtentScrollPhysics',
    value: FixedExtentScrollPhysics(),
    label: 'FixedExtentScrollPhysics()',
  ),
  Value(
    name: 'AlwaysScrollableScrollPhysics',
    value: AlwaysScrollableScrollPhysics(),
    label: 'AlwaysScrollableScrollPhysics()',
  ),
  Value(
    name: 'PageScrollPhysics',
    value: PageScrollPhysics(),
    label: 'AlwaysScrollableScrollPhysics()',
  ),
  Value(
    name: 'NeverScrollableScrollPhysics',
    value: NeverScrollableScrollPhysics(),
    label: 'NeverScrollableScrollPhysics()',
  ),
];

List<Value<PopupMenuItemBuilder<String>>> popupMenuItemBuilderValues = [
  Value(
    name: 'threeItem',
    value: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'apple',
            child: const Text('iPhone'),
          ),
          const PopupMenuItem<String>(
            value: 'HuaWei',
            child: const Text('Honer'),
          ),
          const PopupMenuItem<String>(
            value: 'XiaoMi',
            child: const Text('Mi'),
          ),
        ],
    label: '''(BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'apple',
            child: const Text('iPhone'),
          ),
          const PopupMenuItem<String>(
            value: 'HuaWei',
            child: const Text('Honer'),
          ),
          const PopupMenuItem<String>(
            value: 'XiaoMi',
            child: const Text('Mi'),
          ),
        ]''',
  ),
  Value(
    name: 'fourItem',
    value: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'apple',
            child: const Text('iPhone'),
          ),
          const PopupMenuItem<String>(
            value: 'HuaWei',
            child: const Text('Honer'),
          ),
          const PopupMenuItem<String>(
            value: 'XiaoMi',
            child: const Text('Mi'),
          ),
          const PopupMenuItem<String>(
            value: 'Samsung',
            child: const Text('Galaxy'),
          ),
        ],
    label: '''(BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'apple',
            child: const Text('iPhone'),
          ),
          const PopupMenuItem<String>(
            value: 'HuaWei',
            child: const Text('Honer'),
          ),
          const PopupMenuItem<String>(
            value: 'XiaoMi',
            child: const Text('Mi'),
          ),
          const PopupMenuItem<String>(
            value: 'Samsung',
            child: const Text('Galaxy'),
          ),
        ]''',
  ),
];

List<Value<List<Widget>>> buttonValues = [
  Value(
    name: 'threeButtons',
    value: [
      RaisedButton(
        onPressed: () {},
        child: Text('one'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('two'),
      ),
      RaisedButton(
        onPressed: () {},
        child: Text('three'),
      ),
    ],
    label: '''[
      RaisedButton(
        onPressed: () {},
        child: Text('one'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('two'),
      ),
      RaisedButton(
        onPressed: () {},
        child: Text('three'),
      ),
    ]''',
  ),
  Value(
    name: 'fourButtons',
    value: [
      RaisedButton(
        onPressed: () {},
        child: Text('one'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('two'),
      ),
      RaisedButton(
        onPressed: () {},
        child: Text('three'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('four'),
      ),
    ],
    label: '''[
      RaisedButton(
        onPressed: () {},
        child: Text('one'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('two'),
      ),
      RaisedButton(
        onPressed: () {},
        child: Text('three'),
      ),
      FlatButton(
        onPressed: () {},
        child: Text('four'),
      ),
    ]''',
  ),
];

List<Value<InputDecoration>> inputDecorationValues = [
  Value(
    name: 'InputDecoration',
    value: InputDecoration(),
    label: 'InputDecoration()',
  ),
];

const List<Value<bool>> boolValues = [
  const Value(
    name: 'false',
    value: false,
    label: 'false',
  ),
  const Value(
    name: 'true',
    value: true,
    label: 'true',
  ),
];

List<Value<TextInputType>> textInputTypeValues = [
  Value(
    name: 'text',
    value: TextInputType.text,
    label: 'TextInputType.text',
  ),
  Value(
    name: 'url',
    value: TextInputType.url,
    label: 'TextInputType.url',
  ),
  Value(
    name: 'datetime',
    value: TextInputType.datetime,
    label: 'TextInputType.datetime',
  ),
  Value(
    name: 'emailAddress',
    value: TextInputType.emailAddress,
    label: 'TextInputType.emailAddress',
  ),
  Value(
    name: 'multiline',
    value: TextInputType.multiline,
    label: 'TextInputType.multiline',
  ),
  Value(
    name: 'number',
    value: TextInputType.number,
    label: 'TextInputType.number',
  ),
  Value(
    name: 'phone',
    value: TextInputType.phone,
    label: 'TextInputType.phone',
  ),
];

List<Value<InputBorder>> inputBorderValues = [
  Value(
    name: 'Outline',
    value: OutlineInputBorder(),
    label: 'OutlineInputBorder()',
  ),
  Value(
    name: 'Underline',
    value: UnderlineInputBorder(),
    label: 'UnderlineInputBorder()',
  ),
];

List<Value<List<TextInputFormatter>>> textinputFormatterValues = [
  Value(
    name: 'Blacklisting(黑名单)',
    value: [
      BlacklistingTextInputFormatter('1', replacementString: '2'),
    ],
    label: '''[
      BlacklistingTextInputFormatter('1',replacementString: '2'),
    ]''',
  ),
  Value(
    name: 'LengthLimiting(长度限制)',
    value: [
      LengthLimitingTextInputFormatter(10),
    ],
    label: '''[
        LengthLimitingTextInputFormatter(10),
      ]''',
  ),
  Value(
    name: 'Whitelisting(白名单)',
    value: [
      WhitelistingTextInputFormatter('1'),
    ],
    label: '''[
        WhitelistingTextInputFormatter('1'),
      ]''',
  ),
];

List<Value<DatePickerMode>> datePickerModeValues = [
  Value(
    name: 'day',
    value: DatePickerMode.day,
    label: 'DatePickerMode.day',
  ),
  Value(
    name: 'year',
    value: DatePickerMode.year,
    label: 'DatePickerMode.year',
  ),
];

List<Value<DateTime>> dateTimeValues = [
  Value(
    name: 'now',
    value: DateTime.now(),
    label: 'DateTime.now()',
  ),
  Value(
    name: '1998/12/1 0:0:0 0:0',
    value: DateTime(1998, 12, 1, 0, 0, 0, 0, 0),
    label: 'DateTime(1998,12,1 ,0,0,0, 0,0)',
  ),
  Value(
    name: 'UTC 2028/12/1 0:0:0 0:0',
    value: DateTime.utc(2028, 12, 1, 0, 0, 0, 0, 0),
    label: 'DateTime.utc(2008,12,1 ,0,0,0, 0,0)',
  ),
  Value(
    name: 'MicroSeconds 1000000000000000',
    value: DateTime.fromMicrosecondsSinceEpoch(
      1000000000000000,
      isUtc: false,
    ),
    label: '''DateTime.fromMicrosecondsSinceEpoch(
      1000000000000000,
      isUtc: false,
    )''',
  ),
  Value(
    name: 'MilliSeconds 1200000000000',
    value: DateTime.fromMillisecondsSinceEpoch(
      1200000000000,
      isUtc: false,
    ),
    label: '''DateTime.fromMillisecondsSinceEpoch(
      1200000000000,
      isUtc: false,
    )''',
  ),
];

List<Value<TimeOfDay>> timeOfDayValues = [
  Value(
    name: 'now',
    value: TimeOfDay.now(),
    label: 'TimeOfDay.now()',
  ),
  Value(
    name: 'fromDateTime',
    value: TimeOfDay.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(
        1223456789123,
      ),
    ),
    label: '''TimeOfDay.fromDateTime(
      DateTime.fromMillisecondsSinceEpoch(
        1223456789123,
      ),
    )''',
  ),
];

List<Value<Widget>> iconValues = [
  Value(
    name: 'close',
    value: Icon(Icons.close),
    label: 'Icon(Icons.close)',
  ),
  Value(
    name: 'check',
    value: Icon(Icons.check),
    label: 'Icon(Icons.check)',
  ),
];

List<Value<Widget>> avatarValues = [
  Value(
    name: 'R',
    value: CircleAvatar(
      child: Text('R'),
    ),
    label: '''CircleAvatar(
      child: Text('R'),
    )''',
  ),
  Value(
    name: 'H',
    value: CircleAvatar(
      child: Text('H'),
    ),
    label: '''CircleAvatar(
      child: Text('H'),
    )''',
  ),
  Value(
    name: 'Y',
    value: CircleAvatar(
      child: Text('Y'),
    ),
    label: '''CircleAvatar(
      child: Text('Y'),
    )''',
  ),
  Value(
    name: 'M',
    value: CircleAvatar(
      child: Text('M'),
    ),
    label: '''CircleAvatar(
      child: Text('M'),
    )''',
  ),
  Value(
    name: 'E',
    value: CircleAvatar(
      child: Text('E'),
    ),
    label: '''CircleAvatar(
      child: Text('E'),
    )''',
  ),
];

//List<Value<MaterialTapTargetSize>> targetSizeValues=[
//  Value(
//    name: 'padded',
//    value: MaterialTapTargetSize.padded,
//    label: 'MaterialTapTargetSize.padded',
//  ),
//  Value(
//    name: 'shrinkWrap',
//    value: MaterialTapTargetSize.shrinkWrap,
//    label: 'MaterialTapTargetSize.shrinkWrap',
//  ),
//];

List<Value<StepperType>> stepperTypeValue = [
  Value(
    name: 'vertical',
    value: StepperType.vertical,
    label: 'StepperType.vertical',
  ),
  Value(
    name: 'horizontal',
    value: StepperType.horizontal,
    label: 'StepperType.horizontal',
  ),
];

List<Value<BorderRadius>> borderRadiusValues = [
  Value(
    name: 'circular',
    value: BorderRadius.circular(8.0),
    label: 'BorderRadius.circular(8.0)',
  ),
  Value(
    name: 'all',
    value: BorderRadius.all(
      Radius.elliptical(16.0, 8.0),
    ),
    label: '''BorderRadius.all(
      Radius.elliptical(16.0, 8.0),
    )''',
  ),
  Value(
    name: 'only',
    value: BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.lerp(null, Radius.circular(8.0), 8.0),
    ),
    label: '''BorderRadius.only(
      topLeft: Radius.circular(8.0),
      topRight: Radius.lerp(null, Radius.circular(8.0), 8.0),
    )''',
  ),
  Value(
    name: 'horizontal',
    value: BorderRadius.horizontal(
      left: Radius.circular(8.0),
    ),
    label: '''BorderRadius.horizontal(
      left: Radius.circular(8.0),
    )''',
  ),
  Value(
    name: 'vertical',
    value: BorderRadius.vertical(
      top: Radius.circular(8.0),
    ),
    label: '''BorderRadius.vertical(
      top: Radius.circular(8.0),
    )''',
  ),
];

List<Value<EdgeInsetsDirectional>> iosPaddingValues = [
  Value(
    name: 'fromSTEB',
    value: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
    label: 'const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0)',
  ),
  Value(
    name: 'only',
    value: const EdgeInsetsDirectional.only(
      top: 8.0,
    ),
    label: 'const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0)',
  ),
];

List<Value<Border>> borderValues = [
  Value(
    name: 'all',
    value: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
    label: '''Border.all(
          color: Colors.grey,
          width: 1.0,
    )''',
  ),
  Value(
    name: 'Border.bottom',
    value: Border(
      bottom: BorderSide(
        color: Colors.black38,
        width: 2.0,
      ),
    ),
    label: '''Border(
          bottom: BorderSide(
            color: Colors.black38,
            width: 2.0,
      ),
    )''',
  ),
];

List<Value<BoxConstraints>> constraintValues = [
  Value(
    name: 'BoxConstraints',
    value: BoxConstraints(
      minHeight: 100.0,
      minWidth: 120.0,
      maxHeight: 150.0,
      maxWidth: 180.0,
    ),
    label: '''BoxConstraints(
      minHeight: 100.0,
      minWidth: 120.0,
      maxHeight: 150.0,
      maxWidth: 180.0,
    )''',
  ),
  Value(
    name: 'BoxConstraints.tightFor',
    value: BoxConstraints.tightFor(
      width: 120.0,
      height: 130.0,
    ),
    label: '''BoxConstraints.tightFor(
      width: 120.0,
      height: 130.0,
    )''',
  ),
  Value(
    name: 'BoxConstraints.tightForFinite',
    value: BoxConstraints.tightForFinite(
      width: 120.0,
      height: 130.0,
    ),
    label: '''BoxConstraints.expand(
      width: 120.0,
      height: 130.0,
    )''',
  ),
  Value(
    name: 'BoxConstraints.expand',
    value: BoxConstraints.expand(
      width: 120.0,
      height: 130.0,
    ),
    label: '''BoxConstraints.expand(
      width: 120.0,
      height: 130.0,
    )''',
  ),
  Value(
    name: 'BoxConstraints.tight',
    value: BoxConstraints.tight(
      Size(100.0, 100.0),
    ),
    label: '''BoxConstraints.tight(
      Size(100.0, 100.0),
    )''',
  ),
  Value(
    name: 'BoxConstraints.loose',
    value: BoxConstraints.loose(
      Size(100.0, 100.0),
    ),
    label: '''BoxConstraints.loose(
      Size(100.0, 100.0),
    )''',
  ),
];

List<Value<Offset>> originValues = [
  Value(
    name: 'Offset1',
    value: Offset(-15.0, 15.0),
    label: '''Offset(-15.0, 15.0)''',
  ),
  Value(
    name: 'Offset2',
    value: Offset(15.0, -15.0),
    label: '''Offset(15.0, -15.0)''',
  ),
  Value(
    name: 'Offset3',
    value: Offset(-15.0, -15.0),
    label: '''Offset(-15.0, -15.0)''',
  ),
  Value(
    name: 'Offset4',
    value: Offset(15.0, 15.0),
    label: '''Offset(15.0, 15.0)''',
  ),
];

List<Value<StackFit>> stackFitValues = [
  Value(
    name: 'expand',
    value: StackFit.expand,
    label: 'StackFit.expand',
  ),
  Value(
    name: 'loose',
    value: StackFit.loose,
    label: 'StackFit.loose',
  ),
  Value(
    name: 'passthrough',
    value: StackFit.passthrough,
    label: 'StackFit.passthrough',
  ),
];

List<Value<TableCellVerticalAlignment>> tableCellVerticalAlignmentValues = [
  Value(
    name: 'middle',
    value: TableCellVerticalAlignment.middle,
    label: 'TableCellVerticalAlignment.middle',
  ),
  Value(
    name: 'baseline',
    value: TableCellVerticalAlignment.baseline,
    label: 'TableCellVerticalAlignment.baseline',
  ),
  Value(
    name: 'fill',
    value: TableCellVerticalAlignment.fill,
    label: 'TableCellVerticalAlignment.fill',
  ),
  Value(
    name: 'bottom',
    value: TableCellVerticalAlignment.bottom,
    label: 'TableCellVerticalAlignment.bottom',
  ),
  Value(
    name: 'top',
    value: TableCellVerticalAlignment.top,
    label: 'TableCellVerticalAlignment.top',
  ),
];

List<Value<TableBorder>> tableBorderValues = [
  Value(
    name: 'all',
    value: TableBorder.all(
      color: Colors.black,
      width: 1.0,
    ),
    label: '''TableBorder.all(
      color: Colors.black,
      width: 1.0,
    )''',
  ),
  Value(
    name: 'bottom',
    value: TableBorder(
      bottom: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    label: '''TableBorder(
      bottom: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    )''',
  ),
  Value(
    name: 'outside',
    value: TableBorder.symmetric(
      outside: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    label: '''TableBorder.symmetric(
      outside: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    )''',
  ),
  Value(
    name: 'inside',
    value: TableBorder.symmetric(
      inside: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    ),
    label: '''TableBorder.symmetric(
      inside: BorderSide(
        color: Colors.black,
        width: 1.0,
      ),
    )''',
  ),
];

List<Value<TableColumnWidth>> tableColumnWidthValues = [
  Value(
      name: 'IntrinsicColumn',
      value: IntrinsicColumnWidth(flex: 70.0),
      label: 'IntrinsicColumnWidth(flex: 70.0)'),
  Value(
      name: 'FractionColumn',
      value: FractionColumnWidth(70.0),
      label: 'FractionColumnWidth(70.0)'),
  Value(
    name: 'FlexColumn',
    value: FlexColumnWidth(),
    label: 'FlexColumnWidth()',
  ),
  Value(
    name: 'FixedColumn',
    value: FixedColumnWidth(70.0),
    label: 'FixedColumnWidth(70.0)',
  ),
  Value(
      name: 'MaxColumn',
      value: MaxColumnWidth(
        IntrinsicColumnWidth(flex: 110.0),
        FractionColumnWidth(60.0),
      ),
      label: '''MaxColumnWidth(
        IntrinsicColumnWidth(flex: 110.0),
        FractionColumnWidth(60.0),
      )'''
  ),
  Value(
      name: 'MinColumn',
      value: MinColumnWidth(
        IntrinsicColumnWidth(flex: 110.0),
        FractionColumnWidth(60.0),
      ),
      label: '''MinColumnWidth(
        IntrinsicColumnWidth(flex: 110.0),
        FractionColumnWidth(60.0),
      )'''
  ),
];

List<Value<Axis>> axisValues=[

  Value(
    name: 'horizontal',
    value: Axis.horizontal,
    label: 'Axis.horizontal',
  ),
  Value(
    name: 'vertical',
    value: Axis.vertical,
    label: 'Axis.vertical',
  ),
];
List<Value<WrapAlignment>> wrapAlignmentValues=[
  Value(
    name: 'start',
    value: WrapAlignment.start,
    label: 'WrapAlignment.start',
  ),
  Value(
    name: 'center',
    value: WrapAlignment.center,
    label: 'WrapAlignment.center',
  ),
  Value(
    name: 'end',
    value: WrapAlignment.end,
    label: 'WrapAlignment.end',
  ),
  Value(
    name: 'spaceEvenly',
    value: WrapAlignment.spaceEvenly,
    label: 'WrapAlignment.spaceEvenly',
  ),
  Value(
    name: 'spaceAround',
    value: WrapAlignment.spaceAround,
    label: 'WrapAlignment.spaceAround',
  ),
  Value(
    name: 'spaceBetween',
    value: WrapAlignment.spaceBetween,
    label: 'WrapAlignment.spaceBetween',
  ),
];
List<Value<WrapCrossAlignment>> wrapCrossAlignmentValues=[
  Value(
    name: 'start',
    value: WrapCrossAlignment.start,
    label: 'WrapCrossAlignment.start',
  ),
  Value(
    name: 'center',
    value: WrapCrossAlignment.center,
    label: 'WrapCrossAlignment.center',
  ),
  Value(
    name: 'end',
    value: WrapCrossAlignment.end,
    label: 'WrapCrossAlignment.end',
  ),
];

List<Value<CrossFadeState>> crossFadeStateValues=[
  Value(
    name: 'showFirst',
    value: CrossFadeState.showFirst,
    label: 'CrossFadeState.showFirst'
  ),
  Value(
      name: 'showSecond',
      value: CrossFadeState.showSecond,
      label: 'CrossFadeState.showSecond'
  ),
];

List<Value<DecorationPosition>> decorationPositionValues=[
  Value(
      name: 'background',
      value: DecorationPosition.background,
      label: 'DecorationPosition.background'
  ),
  Value(
      name: 'foreground',
      value: DecorationPosition.foreground,
      label: 'DecorationPosition.foreground'
  ),
];