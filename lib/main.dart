import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_x_firebase/auth/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAEOWw03TkIXy8z-rOtP4QejWuVfBeQC58",
        authDomain: "AIzaSyAEOWw03TkIXy8z-rOtP4QejWuVfBeQC58.firebaseapp.com",
        projectId: "AIzaSyAEOWw03TkIXy8z-rOtP4QejWuVfBeQC58",
        storageBucket: "AIzaSyAEOWw03TkIXy8z-rOtP4QejWuVfBeQC58.appspot.com",
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
        appId: "1:746515235078:android:554f655941a3df9c65de87",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Android & iOS can use default
  }
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}
