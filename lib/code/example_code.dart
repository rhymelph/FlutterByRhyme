import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbyrhyme/code/code_highlighter.dart';
export 'package:flutterbyrhyme/widgets/paramWidgets.dart';

abstract class ExampleState<T extends StatefulWidget> extends State<T> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey=>_scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ExampleScaffold(
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
                icon: Icon(Icons.info),
                tooltip: 'Show the detail!\n详情',
                onPressed: (){
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

  void _showDetail(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return new Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: new Text(widget.detail,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 18.0
                )
            ),
          )
      );
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(
                  style:
                      const TextStyle(fontSize: 18.0),
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
