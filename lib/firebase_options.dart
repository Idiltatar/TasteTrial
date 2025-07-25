import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform, kIsWeb;

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
    apiKey: "AIzaSyAscMWBC_AMNumaneRpD4RwZtNMU0AkdUI",
    authDomain: "taste-trail-app.firebaseapp.com",
    projectId: "taste-trail-app",
    storageBucket: "taste-trail-app.appspot.com",
    messagingSenderId: "1071694973148",
    appId: "1:1071694973148:web:00c5a0e987a55aa26e4c19",
    measurementId: "G-CKNJ4VEHM9",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyAscMWBC_AMNumaneRpD4RwZtNMU0AkdUI",
    appId: "1:1071694973148:web:00c5a0e987a55aa26e4c19",
    messagingSenderId: "1071694973148",
    projectId: "taste-trail-app",
    storageBucket: "taste-trail-app.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyAscMWBC_AMNumaneRpD4RwZtNMU0AkdUI",
    appId: "1:1071694973148:web:00c5a0e987a55aa26e4c19",
    messagingSenderId: "1071694973148",
    projectId: "taste-trail-app",
    storageBucket: "taste-trail-app.appspot.com",
    iosClientId: "YOUR_CLIENT_ID_IF_NEEDED",
    iosBundleId: "com.example.touristapp",
  );

  static const FirebaseOptions macos = ios;

  static const FirebaseOptions windows = web;
}
