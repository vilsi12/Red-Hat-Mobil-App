import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



//import 'package:flutter/src/material/icons.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var authc = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Container(
          width: 300,
           margin: EdgeInsets.all(40),
         
          child: Column(
         
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Image.asset("assets/Redhat logo.png",height: 160, width:70),
              Image.asset("assets/firebase-logo.png",height: 60, width:100),
               
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  icon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  icon: Icon(Icons.lock_open),
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
                child: MaterialButton(
                  minWidth: 200,
                  height: 25,
                  child: Text('Login'),
                  onPressed: () async {
                    try {
                      var userSignin = await authc.signInWithEmailAndPassword(
                          email: email, password: password);
                      print(userSignin);

                      if (userSignin != null) {
                        Navigator.pushNamed(context, "chatState");
                      }
                    } catch (e) {
                      print(e);
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
