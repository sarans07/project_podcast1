import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podcast1/Login%20page.dart';
import 'package:podcast1/firebase_auth_services.dart';
import 'package:podcast1/form_container_widget.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthServices _auth = FirebaseAuthServices();


  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose(){
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",
                style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue
                ),
              ),
              SizedBox(height: 30),
              FormContainerWidget(
                hintText: "username",
                isPasswordField: false,
                controller: _usernameController,
              ),
              SizedBox(height: 20),
              FormContainerWidget(
                hintText: "E-mail",
                isPasswordField: false,
                controller: _emailController,
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
                  _signUp();
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: isSigningUp ? CircularProgressIndicator(color: Colors.white,): Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white,fontSize: 30
                      ),),
                  ),
                ),
              ),
              Row(
                children: [
                  Text("Already have a account?"),
                  SizedBox(width: 10),
                  GestureDetector(
                    child: Text("Login",
                      style: TextStyle(
                          color: Colors.blue,fontSize: 20
                      ),
                    ),
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),(route) => false);
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


  void _signUp() async{

    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.SignUpWithEmailAndPassword(email, password) ;


    setState(() {
      isSigningUp = false;
    });


    if (user != null){
      print("User is sucessfully created");
      Navigator.pushNamed(context, "/home");
    }else{
      print("Some error happened");
    }

  }

}


