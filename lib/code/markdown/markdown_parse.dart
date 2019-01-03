import 'package:flutter/material.dart';
import 'package:string_scanner/string_scanner.dart';
import 'markdown_style.dart';
import 'markdown_widget.dart';

class MarkdownParse {
  //邮件验证
  final String emailer = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

  //手机号验证
  final String phoner = r"^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";

  static List<Widget> parse(
      BuildContext context, MarkDownStyle style, String source) {
    List<Widget> widgets = [];
    List<ContentStyle> conStyles = [];

    StringScanner _scanner = StringScanner(source);
    bool isContent = false;

    int lastPosition=_scanner.position;

    while (!_scanner.isDone) {

      _scanner.scan(new RegExp(r'\s+'));


      if (_scanner.scan(RegExp(r'^(#+)(.*)'))) {
        //标题
        Match match = _scanner.lastMatch;
        widgets.add(TitleHeader(
          style: style,
          text: source.substring(match.start, match.end),
        ));
        break;
      }
      if (_scanner.scan(RegExp(r'>(.*)'))) {
        //引用
        Match match=_scanner.lastMatch;
        widgets.add(QuoteWidget(
          style: style,
          text: source.substring(match.start,match.end),
        ));
      }
      if (_scanner.scan(RegExp(r'~~(.*?)~~'))) {
        //删除线
      }
      if (_scanner.scan(RegExp(r'\[(.*?)]\(([a-zA-z]+://[^\s]*)\)'))) {
        //链接
      }

      if (_scanner.scan(RegExp(r'!\[(.*?)]\(([a-zA-z]+://[^\s]*)\)'))) {
        //图片
      }

      if (_scanner.scan(RegExp(r'\*\*(.*?)\*\*'))) {
        //粗体
      }

      if (_scanner.scan(RegExp(r'`{1,2}[^`](.*?)`{1,2}'))) {
        //代码块，内联
      }

      if (_scanner.scan(RegExp(r'^-+$'))) {
        //分割线
      }

      if (_scanner.scan(RegExp(r'```([\s\S]*?)```[\s]?'))) {
        //代码块
      }

      if (_scanner.scan(RegExp(r'^[s]*[-*+]+(.*)'))) {
        //无序列表
        Match match=_scanner.lastMatch;
        widgets.add(DisOrderWidget(
          style: style,
          text: source.substring(match.start, match.end),
        ));
      }
      if (_scanner.scan(r'^[\s]*[0-9]+\.(.*)')) {
        //有序列表
      }
      // Check if this loop did anything
      if (lastPosition == _scanner.position) {
        // Failed to parse this file, abort gracefully
        return widgets;
      }
      lastPosition = _scanner.position;
    }
    return widgets;
  }
}
