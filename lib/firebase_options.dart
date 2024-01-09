import 'package:connect_pets/app/common/utils/keys/Ios_keys.dart';
import 'package:connect_pets/app/common/utils/keys/android_keys.dart';
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: AndroidKeys.apiKey,
    appId: AndroidKeys.appId,
    messagingSenderId: AndroidKeys.messagingSenderId,
    projectId: AndroidKeys.projectId,
    storageBucket: AndroidKeys.storageBucket,
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: IOSKeys.apiKey,
    appId: IOSKeys.appId,
    messagingSenderId: IOSKeys.messagingSenderId,
    projectId: IOSKeys.projectId,
    storageBucket: IOSKeys.storageBucket,
    iosClientId:IOSKeys.iosClientId,
    iosBundleId: IOSKeys.iosBundleId,
  );
}
