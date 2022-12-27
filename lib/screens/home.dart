import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/call_screen.dart';
import 'package:whatsapp_clone/screens/chat_screen.dart';
import 'package:whatsapp_clone/screens/community_screen.dart';
import 'package:whatsapp_clone/screens/status_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xff128C7E),
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
        body: NestedScrollView(
          body: const TabBarView(children: [
            CommunityScreen(),
            ChatScreen(),
            StatusScreen(),
            CallsScreen(),
          ]),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.grey),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ),
                ],
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.people),
                    ),
                    Tab(
                      text: "CHATS",
                    ),
                    Tab(
                      text: "STATUS",
                    ),
                    Tab(
                      text: "CALLS",
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}