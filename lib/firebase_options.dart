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
    apiKey: 'AIzaSyB8X2fYsWgwd5SJj2fP2sxFVOqYk2MHXS0',
    appId: '1:225667019219:web:c5cf1bdf9631fd4ee2ff26',
    messagingSenderId: '225667019219',
    projectId: 'famousplaces3firebase',
    authDomain: 'famousplaces3firebase.firebaseapp.com',
    storageBucket: 'famousplaces3firebase.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5Kn2FbQBzZFBIovKYXd0qrlxOFcQfAvE',
    appId: '1:225667019219:android:9f3ff1594d4ecd66e2ff26',
    messagingSenderId: '225667019219',
    projectId: 'famousplaces3firebase',
    storageBucket: 'famousplaces3firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1yyMiiGrhhgfEAcBpRrhrZq0qNHKQvM8',
    appId: '1:225667019219:ios:702e6443daf7d25ee2ff26',
    messagingSenderId: '225667019219',
    projectId: 'famousplaces3firebase',
    storageBucket: 'famousplaces3firebase.appspot.com',
    iosClientId: '225667019219-sfpa4omqkkgek01uau2drd5no0a0ogvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.famousplaces3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1yyMiiGrhhgfEAcBpRrhrZq0qNHKQvM8',
    appId: '1:225667019219:ios:702e6443daf7d25ee2ff26',
    messagingSenderId: '225667019219',
    projectId: 'famousplaces3firebase',
    storageBucket: 'famousplaces3firebase.appspot.com',
    iosClientId: '225667019219-sfpa4omqkkgek01uau2drd5no0a0ogvr.apps.googleusercontent.com',
    iosBundleId: 'com.example.famousplaces3',
  );
}
