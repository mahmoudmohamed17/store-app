// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBFhCqbXK-jlsST2YYR2sm-siK4o1R7iVo',
    appId: '1:863841473327:web:8556248ee79329b7d347da',
    messagingSenderId: '863841473327',
    projectId: 'store-app-176d1',
    authDomain: 'store-app-176d1.firebaseapp.com',
    storageBucket: 'store-app-176d1.appspot.com',
    measurementId: 'G-MMSRD4BLQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_nLywgagIyRQniK7sNWEeNSGF-QvYuJc',
    appId: '1:863841473327:android:c192785f006179e2d347da',
    messagingSenderId: '863841473327',
    projectId: 'store-app-176d1',
    storageBucket: 'store-app-176d1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvw6hQ3RX3ZiSoP0YZn3ZTtiwLl-3ht-Q',
    appId: '1:863841473327:ios:ece7e53b833d9c06d347da',
    messagingSenderId: '863841473327',
    projectId: 'store-app-176d1',
    storageBucket: 'store-app-176d1.appspot.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvw6hQ3RX3ZiSoP0YZn3ZTtiwLl-3ht-Q',
    appId: '1:863841473327:ios:ece7e53b833d9c06d347da',
    messagingSenderId: '863841473327',
    projectId: 'store-app-176d1',
    storageBucket: 'store-app-176d1.appspot.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFhCqbXK-jlsST2YYR2sm-siK4o1R7iVo',
    appId: '1:863841473327:web:8940b9e053991c73d347da',
    messagingSenderId: '863841473327',
    projectId: 'store-app-176d1',
    authDomain: 'store-app-176d1.firebaseapp.com',
    storageBucket: 'store-app-176d1.appspot.com',
    measurementId: 'G-275M34K141',
  );
}
