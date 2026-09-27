import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBpxuQiueWM1cfH6YE4O7Wd8H9jiBAr97M",
            authDomain: "colaborador-job-yxslmx.firebaseapp.com",
            projectId: "colaborador-job-yxslmx",
            storageBucket: "colaborador-job-yxslmx.firebasestorage.app",
            messagingSenderId: "202709336786",
            appId: "1:202709336786:web:6b531b79843a4d493ba30b"));
  } else {
    await Firebase.initializeApp();
  }
}
