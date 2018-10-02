import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/markdown_dart_code.dart';
class SemanticsDemo extends StatefulWidget {
  static const String routeName='widgets/access/Semantics';
  final String detail='''## 简介
一个小部件，用小部件含义的描述来注释小部件树。
由可访问性工具，搜索引擎和其他语义分析软件使用，以确定应用程序的含义。

## 参数

> 五个参数

| 类型 | 参数 | 介绍 |
| - | - | - |
| Widget | child | 子部件 |
| bool | container | 为true，则此小部件将在语义树中引入新节点 |
| bool | explicitChildNodes | 是否允许此窗口小部件的后代将语义信息添加SemanticsNode到此窗口小部件的注释中 |
| bool | excludeSemantics | 是否用此节点替换所有子语义 |
| SemanticsProperties | properties | 包含辅助技术使用的属性，以使应用程序更易于访问 |

## properties

|类型|参数|介绍(非null情况下)|
|-|-|-|
|bool|enabled|处于启用或禁用状态|
|bool|checked|具有“已检查”或“未检查”状态的复选框或类似窗口小部件|
|bool|selected|处于选定或未选择状态的内容|
|bool|toggled|具有切换的开关|
|bool|button|表示按钮|
|bool|header|表示标题|
|bool|textField|是否表示文本字段的内容|
|bool|focused|是否保持输入焦点|
|bool|inMutuallyExclusiveGroup|若是否处于互斥组中|
|bool|obscured|是否value应该被遮盖|
|bool|scopesRoute|以遍历排序顺序确定此节点在其兄弟节点中的位置|
|bool|namesRoute|是否包含路由的语义标签|
|bool|hidden|是否隐藏|
|bool|image|是否表示图像|
|bool|liveRegion|是否应被视为活动区域|
|String|label|标签|
|String|value|提供窗口小部件值的文本描述|
|String|increasedValue|增加值|
|String|decreasedValue|在此窗口小部件上执行操作value后将变为 的值SemanticsAction.decrease|
|String|hint|提供对窗口小部件执行的操作结果的简要文本描述|
|String|onTapHint|已过期|
|String|onLongPressHint|处理程序SemanticsAction.longPress|
|TextDirection|textDirection|所述的阅读方向label，value，hint，increasedValue，和decreasedValue|
|SemanticsSortKey|sortKey|以遍历排序顺序确定此节点在其兄弟节点中的位置|
|VoidCallback|onTap|处理程序SemanticsAction.tap|
|VoidCallback|onLongPress|处理程序SemanticsAction.longPress|
|VoidCallback|onScrollLeft|处理程序SemanticsAction.scrollLeft|
|VoidCallback|onScrollRight|处理程序SemanticsAction.scrollRight|
|VoidCallback|onScrollUp|处理程序SemanticsAction.scrollUp|
|VoidCallback|onScrollDown|处理程序SemanticsAction.scrollDown|
|VoidCallback|onIncrease|处理程序SemanticsAction.increase|
|VoidCallback|onDecrease|处理程序SemanticsAction.decrease|
|VoidCallback|onCopy|处理程序SemanticsAction.copy|
|VoidCallback|onCut|处理程序SemanticsAction.cut|
|VoidCallback|onPaste|处理程序SemanticsAction.paste|
|VoidCallback|onDismiss|处理程序SemanticsAction.dismiss|
|MoveCursorHandler|onMoveCursorForwardByCharacter|处理程序SemanticsAction.onMoveCursorForwardByCharacter|
|MoveCursorHandler|onMoveCursorBackwardByCharacter|处理程序SemanticsAction.onMoveCursorBackwardByCharacter|
|SetSelectionHandler|onSetSelection|处理程序SemanticsAction.setSelection|
|VoidCallback|onDidGainAccessibilityFocus|处理程序SemanticsAction.didGainAccessibilityFocus|
|VoidCallback|onDidLoseAccessibilityFocus|处理程序SemanticsAction.didLoseAccessibilityFocus|
|Map<CustomSemanticsAction, VoidCallback>|customSemanticsActions|从每个支持CustomSemanticsAction到提供的处理程序的映射|

## 使用
使用暂未明，猜测用于新系统Fuchsia
''';

  @override
  _SemanticsDemoState createState() => _SemanticsDemoState();
}

class _SemanticsDemoState extends State<SemanticsDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semantics'),
      ),
      body: DartMarkDown(widget.detail),
    );
  }

}
