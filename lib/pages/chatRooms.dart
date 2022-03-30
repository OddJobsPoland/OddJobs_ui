import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jobs_ui/helpers/ChatModel.dart';
import 'package:jobs_ui/pages/chats.dart';

class ChatRooms extends StatefulWidget {
  const ChatRooms({Key? key}) : super(key: key);

  @override
  State<ChatRooms> createState() => _ChatRoomsState();
}

class _ChatRoomsState extends State<ChatRooms> {
  @override
  Widget build(BuildContext context) {
    ChatModel().initFirebaseChat();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Rozmowy",
          style: TextStyle(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView.separated(
        itemCount: 1,
        itemBuilder: (context, index) => Slidable(
          // Specify a key if the Slidable is dismissible.
          key: const ValueKey(0),
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const ScrollMotion(),
            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {}),
            // All actions are defined in the children parameter.
            children: const [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
              ),
            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: const ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 2,
                onPressed: null,
                backgroundColor: Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.archive,
                label: 'Archive',
              ),
              SlidableAction(
                onPressed: null,
                backgroundColor: Color(0xFF0392CF),
                foregroundColor: Colors.white,
                icon: Icons.save,
                label: 'Save',
              ),
            ],
          ),
          child: GestureDetector(
            child: Container(
              color: Colors.blueGrey,
              child: Column(
                children: [
                  Text("Drogerie Natura"),
                  Text("Pragniemy panu pogratulowac...")
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Chats()),
              );
            },
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 24.0),
      ),
    );
  }
}
