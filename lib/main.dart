import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/contacts_screen.dart';
import 'package:whatsapp_clone/screens/login.dart';
import 'package:whatsapp_clone/utils/themes.dart';

import 'firebase_options.dart';
import 'screens/home.dart';
import 'screens/main_chat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const Login(),
      routes: {
        '/main-chat-screen': (context) => MainChatScreen(),
        '/contacts-screen': (context) => ContactsSccreen(),
      },
    );
  }
}
