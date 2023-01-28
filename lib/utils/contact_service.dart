import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Contacts {
  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> ChatList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
    );
  }
}
