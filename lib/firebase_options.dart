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
    apiKey: 'AIzaSyCAVyiW9NLpqGfZrmxCt_fXEPnIB_L4Vag',
    appId: '1:306896513056:web:ad82219eb421a811ab7445',
    messagingSenderId: '306896513056',
    projectId: 'jalviks',
    authDomain: 'jalviks.firebaseapp.com',
    storageBucket: 'jalviks.appspot.com',
    measurementId: 'G-VNFQVQL6BY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYiCpoVmNXOvki9JPjJdMp5BgAx1MZtC4',
    appId: '1:306896513056:android:e23e7dbbed20d78fab7445',
    messagingSenderId: '306896513056',
    projectId: 'jalviks',
    storageBucket: 'jalviks.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiQV-g0SlPFKGFUsQ7xTaPYJMk1DzYl8w',
    appId: '1:306896513056:ios:9322c4260faa3f01ab7445',
    messagingSenderId: '306896513056',
    projectId: 'jalviks',
    storageBucket: 'jalviks.appspot.com',
    iosBundleId: 'com.example.jalviks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiQV-g0SlPFKGFUsQ7xTaPYJMk1DzYl8w',
    appId: '1:306896513056:ios:57bcb7ea5305de51ab7445',
    messagingSenderId: '306896513056',
    projectId: 'jalviks',
    storageBucket: 'jalviks.appspot.com',
    iosBundleId: 'com.example.jalviks.RunnerTests',
  );
}
