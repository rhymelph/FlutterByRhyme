import 'package:flutter/material.dart';
export 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'markdown_dart_code.dart';
import 'package:flutterbyrhyme/code/code_highlighter.dart';
export 'package:flutterbyrhyme/widgets/paramWidgets.dart';
export 'code_highlighter.dart';

abstract class MarkdownState<T extends StatefulWidget> extends State<T>{
  bool showFloatingButton=false;
  final ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (showFloatingButton &&
              notification.metrics.pixels <=
                  MediaQuery.of(context).size.height) {
            setState(() {
              showFloatingButton = notification.metrics.pixels >
                  MediaQuery.of(context).size.height;
            });
          } else if(!showFloatingButton&&
              notification.metrics.pixels >
                  MediaQuery.of(context).size.height){
            setState(() {
              showFloatingButton = notification.metrics.pixels >
                  MediaQuery.of(context).size.height;
            });
          }
          return false;
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              title: Text(getTitle()),
            ),
            SliverToBoxAdapter(
              child: DartMarkDown(getMarkdownSource()),
            ),
          ],
        ),
      ),
      floatingActionButton: showFloatingButton
          ? IconButton(
        onPressed: () {
          _controller.animateTo(0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear);
        },
        color: Theme.of(context).textTheme.title.color,
        icon: Icon(
          Icons.arrow_upward,
        ),
      )
          : null,
    );
  }
  @protected
  String getTitle();

  @protected
  String getMarkdownSource();
}

abstract class ExampleState<T extends StatefulWidget> extends State<T> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  GlobalKey<ExampleScaffoldState> _exampleKey =
      new GlobalKey<ExampleScaffoldState>();

  GlobalKey<ExampleScaffoldState> get exampleKey => _exampleKey;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
      key: _exampleKey,
      scaffoldKey: _scaffoldKey,
      exampleCode: getExampleCode(),
      title: getTitle(),
      detail: getDetail(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child:
                // start
                getWidget(),
          ),
          // end
          Divider(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getSetting(),
            ),
          )),
        ],
      ),
    );
  }

  @protected
  String getTitle();

  @protected
  String getExampleCode();

  @protected
  Widget getWidget();

  @protected
  List<Widget> getSetting();

  @protected
  String getDetail();
}

class ExampleScaffold extends StatefulWidget {
  ExampleScaffold(
      {Key key,
      this.scaffoldKey,
      this.title,
      this.detail,
      this.actions,
      this.body,
      this.exampleCode})
      : super(key: key);
  final String title;
  final String detail;
  final String exampleCode;
  final List<Widget> actions;
  final Widget body;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  ExampleScaffoldState createState() => ExampleScaffoldState();
}

class ExampleScaffoldState extends State<ExampleScaffold> {
  AnimationController controller;
  String content;
  Color nbColor = Colors.transparent;
  Color ntColor = Colors.transparent;
  Color vbColor;
  Color vtColor;
  bool isShowToast = false;
  List<Widget> body;

  void showToast(String content) {
    if(!mounted) return;

    setState(() {
      this.content = content;
      nbColor = this.vbColor;
      ntColor = this.vtColor;
      isShowToast = true;
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      if(!mounted) return;
      setState(() {
        nbColor = Colors.transparent;
        ntColor = Colors.transparent;
        isShowToast = false;
      });
    });
  }

  Widget toastWidget() {
    return Positioned(
      left: 50.0,
      right: 50.0,
      bottom: 20.0,
      child: AnimatedContainer(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
        color: nbColor,
        child: Text(
          content ?? 'hello',
          style: Theme.of(context).textTheme.title.copyWith(color: ntColor),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    vbColor = isDark ? Colors.grey : Colors.black87;
    vtColor = isDark ? Colors.black : Colors.white;
    body = [widget.body];
    if (isShowToast) {
      body.add(toastWidget());
    }
    return Scaffold(
        key: widget.scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: (widget.actions ?? <Widget>[])
            ..addAll(<Widget>[
              IconButton(
                icon: Icon(Icons.info),
                tooltip: 'Show the detail!\n详情',
                onPressed: () {
                  _showDetail(context);
                },
              ),
              IconButton(
                  icon: Icon(Icons.description),
                  tooltip: 'Show example code!\n展示示例代码!',
                  onPressed: () {
                    _showExampleCode(context);
                  }),
            ]),
        ),
        body: Stack(
          children: body,
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

  void _showDetail(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: new Text(widget.detail,
                    textAlign: TextAlign.justify,
                    style: new TextStyle(fontSize: 18.0)),
              ));
        });
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
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: RichText(
                text: TextSpan(
                    style: const TextStyle(fontSize: 18.0),
                    children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(widget.exampleCode),
                ])),
          ),
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

