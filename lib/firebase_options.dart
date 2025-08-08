import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBaFLDnn4je0B8yRH5dcp4DuVPZut2gG6c',
    authDomain: 'your-actual-project-id.firebaseapp.com', // استبدل بقيمة حقيقية
    projectId: 'your-actual-project-id', // استبدل بقيمة حقيقية
    storageBucket: 'your-actual-project-id.appspot.com', // استبدل بقيمة حقيقية
    messagingSenderId: '123456789012', // استبدل بقيمة حقيقية
    appId: '1:123456789012:web:XXXXXXXXXXXXXXXXXXXXXX', // استبدل بقيمة حقيقية
  );
}