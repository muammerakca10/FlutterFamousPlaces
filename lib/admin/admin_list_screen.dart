import 'package:famousplaces3/admin/admin_add_place_screen.dart';
import 'package:famousplaces3/admin/admin_edit_screen.dart';
import 'package:famousplaces3/famous_place_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../login_screen.dart';

class AdminListScreen extends StatefulWidget {
  const AdminListScreen({super.key});

  @override
  State<AdminListScreen> createState() => _AdminListScreenState();
}

class _AdminListScreenState extends State<AdminListScreen> {
  
  //Bu listi firebaseden cek
  //Tiklanan elemanin indexine gore bilgileri Edit Screene aktar
  List<FamousPlaceModel> list = [
    FamousPlaceModel("Mevlana", "Mevlana Museum", {12.0 : 30.0}, "image1"),
    FamousPlaceModel("Asd", "Asd Museum", {40.0 : 50.0}, "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
  ];

  



  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminAddScreen()));
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                auth.signOut();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout Successful")));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminEditScreen(list[index].name!,list[index].info!,list[index].coordinates ,list[index].image)));
                  },
                  child: Text(list[index].name!));
            }),
            itemCount: list.length,
          ),
        ),
      ),
    );
  }
}
