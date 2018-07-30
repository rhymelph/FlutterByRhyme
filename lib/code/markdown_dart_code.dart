import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/code_highlighter.dart';
class DartMarkDown extends StatelessWidget {
  DartMarkDown(this.source);
  final String source;
  final String h1='# ';
  final String h2='## ';
  final String h3='### ';
  final String h4='#### ';

  final String codeStart='```dart';
  final String codeEnd='```';

  final String grayBlank='> ';

  final String table='|';

  List<TextSpan> formatSpans(BuildContext context,String source){
    List<TextSpan> spans=[];
    final List<String> lines = source.split('\n');
    String codeTag;
    List<String> codeBlock;
    bool isCode=false;
    for (String line in lines) {
      if (line.startsWith(h1)
          ||line.startsWith(h2)
          ||line.startsWith(h3)
          ||line.startsWith(h4)) {
        spans.add(formatSpan(context, line.trim()));
      } else if (line.startsWith(codeStart)) {
        codeBlock=<String>[];
        codeTag = line.trim();
        codeBlock.add(line);
        isCode=true;
      }else if(line.startsWith(codeEnd)){
        spans.add(formatSpan(context, codeBlock.join('\n')));
        isCode=false;
      }else if(isCode){
        codeBlock.add(line.trimRight());
      }else{
        spans.add(formatSpan(context, line));
      }
    }
    return spans;
  }

  TextSpan formatSpan(BuildContext context,String source){
    TextStyle style=Theme.of(context).textTheme.body1;
    if(source.startsWith(h1)){
      source=source.replaceAll(h1, '');
      style=Theme.of(context).textTheme.display4.copyWith(fontWeight: FontWeight.bold);
    }else if(source.startsWith(h2)){
      source=source.replaceAll(h2, '');
      style=Theme.of(context).textTheme.display3.copyWith(fontWeight: FontWeight.bold);
    }else if(source.startsWith(h3)){
      source=source.replaceAll(h3, '');
      style=Theme.of(context).textTheme.display2.copyWith(fontWeight: FontWeight.bold);
    }else if(source.startsWith(h4)){
      source=source.replaceAll(h4, '');
      style=Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold);
    }else if(source.startsWith(grayBlank)){
      source=source.replaceAll(grayBlank, '');
      style=Theme.of(context).textTheme.subhead.copyWith(color: Colors.grey,fontStyle: FontStyle.italic);
    }else if(source.startsWith(codeStart)){
      source=source.replaceAll(codeStart, '');
      source=source.replaceAll(codeEnd, '');
      final SyntaxHighlighterStyle style =
      Theme.of(context).brightness == Brightness.dark
          ? SyntaxHighlighterStyle.darkThemeStyle()
          : SyntaxHighlighterStyle.lightThemeStyle();
      return  DartSyntaxHighlighter(style).format(source);
    }
    return TextSpan(
      style: style,
      text: source,
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
            text: TextSpan(
          children: formatSpans(context,source),
        )),
      ),
    );
  }
}
