import 'package:famousplaces3/famous_places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'member_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MemberLogin extends StatelessWidget {
  MemberLogin({
    super.key,
  });
  TextEditingController memberUsernameController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();

  String? email;
  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Member Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("Member Username"),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Invalid input";
                      } else {}
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    controller: memberUsernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))))),
                SizedBox(
                  height: 80,
                ),
                Text("Member Password"),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Invalid password";
                    } else {}
                  },
                  onSaved: (newValue) {
                    password = newValue!;
                  },
                  obscureText: true,
                  controller: memberPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                      FirebaseAuth auth = FirebaseAuth.instance;

                      try{UserCredential memberLogin =
                          await auth.signInWithEmailAndPassword(
                              email: email!, password: password!);

                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FamousPlacesScreen()));
                              } catch(e){
                                print(e.toString());
                              }
                    },
                    child: Text("Login")),
                SizedBox(
                  width: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                //  TextButton(onPressed: () => yeniKayitTapped(context), child: Text("New Account")),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
