import 'package:flutter/material.dart';
import 'markdown_style.dart';

//标题
class TitleHeader extends StatelessWidget {
  final MarkDownStyle style;
  final String text;
  const TitleHeader({Key key, this.style, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _formatText();
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
//引用
class QuoteWidget extends StatelessWidget {
  final MarkDownStyle style;
  final String text;
  const QuoteWidget({Key key, this.style, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(left: BorderSide(
          color: Colors.grey,
          width: 4.0,
        ))
      ),
      child: _formatText(),
    );
  }
  Widget _formatText()=>Text(text.substring(1),style: style.quote(),);
}

//无序列表
class DisOrderWidget extends StatelessWidget {
  final MarkDownStyle style;
  final String text;
  const DisOrderWidget({Key key, this.style, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 5.0,
          height: 5.0,
          child: DecoratedBox(decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          )),
        ),
        _formatText(),
      ],
    );
  }
  Widget _formatText()=>Text(text.substring(1),style: style.content(ContentStyle.normal),);
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
