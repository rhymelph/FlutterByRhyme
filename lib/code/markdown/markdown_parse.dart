import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';
import 'markdown_label.dart';
import 'markdown_style.dart';
import 'markdown_widget.dart';
class MarkdownParse {

  static List<Widget> parse(
      BuildContext context, MarkDownStyle style, String source) {
    List<Widget> widgets=[];

    StringScanner _scanner = StringScanner(source);
    while (!_scanner.isDone) {
      if (_scanner.scan(RegExp(r'^(#+)(.*)'))) {
        //标题
        Match match=_scanner.lastMatch;

        widgets.add(TitleHeader(style: style,text: source.substring(match.start,match.end),));
      }

      if (_scanner.scan(RegExp(r'(\\[.+\\]\\([^\\)]+\\))|(<.+>)'))) {
        //链接
      }

      if (_scanner.scan(RegExp(r'!\\[[^\\]]+\\]\\([^\\)]+\\)'))) {
        //图片
      }

      if (_scanner.scan(RegExp(r'(\\*\\*|__)(.*?)\\1'))) {
        //粗体
      }

      if (_scanner.scan(RegExp(r'\\~\\~(.*?)\\~\\~'))) {
        //删除线
      }

      if (_scanner.scan(RegExp(r'\n(&gt;|\\>)(.*)'))) {
        //引用
      }

      if (_scanner.scan(RegExp(r'`{1,2}[^`](.*?)`{1,2}'))) {
        //代码块，内联
      }

      if (_scanner.scan(RegExp(r'`^-+$'))) {
        //分割线
      }

      if(_scanner.scan(RegExp(r'```([\\s\\S]*?)```[\\s]?'))){
        //代码块
      }

      if(_scanner.scan(RegExp(r'^[\\s]*[-\\*\\+] +(.*)'))){
        //无序列表
      }
      if(_scanner.scan(r'^[\\s]*[0-9]+\\.(.*)')){
        //有序列表
      }
    }
    return widgets;

  }
}
