import 'package:flutter/material.dart';
class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebaseState();

}

class _firebaseState extends State<firebase> {
 GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onSaved: (value){
                  _email=value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  labelText: "E-Mail",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: (value) {

                },
                validator: (value){
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                    return 'Enter the valid E-Mail!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onSaved: (value){
                  _password = value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                keyboardType: TextInputType.visiblePassword,
                onFieldSubmitted: (value) {

                },
                validator: (value){
                  if (value!.isEmpty||value.length<8){
                    return 'Enter the valid Password';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: (){
              if(formkey.currentState!.validate());
              formkey.currentState?.save();
              if(_email == "saran@gmail.com" &&
                  _password == "123456789") {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const profile()),
                //       (Route<dynamic> route) => false,
                //);
                return;
              }
              return ;
            },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
