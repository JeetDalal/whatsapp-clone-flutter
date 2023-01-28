import 'package:flutter/material.dart';

class Message {
  final String lastMessage;
  final DateTime lastMessageTime;
  final String messageSender;

  Message({
    required this.lastMessage,
    required this.lastMessageTime,
    required this.messageSender,
  });
}

class Messages with ChangeNotifier {
  //Text Widget
  Widget message(BuildContext context, bool isMe, String text) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isMe ? Colors.green[800] : Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Logical Part
  List<Message> _messages = [];

  List<Message> get messages {
    return [..._messages];
  }

  sendMessage(
      String lastMessage, DateTime lastMessageTime, String lastMessageSender) {
    _messages.add(
      Message(
        lastMessage: lastMessage,
        lastMessageTime: lastMessageTime,
        messageSender: lastMessageSender,
      ),
    );
    notifyListeners();
  }
}
