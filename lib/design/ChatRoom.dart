import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbyrhyme/http/httpManager.dart' as httpManager;
import 'dart:convert';
import 'dart:io';
class ChatMessageData {
  final String id;
  final String msg;
  final DateTime created;
  final String name;
  final int role;

  ChatMessageData(
      this.id,
      this.msg,
      this.name,
      this.role,
      this.created,
      );

  static ChatMessageData formMap(Map map) => ChatMessageData(
      map['id'],
      map['msg'],
      map['name'],
      map['role'],
      DateTime.fromMicrosecondsSinceEpoch(map['created']));

  Map toMap() => {
    "id": id,
    "msg": msg,
    "name": name,
    "created": created.millisecondsSinceEpoch
  };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();

  String getStatus() {
    switch (role) {
      case -2:
        return '【管理】';
      case -1:
        return '【禁言】';
      case 0:
        return '【普通】';
      case 1:
        return '【☆尊贵☆】';
      case 2:
        return '【★豪华★】';
      case 3:
        return '【¤钻石¤】';
    }
    return '';
  }

  Color getStatusColor() {
    switch (role) {
      case 2:
        return Colors.blue;
      case -1:
        return Colors.grey;
      case 0:
        return Colors.black;
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.pink;
    }
    return Colors.white;
  }
}

class User {
  final String userName; //用户名
  final String uuid; //uuid
  final String avatar; //头像
  final int role;

  User({this.userName, this.uuid, this.avatar, this.role});

  String getStatus() {
    switch (role) {
      case -2:
        return '【管理】';
      case -1:
        return '【禁言】';
      case 0:
        return '【普通】';
      case 1:
        return '【☆尊贵☆】';
      case 2:
        return '【★豪华★】';
      case 3:
        return '【¤钻石¤】';
    }
    return '';
  }

  Color getStatusColor() {
    switch (role) {
      case 2:
        return Colors.blue;
      case -1:
        return Colors.grey;
      case 0:
        return Colors.black;
      case 1:
        return Colors.orangeAccent;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.pink;
    }
    return Colors.white;
  }
}

const isOpenNetWork=false;


class ChatRoom extends StatefulWidget {
  static const String routeName = 'design/ChatRoom';

  final User user = User(
    userName: 'rhyme',
    role: 1,
    uuid: '1234',
    avatar:
    'https://upload.jianshu.io/users/upload_avatars/12805100/167c0cd2-e801-4232-ad70-fe829e8e8267?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
  );

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  final List<Widget> _message = <Widget>[];

  bool haveText = false;
  WebSocket socket;

  @override
  void initState() {
    super.initState();
  }

