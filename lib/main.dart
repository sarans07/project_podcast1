import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:podcast1/Login%20page.dart';
import 'package:podcast1/firebase.dart';
import 'package:podcast1/image.dart';
import 'package:podcast1/profile.dart';
import 'package:podcast1/model.dart';
import 'package:podcast1/sign_up_page.dart';
import 'package:podcast1/spalash_screen.dart';

import 'home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBgFsgdXbr9DUhUut8GPVJMF_CK-GDWmk4",
        appId: "1:654251589612:web:69fe6fc9861268e51b4ac9",
        messagingSenderId: "654251589612",
        projectId: "fir-2071a",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => spalash(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
