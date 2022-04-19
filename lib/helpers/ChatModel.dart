import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:jobs_ui/helpers/UserData.dart';

class ChatModel {
  Future<void> initFirebaseChatUser() async {
    UserData userData = await UserData.getUserFromPrefs();
    await FirebaseChatCore.instance.createUserInFirestore(
      types.User(
          firstName:
              FirebaseAuth.instance.currentUser!.displayName ?? userData.name,
          id: FirebaseAuth
              .instance.currentUser!.uid, // UID from Firebase Authentication
          imageUrl: FirebaseAuth.instance.currentUser?.photoURL ??
              'https://i.pravatar.cc/300', // URL from Firebase Authentication
          role: types.Role.user),
    );
  }
}
