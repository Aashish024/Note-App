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
    apiKey: 'AIzaSyASOp4NEXRY8MOh3UhtZdzi7cS9E83MJUI',
    appId: '1:106886509988:web:6fabc411a22d4908be7d31',
    messagingSenderId: '106886509988',
    projectId: 'flutterfire2-8ffc2',
    authDomain: 'flutterfire2-8ffc2.firebaseapp.com',
    storageBucket: 'flutterfire2-8ffc2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7vouZfJz8poaeJAOwkMTcRBnWmR-NM44',
    appId: '1:106886509988:android:3a68c8e6ea93d43fbe7d31',
    messagingSenderId: '106886509988',
    projectId: 'flutterfire2-8ffc2',
    storageBucket: 'flutterfire2-8ffc2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3D1bvAdqtCVVTeSrfTzMcYiwup_ksvlA',
    appId: '1:106886509988:ios:d9da19cfede22bf7be7d31',
    messagingSenderId: '106886509988',
    projectId: 'flutterfire2-8ffc2',
    storageBucket: 'flutterfire2-8ffc2.appspot.com',
    iosClientId: '106886509988-aoi4unth56jcta26coua6gd6ilhdonht.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFire2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3D1bvAdqtCVVTeSrfTzMcYiwup_ksvlA',
    appId: '1:106886509988:ios:a48166ecb12c8fa6be7d31',
    messagingSenderId: '106886509988',
    projectId: 'flutterfire2-8ffc2',
    storageBucket: 'flutterfire2-8ffc2.appspot.com',
    iosClientId: '106886509988-f0o9m2tpvgrgom105b82drtqees4qq43.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFire2.RunnerTests',
  );
}