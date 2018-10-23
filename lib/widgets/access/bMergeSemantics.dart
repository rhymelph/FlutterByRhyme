import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/example_code.dart';
class MergeSemanticsDemo extends StatefulWidget {
  static const String routeName='widgets/access/MergeSemantics';
  final String detail='''## 介绍
一个合并其后代语义的小部件。
使在这个节点上根植的子树的所有语义合并到语义树中的一个节点中。例如，如果在复选框小部件旁边有一个带有Text节点的小部件，则可以使用这个小部件将具有复选框的“选中”语义状态的Text节点中的标签合并到具有标签和选中状态的单个节点中。否则，标签将作为与复选框不同的独立特性呈现，并且用户将不能确定它们是否相关。
请注意，如果子树中的两个节点具有语义冲突，则结果可能是无意义的。例如，带有选中的复选框和未选中复选框的子树将被呈现为选中。所有的标签将被合并成一个单一的字符串（新线分隔每个标签从另一个）。如果合并的子树中的多个节点能够处理语义手势，那么按照树顺序的第一个节点将是接收回调的节点。

## 使用
```dart
MergeSemantics(
            child: Column(
              children: <Widget>[
                Semantics(
                  value: 'Hello',
                  child: Text('Hello'),
                ),
                Semantics(
                  label: 'World',
                  child: Text('World'),
                )
              ],
            ),
          );
```''';

  @override
  _MergeSemanticsDemoState createState() => _MergeSemanticsDemoState();
}
class _MergeSemanticsDemoState extends MarkdownState<MergeSemanticsDemo> {


  @override
  String getMarkdownSource() {
    return widget.detail;
  }

  @override
  String getTitle() {
    return 'MergeSemantics';
  }


}

