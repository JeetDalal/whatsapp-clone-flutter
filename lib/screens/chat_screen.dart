import 'package:flutter/material.dart';

import '../widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        20,
        (index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/main-chat-screen');
          },
          child: const ChatTile(),
        ),
      ),
    );
  }
}
