import 'package:famousplaces3/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FamousPlacesScreen extends StatefulWidget {
  const FamousPlacesScreen({super.key});

  @override
  State<FamousPlacesScreen> createState() => _FamousPlacesScreenState();
}

class _FamousPlacesScreenState extends State<FamousPlacesScreen> {
  
  FirebaseAuth auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Famous Places"), centerTitle: true, actions: [
        IconButton(onPressed: (){
          if(auth.currentUser != null){
            auth.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            print(auth.currentUser);
          } else {
            print("Error");
          }
        }, icon: Icon(Icons.logout))
      ],),
      body: Center(child: Text("Famous")),
    );
  }
}
