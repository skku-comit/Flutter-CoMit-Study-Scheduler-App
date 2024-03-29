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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCr9yqtY35F_d4hyTzBgxfOMQFTI_y44r8',
    appId: '1:1015719228075:web:9605ae239f56d44c27fdee',
    messagingSenderId: '1015719228075',
    projectId: 'study-scheduler-3f24d',
    authDomain: 'study-scheduler-3f24d.firebaseapp.com',
    storageBucket: 'study-scheduler-3f24d.appspot.com',
    measurementId: 'G-DQKFWX7FG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEyp0P_I3C1DTZsUM3FZdX74NeX6Gd-O8',
    appId: '1:1015719228075:android:cf21fa26e7ceda7227fdee',
    messagingSenderId: '1015719228075',
    projectId: 'study-scheduler-3f24d',
    storageBucket: 'study-scheduler-3f24d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKuTxWwsgQxjIn5JTnsvDOeWAAqD9wUkE',
    appId: '1:1015719228075:ios:0a84898693682cc527fdee',
    messagingSenderId: '1015719228075',
    projectId: 'study-scheduler-3f24d',
    storageBucket: 'study-scheduler-3f24d.appspot.com',
    androidClientId: '1015719228075-tesoti6cq4fgej7g3ggg5av5nnvas6at.apps.googleusercontent.com',
    iosClientId: '1015719228075-bd56tqn9oscbkeign1ri1lkk1v0ncafv.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterComitStudySchedulerApp',
  );
}
