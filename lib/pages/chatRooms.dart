import 'package:flutter/material.dart';
import 'package:jobs_ui/helpers/ChatModel.dart';

class ChatRooms extends StatefulWidget {
  const ChatRooms({ Key? key }) : super(key: key);

  @override
  State<ChatRooms> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRooms> {
  @override
  Widget build(BuildContext context) {
    ChatModel().InitFirebaseChat();
    return Container(
      
    );
  }
}