  void login() {
    httpManager.post(
        url: 'http://192.168.1.101:8080/mini/login',
        body: json.encode({
          "username": "rhyme",
          "password": "123456",
        }),
        onSend: () {
          scaffoldKey?.currentState
              ?.showSnackBar(new SnackBar(content: Text('发送请求，连接服务器')));
        },
        onSuccess: (data) {
          WebSocket.connect('ws://192.168.1.101:8080/mini/connect')
              .then((socket) {
            this.socket = socket;
            socket.listen((data) {
              print(data);
              Map map = json.decode(data);
              ChatMessageData msg=ChatMessageData.formMap(map);
              if(msg.id!=widget.user.uuid){
                _handleGetMessage(msg);
              }
            });
            socket.done.then((e){
              scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('连接服务器中断!')));
            });
          });
        },
        onError: (error) {
          print(error);
          scaffoldKey.currentState.showSnackBar(
              new SnackBar(content: Text('连接失败!${error.toString()}')));
        });
  }

  _handleGetMessage(ChatMessageData data) {
    if (data == null) {
      return;
    }
    _controller.clear();
    RChatMessage message = RChatMessage(
      data: data,
      controller: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );
    setState(() {
      _message.insert(0, message);
    });
    if (message.controller != null) {
      message.controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      key: scaffoldKey,
      appBar: isIOS
          ? CupertinoNavigationBar(
        trailing: isOpenNetWork?IconButton(
            icon: Icon(Icons.input),
            onPressed: () {
              if(isOpenNetWork){}
              login();
            }):null,
        middle: Text(
          '聊天室',
          style: Theme.of(context).textTheme.subhead,
        ),
        backgroundColor: isDark ? Color(0xCC8F8F8F) : Color(0xCCF8F8F8),
        actionsForegroundColor:
        isDark ? CupertinoColors.white : CupertinoColors.activeBlue,
      )
          : AppBar(
        actions: isOpenNetWork?<Widget>[
          IconButton(
              icon: Icon(Icons.input),
              onPressed: () {
                login();
              })
        ]:[],
        title: Text('聊天室'),
        elevation: isIOS ? 0.0 : 0.4,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                itemBuilder: (_, int index) => _message[index],
                reverse: true,
                itemCount: _message.length,
                padding: const EdgeInsets.all(8.0),
              )),
          Divider(),
          _buildInputBox(isIOS),
        ],
      ),
    );
  }

  Widget _buildInputBox(bool isIOS) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  haveText = value.isNotEmpty;
                });
              },
              focusNode: FocusNode()..addListener(() {}),
              controller: _controller,
              onSubmitted: _handSubmitted,
              decoration: new InputDecoration.collapsed(hintText: '要说点啥？'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: isIOS
                ? CupertinoButton(
              child: Text('Send'),
              onPressed: haveText ? _handSend : null,
            )
                : IconButton(
              icon: Icon(Icons.send),
              onPressed: haveText ? _handSend : null,
            ),
          )
        ],
      ),
    );
  }

  void _handSubmitted(String value) {
    if (value.isEmpty) {
      return;
    }

    _controller.clear();
    ChatMessage message = ChatMessage(
      user: widget.user,
      text: value,
      controller: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );
    setState(() {
      haveText = false;
      _message.insert(0, message);
    });

    if (message.controller != null) {
      message.controller.forward();
    }
    if(socket!=null){
      socket.add(new ChatMessageData(widget.user.uuid, value, widget.user.userName, widget.user.role, DateTime.now()).toJson());
    }
  }

  void _handSend() {
    _handSubmitted(_controller.text);
  }

  @override
  void dispose() {
    for (Widget message in _message) {
      if (message is ChatMessage) {
        if (message.controller != null) {
          message.controller.dispose();
        }
      } else if (message is RChatMessage) {
        if (message.controller != null) {
          message.controller.dispose();
        }
      }
    }
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final User user;
  final String text;
  final AnimationController controller;

  const ChatMessage(
      {Key key, this.user, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Widget body = Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            style: Theme.of(context).textTheme.subhead.copyWith(
                                color: user.getStatusColor(), fontSize: 10.0),
                            text: user.getStatus(),
                          ),
                          TextSpan(
                            style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 12.0,
                            ),
                            text: user.userName,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    shape: BoxShape.rectangle,
                    color: isDark ? Colors.blueGrey : Colors.lightBlueAccent,
                  ),
                  child: Text(text),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              child: Text(user.userName.substring(0, 1).toUpperCase()),
            ),
          ),
        ],
      ),
    );
    if (controller != null) {
      body = SizeTransition(
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: CurvedAnimation(parent: controller, curve: Curves.easeOut),
          child: body,
        ),
      );
    }
    return body;


  }
}

class RChatMessage extends StatelessWidget {
  final ChatMessageData data;
  final AnimationController controller;

  const RChatMessage({
    Key key,
    this.data,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Widget body = Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            child: CircleAvatar(
              child: Text(data.name.substring(0,1).toUpperCase()),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              color: data.getStatusColor(), fontSize: 10.0),
                          text: data.getStatus(),
                        ),
                        TextSpan(
                          style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 12.0
                          ),
                          text: data.name,
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    shape: BoxShape.rectangle,
                    color: isDark ? Colors.blueGrey : Colors.lightBlueAccent,
                  ),
                  child: Text(data.msg),
                )
              ],
            ),
          ),
        ],
      ),
    );
    if (controller != null) {
      body = SizeTransition(
        sizeFactor: CurvedAnimation(parent: controller, curve: Curves.easeOut),
        axisAlignment: -1.0,
        child: FadeTransition(
          opacity: CurvedAnimation(parent: controller, curve: Curves.easeOut),
          child: body,
        ),
      );
    }
    return body;
  }
}
