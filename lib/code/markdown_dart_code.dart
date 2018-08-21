import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbyrhyme/code/code_highlighter.dart';
import 'package:url_launcher/url_launcher.dart';

class DartMarkDown extends StatelessWidget {
  DartMarkDown(this.source);

  final String source;
  final String h1 = '# ';
  final String h2 = '## ';
  final String h3 = '### ';
  final String h4 = '#### ';

  final String codeStart = '```dart';
  final String codeEnd = '```';

  final String grayBlank = '> ';

  final String table = '|';

  final String titleStart='![';
  final String titleURlStart='[';
  final String titleEnd=']';
  final String imageEnd=')';
  final String imageStart='(';

  List<TextSpan> formatSpans(BuildContext context, String source) {
    List<TextSpan> spans = [];
    final List<String> lines = source.split('\n');
    List<String> codeBlock;
    bool isCode = false;

    for (String line in lines) {
      if (line.startsWith(codeStart)) {
        codeBlock = <String>[];
        codeBlock.add(line.trim());
        isCode = true;
      } else if (line.startsWith(codeEnd)) {
        codeBlock.add(line.trim());
        spans.add(formatSpan(context, '${codeBlock.join('\n')}\n'));
        isCode = false;
      } else if (isCode) {
        codeBlock.add(line.trimRight());
      } else {
        spans.add(formatSpan(context, '${line.trim()}'));
      }
    }
    List<TextSpan> aSpan = [];
    for (TextSpan span in spans) {
      if (aSpan.length == 0) {
        aSpan.add(span);
      } else {
        if (aSpan[aSpan.length - 1].style == span.style) {
          aSpan[aSpan.length - 1] = TextSpan(
            style: span.style,
            text: aSpan[aSpan.length - 1].text + span.text,
          );
        } else {
          aSpan.add(span);
        }
      }
    }
    return aSpan;
  }

