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
    apiKey: 'AIzaSyBrfkkzO0NUcfg2052IT0SlpxCo7iZwpaM',
    appId: '1:957166738567:web:e414c7a77ad2b9c5c42c22',
    messagingSenderId: '957166738567',
    projectId: 'quizappbe-d6f6d',
    authDomain: 'quizappbe-d6f6d.firebaseapp.com',
    storageBucket: 'quizappbe-d6f6d.appspot.com',
    measurementId: 'G-9BJ0K11RZ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAlQlU6yh0MvTDtjsuZcjZ4ZW2q-uUt3o',
    appId: '1:957166738567:android:3925a5a1530bb52dc42c22',
    messagingSenderId: '957166738567',
    projectId: 'quizappbe-d6f6d',
    storageBucket: 'quizappbe-d6f6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsxysvabXXZdq-nzzJp-7ohJnvdmlSW1o',
    appId: '1:957166738567:ios:fdc6af78247eb0dbc42c22',
    messagingSenderId: '957166738567',
    projectId: 'quizappbe-d6f6d',
    storageBucket: 'quizappbe-d6f6d.appspot.com',
    iosClientId: '957166738567-thebekv4a33flbth2thmddsmp7hjfd9t.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsxysvabXXZdq-nzzJp-7ohJnvdmlSW1o',
    appId: '1:957166738567:ios:7e7527dc83024a52c42c22',
    messagingSenderId: '957166738567',
    projectId: 'quizappbe-d6f6d',
    storageBucket: 'quizappbe-d6f6d.appspot.com',
    iosClientId: '957166738567-cdfs3kl1246dnfg3bt2ith3j01stncq2.apps.googleusercontent.com',
    iosBundleId: 'com.example.frontend.RunnerTests',
  );
}
