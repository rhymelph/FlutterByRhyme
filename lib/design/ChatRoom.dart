import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String userName; //用户名
  final String uuid; //uuid
  final String avater; //头像
  final int status; //-1禁言0正常1会员2管理员

  User({this.userName, this.uuid, this.avater, this.status});

  String getStatus() {
    switch (status) {
      case -2:
        return '【管理人员】';
      case -1:
        return '【禁言】';
      case 0:
        return '【普通会员】';
      case 1:
        return '【☆尊贵会员☆】';
      case 2:
        return '【★豪华会员★】';
      case 3:
        return '【¤钻石会员¤】';
    }
    return '';
  }

  Color getStatusColor() {
    switch (status) {
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

class ChatRoom extends StatefulWidget {
  static const String routeName = 'design/ChatRoom';

  final User user = User(
    userName: 'rhyme',
    status: 1,
    uuid: '123456',
    avater:
        'https://upload.jianshu.io/users/upload_avatars/12805100/167c0cd2-e801-4232-ad70-fe829e8e8267?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
  );

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> with TickerProviderStateMixin {
  final TextEditingController _controller = new TextEditingController();

  final List<ChatMessage> _message = <ChatMessage>[];

  bool haveText = false;

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: isIOS?CupertinoNavigationBar(
        middle: Text('聊天室',style: Theme.of(context).textTheme.subhead,),
        backgroundColor: isDark?Color(0xCC8F8F8F):Color(0xCCF8F8F8),
          actionsForegroundColor: isDark?CupertinoColors.white:CupertinoColors.activeBlue,
      ):AppBar(
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
  }

  void _handSend() {
    _handSubmitted(_controller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (ChatMessage message in _message) {
      if (message.controller != null) {
        message.controller.dispose();
      }
    }
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final User user;
  final String text;
  final AnimationController controller;

  const ChatMessage({Key key, this.user, this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark=Theme.of(context).brightness==Brightness.dark;

    Widget body = Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avater),
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
                          color: user.getStatusColor(), fontSize: 12.0),
                      text: user.getStatus(),
                    ),
                    TextSpan(
                      style: Theme.of(context).textTheme.subhead,
                      text: user.userName,
                    ),
                  ],
                )),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    color: isDark?Colors.blueGrey:Colors.lightBlueAccent,
                  ),
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Text(text),
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
