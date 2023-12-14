import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome To Home",
            style: TextStyle(
              fontSize: 50,color: Colors.blue
            ),
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, "/LoginPage");
              },
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                  print("Successfully signed out");
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Center(
                    child: Text("Sign out",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}

