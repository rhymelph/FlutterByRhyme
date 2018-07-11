import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code_highlighter.dart';


class ExampleScaffold extends StatefulWidget {
  ExampleScaffold(
      {Key key,
        this.scaffoldKey,
        this.title,
        this.actions,
        this.body,
        this.exampleCode})
      : super(key: key);
  final String title;
  final String exampleCode;
  final List<Widget> actions;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  _ExampleScaffoldState createState() => _ExampleScaffoldState();
}

class _ExampleScaffoldState extends State<ExampleScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: (widget.actions ?? <Widget>[])
            ..addAll(<Widget>[
              IconButton(
                  icon: Icon(Icons.description),
                  tooltip: 'Show example code!\n展示示例代码',
                  onPressed: () {
                    _showExampleCode(context);
                  }),
            ]),
        ),
        body: Stack(
          children: <Widget>[
            widget.body,
          ],
        ));
  }
  //显示示例代码
  void _showExampleCode(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute<FullScreenCodeDialog>(
            builder: (BuildContext context) => FullScreenCodeDialog(
              exampleCode: widget.exampleCode,
            )));
  }
}

class FullScreenCodeDialog extends StatefulWidget {
  FullScreenCodeDialog({this.exampleCode});

  final String exampleCode;

  @override
  _FullScreenCodeDialogState createState() => _FullScreenCodeDialogState();
}

class _FullScreenCodeDialogState extends State<FullScreenCodeDialog> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();
    Widget body;
    if (widget.exampleCode == null) {
      body = const Center(
        child: const CircularProgressIndicator(),
      );
    } else {
      body = SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(
                  style:
                      const TextStyle(fontFamily: 'qlYouYuan', fontSize: 18.0),
                  children: <TextSpan>[
                DartSyntaxHighlighter(style).format(widget.exampleCode),
              ])),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              semanticLabel: 'close',
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Tooltip(message: '示例代码', child: const Text('Example Code')),
      ),
      body: body,
    );
  }
}
