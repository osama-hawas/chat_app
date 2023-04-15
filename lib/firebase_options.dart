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
    apiKey: 'AIzaSyCiavPA324cu-LCiOs7nruSx5BgvfFnWm4',
    appId: '1:299540175422:web:2d7601da28e7f008e74f6f',
    messagingSenderId: '299540175422',
    projectId: 'chat-app-c5e7d',
    authDomain: 'chat-app-c5e7d.firebaseapp.com',
    storageBucket: 'chat-app-c5e7d.appspot.com',
    measurementId: 'G-Q41PK5ZP7M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBir7n9tZWsrxhr7hayCUvAWqMTfojgSAc',
    appId: '1:299540175422:android:382a05c5456c35a5e74f6f',
    messagingSenderId: '299540175422',
    projectId: 'chat-app-c5e7d',
    storageBucket: 'chat-app-c5e7d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOe7b6v2kdvOp0eKJaKxO7bc7sHwWJCbk',
    appId: '1:299540175422:ios:016966052874cd54e74f6f',
    messagingSenderId: '299540175422',
    projectId: 'chat-app-c5e7d',
    storageBucket: 'chat-app-c5e7d.appspot.com',
    iosClientId: '299540175422-mbff4nfqskj5v67opb27r4hf40f1g4kn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOe7b6v2kdvOp0eKJaKxO7bc7sHwWJCbk',
    appId: '1:299540175422:ios:016966052874cd54e74f6f',
    messagingSenderId: '299540175422',
    projectId: 'chat-app-c5e7d',
    storageBucket: 'chat-app-c5e7d.appspot.com',
    iosClientId: '299540175422-mbff4nfqskj5v67opb27r4hf40f1g4kn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}