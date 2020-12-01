import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:characters/characters.dart';


class MychatState extends StatefulWidget {
  @override
  _MychatState createState() => _MychatState();
}

class _MychatState extends State<MychatState> {
  var firestoresconnect = FirebaseFirestore.instance;
  String command; 
  var output;
  var authc = FirebaseAuth.instance;

  var color;

// Function to retreive the output of the Linux Commands from the Firebase!
  getData() async {
    var data =
        await firestoresconnect.collection("<Firebase Collection Name>").get();

    for (var i in data.docs) {
      print(i.data());
    }
  }

// Funciton to get the output of the Linux Command running!
  getLinuxOutput(cmd) async {
    var url = "http://192.168.43.40/cgi-bin/web.py?x=myx";
    setState(()async {
       output = await http.get(url);
    });
    
    print(output.body);
    await firestoresconnect
        .collection("Firebase Collection Name")
        .add({command: "date"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linux & Redhat"),// style TextStyle(color: Colors.yellow),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                print("sign off");
                await authc.signOut();
                Navigator.pushNamed(context, "login");
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.amber,
              margin: EdgeInsets.all(40),
              child: TextField(
                onChanged: (value) {
                  command = value;
                },
                autocorrect: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter the Linux Command",
                  prefixIcon: Icon(Icons.code),
                  fillColor: Colors.amber,
                  focusColor: Colors.red,
                ),
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     Container(
            //      child: Image.asset('image/Redhat logo/png',height: 150, width: 120),),],),   
            RaisedButton(
              color: Colors.yellow,
              child: Text(
                "Submit ",
                style: TextStyle(
                  color: Colors.redAccent[200],
                 // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                getLinuxOutput(command);
                print("Output Sent");
              },
            ),
            Container(
              child: Text(
                output == null? "String is there" : output),
            ),])));
}
}







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;



// class MychatState extends StatefulWidget {
//   @override
//   _MychatStateState createState() => _MychatStateState;
//   }
//   class_MychatStateState extends State<MychatState> {
//     var firestoresconnect = FirebaseFirestore.instance;
//   String command;
//   var output;
//   var authc = FirebaseAuth.instance;

// // Function to retreive the output of the Linux Commands fromf the Firebase!
//   getData() async {
//     var data =
//         await firestoresconnect.collection("<Firebase Collection Name>").get();

//     for (var i in data.docs) {
//       print(i.data());
//     }
//   }

// // Funciton to get the output of the Linux Command running!
//   getLinuxOutput(cmd) async {
//     var url = "http://192.168.43.40/cgi-bin/web.py?y=date";
//     var output = await http.get(url);
//     print(output.body);
//     await firestoresconnect
//         .collection("Firebase Collection Name")
//         .add({command: "date"});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Chat Page"),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.close),
//               onPressed: () async {
//                 print("sign off");
//                 await authc.signOut();
//                 Navigator.pushNamed(context, "login");
//               }),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               color: Colors.amber,
//               margin: EdgeInsets.all(20),
//               child: TextField(
//                 onChanged: (value) {
//                   command = value;
//                 },
//                 autocorrect: false,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Enter the Linux Command",
//                   prefixIcon: Icon(Icons.code),
//                   fillColor: Colors.greenAccent,
//                   focusColor: Colors.red,
//                 ),
//               ),
//             ),
//             RaisedButton(
//               color: Colors.greenAccent[100],
//               child: Text(
//                 "Submit ",
//                 style: TextStyle(
//                   color: Colors.redAccent[200],
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               onPressed: () {
//                 getLinuxOutput(command);
//                 print("Output Sent");
//               },
//             ),
//             RaisedButton(
//               color: Colors.amberAccent[100],
//               child: Text(
//                 "Get Linux Commands Output from Firebase!",
//                 style: TextStyle(
//                   color: Colors.redAccent[200],
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "SF Pro",
//                   fontSize: 18,
//                 ),
//               ),
//               onPressed: () {
//                 getData();
//                 print("Output Received!");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

