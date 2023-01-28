import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/main_chat.dart';

import '../widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/main-chat-screen',
                  arguments: ChatArguments(
                    snapshot.data!.docs[index]['name'],
                    snapshot.data!.docs[index].id,
                  ),
                );
              },
              child: ChatTile(name: snapshot.data!.docs[index]['name']),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class ChatArguments {
  final String name;
  final String uid;
  ChatArguments(this.name, this.uid);
}
