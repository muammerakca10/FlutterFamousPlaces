import 'package:famousplaces3/famous_places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'member_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MemberLogin extends StatelessWidget {
  MemberLogin({super.key,});
  TextEditingController memberUsernameController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();
  
  late String email;
  late String password;

  void signInTapped(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    email = memberUsernameController.text;
    password = memberPasswordController.text;

    UserCredential memberLogin = await auth.signInWithEmailAndPassword(email: email, password: password);
    if (memberLogin.user!.emailVerified){
      print("Giris basarili");
      Navigator.push(context, MaterialPageRoute(builder: (context) => FamousPlacesScreen()));
    } else {
      print("Hatali giris");
      print("$memberLogin");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Member Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(child: Column(
            children: [
              SizedBox(height: 50,),
              Text("Member Username"),
              TextField(controller: memberUsernameController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))))),
              SizedBox(height: 80,),
              Text("Member Password"),
              TextField(obscureText: true, controller: memberPasswordController,
               decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))))
               ,),
               SizedBox(height: 40,),
               SizedBox(width: 50,),
               ElevatedButton(onPressed: () => signInTapped(context), child: Text("Login")),
               SizedBox(width: 100,),SizedBox(height: 30,),
              //  TextButton(onPressed: () => yeniKayitTapped(context), child: Text("New Account")),
        
            ],
          )),
        ),
      ),
    );
  }
}