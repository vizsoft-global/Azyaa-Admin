import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIWau_5YATDBFgOosDbbJwsi_T4mb3kxI",
            authDomain: "azyaa-0uiv4k.firebaseapp.com",
            projectId: "azyaa-0uiv4k",
            storageBucket: "azyaa-0uiv4k.firebasestorage.app",
            messagingSenderId: "657966459097",
            appId: "1:657966459097:web:8bfc90e3c2975019a8f6c8"));
  } else {
    await Firebase.initializeApp();
  }
}
