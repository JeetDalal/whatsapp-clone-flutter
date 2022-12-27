// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA_vVoTNzxTCQ-gwhboJBxHcW22z7RfqIk',
    appId: '1:775472184677:web:9774ef906255702e53758c',
    messagingSenderId: '775472184677',
    projectId: 'whtsap-clone',
    authDomain: 'whtsap-clone.firebaseapp.com',
    storageBucket: 'whtsap-clone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgzUnQ2PJzinGSkdwXS9A6TxFA0a8_Bh8',
    appId: '1:775472184677:android:17492e88e324dfca53758c',
    messagingSenderId: '775472184677',
    projectId: 'whtsap-clone',
    storageBucket: 'whtsap-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs3Vb1ZUYFVOw15IMVulQeHYS4UibxrJ0',
    appId: '1:775472184677:ios:214a05e17aafd5c253758c',
    messagingSenderId: '775472184677',
    projectId: 'whtsap-clone',
    storageBucket: 'whtsap-clone.appspot.com',
    iosClientId: '775472184677-n152onkdtv8f226jvmand92ikbddlsce.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs3Vb1ZUYFVOw15IMVulQeHYS4UibxrJ0',
    appId: '1:775472184677:ios:214a05e17aafd5c253758c',
    messagingSenderId: '775472184677',
    projectId: 'whtsap-clone',
    storageBucket: 'whtsap-clone.appspot.com',
    iosClientId: '775472184677-n152onkdtv8f226jvmand92ikbddlsce.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsappClone',
  );
}