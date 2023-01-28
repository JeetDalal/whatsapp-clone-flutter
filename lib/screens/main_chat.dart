import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/utils/messages.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({super.key});

  @override
  State<MainChatScreen> createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as ChatArguments;
    final name = user.name;
    final uid = user.uid;
    // final id = user[0];
    // final name = user[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_camera_front,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://w0.peakpx.com/wallpaper/818/148/HD-wallpaper-whatsapp-background-cool-dark-green-new-theme-whatsapp.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('chats')
                    .doc(uid)
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No messages found. Say Hi'),
                    );
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: snapshot.data!.docs[index]
                                        ['sender_uid'] ==
                                    FirebaseAuth.instance.currentUser!.uid
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              Container(
                                color: Colors.blueGrey[900],
                                child: Text(
                                  snapshot.data!.docs[index]['message'],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 80,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: TextField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    prefixIcon: IconButton(
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('chats')
                                            .doc(uid)
                                            .collection('messages')
                                            .doc()
                                            .set({
                                          'message': _controller.text,
                                          'date': DateTime.now(),
                                          'sender_uid': FirebaseAuth
                                              .instance.currentUser!.uid,
                                          'receiver_uid': uid
                                        });
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(uid)
                                            .collection('chats')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('messages')
                                            .doc()
                                            .set({
                                          'message': _controller.text,
                                          'date': DateTime.now(),
                                          'sender_uid': FirebaseAuth
                                              .instance.currentUser!.uid,
                                          'receiver_uid': uid
                                        });
                                        await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(uid)
                                            .collection('chats')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .set(
                                                {'last_msg': _controller.text});
                                        setState(() {
                                          _controller.text = "";
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.emoji_emotions,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Stack(
//           children: [
//             Positioned(
//               top: 50,
//               left: 20,
//               child: Messages().message(context, false, "Hi! My name is Jeet"),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 0,
//               left: 0,
              // child:
//             ),
//           ],
//         ),