import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/markdown/markdown_parse.dart';
import 'markdown/markdown_style.dart';
class MarkDownCode extends StatelessWidget {

  MarkDownCode(this._source,[this.style = const DefaultMarkDownStyle()]);

  final String _source;
  final MarkDownStyle style;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: MarkdownParse.parse(context, style, _source),
        ),
      ),
    );
  }
}
