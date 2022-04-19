import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  final types.Room room;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void _handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.ImageMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        final client = http.Client();
        final request = await client.get(Uri.parse(message.uri));
        final bytes = request.bodyBytes;
        final documentsDir = (await getApplicationDocumentsDirectory()).path;
        localPath = '$documentsDir/${message.name}';

        if (!File(localPath).existsSync()) {
          final file = File(localPath);
          await file.writeAsBytes(bytes);
        }
      }
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, widget.room.id);
  }

  void _handleSendPressed(types.PartialText message) {
    FirebaseChatCore.instance.sendMessage(
      message,
      widget.room.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "${widget.room.name}",
          style: TextStyle(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.w900),
        ),
      ),
      body: StreamBuilder<types.Room>(
        initialData: widget.room,
        stream: FirebaseChatCore.instance.room(widget.room.id),
        builder: (context, snapshot) {
          return StreamBuilder<List<types.Message>>(
            initialData: const [],
            stream: FirebaseChatCore.instance.messages(snapshot.data!),
            builder: (context, snapshot) {
              return SafeArea(
                bottom: false,
                child: Chat(
                  l10n: ChatL10nPl(
                      emptyChatPlaceholder: "Wyslij pierwszą wiadomosc"),
                  showUserNames: true,
                  showUserAvatars: true,
                  disableImageGallery: true,
                  emojiEnlargementBehavior: EmojiEnlargementBehavior.multi,
                  hideBackgroundOnEmojiMessages: false,
                  theme: DefaultChatTheme(
                      deliveredIcon: Icon(Icons.check_circle_outline_rounded),
                      messageInsetsVertical: 12,
                      userAvatarNameColors: [Colors.black],
                      inputBorderRadius:
                          BorderRadius.vertical(top: Radius.circular(6)),
                      inputBackgroundColor: Color.fromARGB(255, 205, 252, 207),
                      inputTextColor: Color.fromARGB(255, 65, 161, 68),
                      primaryColor: Color.fromARGB(255, 205, 252, 207),
                      sentMessageBodyTextStyle: TextStyle(
                          color: Color.fromARGB(255, 95, 95, 95),
                          fontWeight: FontWeight.bold)),
                  messages: snapshot.data ?? [],
                  onMessageTap: _handleMessageTap,
                  onPreviewDataFetched: _handlePreviewDataFetched,
                  onSendPressed: _handleSendPressed,
                  user: types.User(
                    id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
