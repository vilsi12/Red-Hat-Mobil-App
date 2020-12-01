//import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';
import 'reg.dart';
import 'chat.dart';
//import 'Myimage_cam.dart';

 void main() {
   WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();

   runApp(
    MaterialApp(

      initialRoute: "home", 
      routes: {
       // "liquid_swipe":  (context) => MyliquidSwipe(),
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "chatState": (context) => MychatState(),
        
       // "MyImage_cam":(context) => MyImage(),
      },
    ),
  );
 }

