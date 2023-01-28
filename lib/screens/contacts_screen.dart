import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/contact_service.dart';

class ContactsSccreen extends StatelessWidget {
  const ContactsSccreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Select Contact"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              title: Text("New Group"),
              leading: CircleAvatar(
                radius: 20,
                child: Center(
                  child: Icon(Icons.people),
                ),
              ),
            ),
            const ListTile(
              title: Text("New Contact"),
              leading: CircleAvatar(
                radius: 20,
                child: Center(
                  child: Icon(Icons.person_add),
                ),
              ),
            ),
            const ListTile(
              title: Text("New Community"),
              leading: CircleAvatar(
                radius: 20,
                child: Center(
                  child: Icon(Icons.emoji_people),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contacts on WhatsApp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data!.docs[index]['name']),
                              leading: CircleAvatar(
                                radius: 20,
                                child: Center(
                                  child: ClipOval(
                                    child: Image.network(
                                      snapshot.data!.docs[index]['imageUrl'],
                                    ),
                                  ),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () async {},
                                icon: const Icon(
                                  Icons.person_add,
                                  color: Colors.green,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
