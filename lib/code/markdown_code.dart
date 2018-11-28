import 'package:flutter/material.dart';
import 'markdown/markdown_style.dart';
import 'markdown/markdown_label.dart';
class MarkDownCode extends StatelessWidget {

  MarkDownCode(this._source,[this.style = const DefaultMarkDownStyle()]);

  final String _source;
  final MarkDownStyle style;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
