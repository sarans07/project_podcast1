import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podcast1/form_container_widget.dart';
import 'package:podcast1/sign_up_page.dart';

import 'firebase_auth_services.dart';
import 'home_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isSigning = false;
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",
            style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue
            ),
            ),
            SizedBox(height: 30),
            FormContainerWidget(
              controller: _emailController,
              hintText: "E-mail",
              isPasswordField: false,
            ),
            SizedBox(height: 20),
            FormContainerWidget(
              hintText: "Password",
              isPasswordField: true,
              controller: _passwordController,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                _signIn();
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,fontSize: 30
                  ),),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Don't have a account?"),
                SizedBox(width: 10),
                GestureDetector(
                  child: Text("Sign Up",
                    style: TextStyle(
                      color: Colors.blue,fontSize: 20
                    ),
                  ),
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignUpPage()), (route) => false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      print("User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      print("some error occurred");
    }
  }



}
