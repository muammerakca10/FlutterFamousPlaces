import 'package:flutter/material.dart';


class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});
  TextEditingController adminUsernameController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  void LoginTapped(){
    //Firebase admin giris islemi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Column(
          children: [
            SizedBox(height: 50,),
            Text("Admin username"),
            TextField(controller: adminUsernameController,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))))),
            SizedBox(height: 80,),
            Text("Admin Password"),
            TextField(controller: adminPasswordController,
             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))))
             ,),
             SizedBox(height: 50,),
             SizedBox(width: 50,),
             ElevatedButton(onPressed: LoginTapped, child: Text("Login")),
             SizedBox(height: 30,),
          ],
        )),
      ),
    );
  }
}