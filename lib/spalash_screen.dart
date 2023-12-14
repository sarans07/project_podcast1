import 'package:flutter/material.dart';
class spalash extends StatefulWidget {
  final Widget? child;
  const spalash({super.key, this.child});

  @override
  State<spalash> createState() => _spalashState();
}

class _spalashState extends State<spalash> {
  void initState(){
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget.child!), (route) => false);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to Flutter Firebase",
          style: TextStyle(
              color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 40
          ),
        ),
      ),
    );
  }
}
