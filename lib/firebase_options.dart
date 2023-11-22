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
    apiKey: 'AIzaSyDOoOJqIcg2Vg5-w2kqWBiFeEYWix327z8',
    appId: '1:512481733378:web:b066ae06e2349b03c9b01b',
    messagingSenderId: '512481733378',
    projectId: 'myshop-27754',
    authDomain: 'myshop-27754.firebaseapp.com',
    storageBucket: 'myshop-27754.appspot.com',
    measurementId: 'G-C07PWSP816',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZT7u1RFr76AAk-hzqyu56nau4TL2I7IQ',
    appId: '1:512481733378:android:b739ca6ca519560cc9b01b',
    messagingSenderId: '512481733378',
    projectId: 'myshop-27754',
    storageBucket: 'myshop-27754.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACO-m2Pbl07VSvvVU51lqTQdApv3zWAws',
    appId: '1:512481733378:ios:944ea3a767859920c9b01b',
    messagingSenderId: '512481733378',
    projectId: 'myshop-27754',
    storageBucket: 'myshop-27754.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACO-m2Pbl07VSvvVU51lqTQdApv3zWAws',
    appId: '1:512481733378:ios:e755568a586ce25dc9b01b',
    messagingSenderId: '512481733378',
    projectId: 'myshop-27754',
    storageBucket: 'myshop-27754.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}