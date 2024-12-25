// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAzbMGeIypzvGdzBDPMzyxe_S1jHm4Cr88',
    appId: '1:1041136925927:web:0ae5c880df87aafe7df642',
    messagingSenderId: '1041136925927',
    projectId: 'atelier4-fz-amejoud-iir5g6',
    authDomain: 'atelier4-fz-amejoud-iir5g6.firebaseapp.com',
    storageBucket: 'atelier4-fz-amejoud-iir5g6.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCa46hhriewU8wpsJ0sYR0fASsuLkf4GFc',
    appId: '1:1041136925927:android:fd67b5a1258d919b7df642',
    messagingSenderId: '1041136925927',
    projectId: 'atelier4-fz-amejoud-iir5g6',
    storageBucket: 'atelier4-fz-amejoud-iir5g6.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZh8y60eOLNd_3xLIQg5RoWzHgkLUo01A',
    appId: '1:1041136925927:ios:011ab174279b99577df642',
    messagingSenderId: '1041136925927',
    projectId: 'atelier4-fz-amejoud-iir5g6',
    storageBucket: 'atelier4-fz-amejoud-iir5g6.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

}