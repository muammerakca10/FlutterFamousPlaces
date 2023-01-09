import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'member_signup.dart';


class MemberLogin extends StatelessWidget {
  MemberLogin({super.key,});
  TextEditingController memberUsernameController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();

  void signInTapped(){
    //Firebase giris islemi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Member Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
             SizedBox(height: 50,),
             SizedBox(width: 50,),
             ElevatedButton(onPressed: signInTapped, child: Text("Login")),
             SizedBox(width: 100,),SizedBox(height: 30,),
            //  TextButton(onPressed: () => yeniKayitTapped(context), child: Text("New Account")),

          ],
        )),
      ),
    );
  }
}