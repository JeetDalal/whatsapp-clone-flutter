import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String name;
  const ChatTile({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 20,
        child: Center(
          child: Icon(Icons.person),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.done_all,
            size: 20,
            color: Colors.grey,
          ),
          Text(
            "Hi",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ],
      ),
      trailing: Text(
        "11:00 pm",
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
