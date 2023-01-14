import 'package:famousplaces3/admin/admin_list_screen.dart';
import 'package:famousplaces3/member/member_famous_places.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
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

                      try {
                        UserCredential memberLogin =
                            await auth.signInWithEmailAndPassword(
                                email: email!, password: password!);
                        if (email == "admin@gmail.com") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminListScreen()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FamousPlacesScreen()));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Hata + $e")));
                        print(e.toString());
                      }
                    },
                    child: Text("Login")),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MemberSignup(),
                          ));
                    },
                    child: Text("New Account")),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
