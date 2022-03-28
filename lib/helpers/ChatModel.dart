import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

class ChatModel {
Future<void> InitFirebaseChat() async {

await FirebaseChatCore.instance.createUserInFirestore(
  types.User(
    firstName: 'John',
    id: FirebaseAuth.instance.currentUser!.uid, // UID from Firebase Authentication
    imageUrl: 'https://i.pravatar.cc/300',
    lastName: 'Doe',
  ),
);
}
}