  TextSpan formatSpan(BuildContext context, String source) {
    TextStyle style = Theme.of(context).textTheme.body1;
    if (source.startsWith(h1)) {
      source = source.substring(h1.length);
      style = Theme
          .of(context)
          .textTheme
          .title
          .copyWith(fontWeight: FontWeight.bold, fontSize: 30.0);
    } else if (source.startsWith(h2)) {
      source = source.substring(h2.length);
      style = Theme
          .of(context)
          .textTheme
          .title
          .copyWith(fontWeight: FontWeight.bold, fontSize: 26.0);
    } else if (source.startsWith(h3)) {
      source = source.substring(h3.length);
      style = Theme
          .of(context)
          .textTheme
          .title
          .copyWith(fontWeight: FontWeight.bold, fontSize: 24.0);
    } else if (source.startsWith(h4)) {
      source = source.substring(h4.length);
      style = Theme
          .of(context)
          .textTheme
          .title
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0);
    } else if (source.startsWith(grayBlank)) {
      source = source.substring(grayBlank.length);
      style = Theme
          .of(context)
          .textTheme
          .subhead
          .copyWith(fontStyle: FontStyle.italic);
    } else if (source.startsWith(table)) {
      //display4
      style = Theme.of(context).textTheme.body2;
    } else if (source.startsWith(codeStart)) {
      source = source.substring(codeStart.length);
      source = source.replaceAll(codeEnd, '');
      final SyntaxHighlighterStyle style =
          Theme.of(context).brightness == Brightness.dark
              ? SyntaxHighlighterStyle.darkThemeStyle()
              : SyntaxHighlighterStyle.lightThemeStyle();
      return DartSyntaxHighlighter(style).format(source);
    }else if(source.startsWith(titleStart)&&source.endsWith(imageEnd)){
      style = Theme.of(context).textTheme.body2.copyWith(fontSize: 0.0);
    }else if(source.startsWith(titleURlStart)&&source.endsWith(imageEnd)){
      style=Theme.of(context).textTheme.body2.copyWith(fontSize: 1.0);
    }
    return TextSpan(
      style: style,
      text: source,
    );
  }

  List<Widget> formatWidget(BuildContext context, List<TextSpan> textSpans) {
    List<Widget> widgets = [];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    for (TextSpan span in textSpans) {
      //返回标注
      if (span.style ==
          Theme
              .of(context)
              .textTheme
              .subhead
              .copyWith(fontStyle: FontStyle.italic)) {
        widgets.add(Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isDark ? Colors.black45 : Colors.grey[200],
            border: BorderDirectional(
                start: BorderSide(
              color: Colors.grey,
              width: 3.0,
            )),
          ),
          child: RichText(text: span),
        ));
      } else if (span.style.fontWeight == FontWeight.bold) {
        //返回标题
        widgets.add(Container(
          padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
          alignment: Alignment.centerLeft,
          child: RichText(text: span),
        ));
      } else if (span.style == Theme.of(context).textTheme.body2) {
        //返回table
        Color normal1=isDark?Colors.black:Colors.white;
        Color normal2=isDark?Colors.black45:Colors.grey[200];
        Color borderColor=isDark?Colors.white30:Colors.black87;
        List<String> tableText = span.text.split(table);
        List<Widget> childs = [];
        bool isRow = false;
        bool isTableTitle = true;
        for (int j = 0; j < tableText.length; j++) {
          String text = tableText[j];
          if (text.isEmpty && childs.length == 0) {
            isRow = true;
            childs.add(Divider(height: 10.0,color: Colors.grey,));
          } else if (text.isEmpty && childs.length != 0) {
            isRow = true;
            widgets.add(Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: j%2==0?normal2:normal1,
                border: Border(
                  bottom: BorderSide(
                    color: borderColor,
                    width: 1.0,
                  ),
                  top: BorderSide(
                    color: isTableTitle?borderColor:Colors.transparent,
                    width: 1.0
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: childs,
              ),

            ));
            childs = [];
          } else if (!text.contains('-') && isRow) {
            childs.add(Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.body1.copyWith(
                        fontWeight:
                            isTableTitle ? FontWeight.bold : FontWeight.normal,
                      ),
                ),
              ),
            ));
          } else if (text.contains('-')) {
            isTableTitle=false;
          }
        }
      } else if (span.style == Theme.of(context).textTheme.body1) {
        //返回普通样式
        widgets.add(Container(
          alignment: Alignment.centerLeft,
          child: RichText(text: span),
        ));
      } else if(span.style==Theme.of(context).textTheme.body2.copyWith(fontSize: 0.0)){
        //返回图片加标题
        int tStart=span.text.indexOf(titleStart)+2;
        int tEnd=span.text.indexOf(titleEnd);

        int iStart=span.text.indexOf(imageStart)+1;
        int iEnd=span.text.indexOf(imageEnd);
        String title=span.text.substring(tStart,tEnd);
        String imageAddress=span.text.substring(iStart,iEnd);
        widgets.add(Image.network(imageAddress));
        widgets.add(Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isDark ? Colors.black45 : Colors.grey[200],
            border: BorderDirectional(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                )),
          ),
          child: Text(title),
        ));
      }else if(span.style==Theme.of(context).textTheme.body2.copyWith(fontSize: 1.0)){
        //返回链接
        int tStart=span.text.indexOf(titleURlStart)+1;
        int tEnd=span.text.indexOf(titleEnd);

        int iStart=span.text.indexOf(imageStart)+1;
        int iEnd=span.text.indexOf(imageEnd);
        String title=span.text.substring(tStart,tEnd);
        String address=span.text.substring(iStart,iEnd);
        final TextStyle linkStyle =
        Theme.of(context).textTheme.body2.copyWith(color: Theme.of(context).accentColor);
        widgets.add(RichText(text: _LinkTextSpan(style: linkStyle,text: title,url: address)));
      }else {
        //返回代码块
        widgets.add(Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          color: isDark ? Colors.black45 : Colors.grey[100],
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: RichText(text: span)),
        ));
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: formatWidget(context, formatSpans(context, source)),
        ),
      ),
    );
  }
}
class _LinkTextSpan extends TextSpan {
  _LinkTextSpan({TextStyle style, String url, String text})
      : super(
      style: style,
      text: text ?? url,
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          await launch(url,
              forceSafariVC: true,
              forceWebView: true,
              statusBarBrightness: Brightness.light);
        });
}