import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Registration'),
        backgroundColor: Colors.red,
          ),
          body: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              // Image.asset("assets/Redhat logo.png"),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Email",icon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 // children: <Widget>[
              //     TextField(
              //       keyboardType: TextInputType.emailAddress,
              //   onChanged: (value) {
              //     email = value;
              //   },
              //   decoration: InputDecoration(
              //     hintText: "User ",icon: Icon(Icons.mail),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(20),
                    
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",icon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                // Image.asset("assets/Redhat logo.png");
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('Submit'),
                  onPressed: () async {
                    try {
                      var user = await authc.createUserWithEmailAndPassword(
                       email: email,
                       password: password,
                      );
                      print(email);
                      print(password);
                  

                      if (user.additionalUserInfo.isNewUser == true) {
                        Navigator.pushNamed(context, "chatState");
                      }
                    } catch (e) {
                      print(e);
                     
              //          Row(
              // children: <Widget>[
              //   Container(
              //    child: Image.asset('assets/Redhat logo.png',height: 80, width:45),),],);
                    }
                  },
                ),
              ),
            ],
          ),   
        ),
      ),
    );
  }
}
