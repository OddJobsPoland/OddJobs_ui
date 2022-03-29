import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  List<types.Message> _messages = [];
  final _user = const types.User(id: "r3GrJZsaopR5XpMna0uuHigzcV03");

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75.0,
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Rozmowa z ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
          body: Chat(
            l10n: ChatL10nPl(emptyChatPlaceholder: "Wyslij pierwszą wiadomosc"),
            showUserNames: true,
            showUserAvatars: true,
            theme: DefaultChatTheme(
                inputBorderRadius:
                    BorderRadius.vertical(top: Radius.circular(6)),
                inputBackgroundColor: Color.fromARGB(255, 205, 252, 207),
                inputTextColor: Color.fromARGB(255, 65, 161, 68),
                primaryColor: Color.fromARGB(255, 205, 252, 207),
                sentMessageBodyTextStyle: TextStyle(
                    color: Color.fromARGB(255, 95, 95, 95),
                    fontWeight: FontWeight.bold)),
            messages: _messages,
            onSendPressed: _handleSendPressed,
            user: _user,
          ),
        ),
      ),
    );
  }
}
