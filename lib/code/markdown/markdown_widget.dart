import 'package:flutter/material.dart';
import 'markdown_style.dart';


class TitleHeader extends StatelessWidget {
  final MarkDownStyle style;
  final String text;
  const TitleHeader({Key key, this.style, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: _formatText(),
    );
  }

  Widget _formatText() {
    if(text.startsWith(RegExp(r'^(#{1})(.*)')))
      return Text(text.substring(1),style: style.title(TitleStyle.h1),);
    else if(text.startsWith(RegExp(r'^(#{2})(.*)')))
      return Text(text.substring(2),style: style.title(TitleStyle.h2),);
    else if(text.startsWith(RegExp(r'^(#{3})(.*)')))
      return Text(text.substring(3),style: style.title(TitleStyle.h3),);
    else if(text.startsWith(RegExp(r'^(#{4})(.*)')))
      return Text(text.substring(4),style: style.title(TitleStyle.h4),);
    else if(text.startsWith(RegExp(r'^(#{5})(.*)')))
      return Text(text.substring(5),style: style.title(TitleStyle.h5),);
    return Text(text);
  }
}

class ContentWidget extends StatelessWidget {
  final MarkDownStyle style;
  final List<String> texts;
  final List<ContentStyle> contentStyles;
  const ContentWidget({Key key, this.style, this.texts, this.contentStyles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _formatText(),
      ),
    );
  }

  List<TextSpan> _formatText(){
    List<TextSpan> list=[];
    int count=texts.length;
    for(int i=0;i<count;i++){
      String text=texts[i];
      ContentStyle contentStyle=contentStyles[i];
      list.add(TextSpan(
        style: style.content(contentStyle),
        text: text,
      ));
    }
    return list;
  }
}
