import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController memberUsernameController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();
  TextEditingController memberPasswordAgainController = TextEditingController();

  late String email;
  late String password;
  late String passwordAgain;

  void signUpTapped(BuildContext context) async {
    email = memberUsernameController.text;
    password = memberPasswordController.text;
    passwordAgain = memberPasswordAgainController.text;

    try {
      UserCredential newMemberIdentify = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      var member = newMemberIdentify.user;
      //await member!.sendEmailVerification();

      print("New Member is ${member.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Kayit yapildi, Giris Ekranina yonlendiriliyorsunuz"),
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } catch (e) {
      print("hata : $e");
    }
  }

  void memberLoginTapped(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Member Signup Screen")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("Member Username"),
                  TextFormField(
                      onSaved: (value) {},
                      controller: memberUsernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))))),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Member Password"),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Invalid input";
                      } else {}
                    },
                    obscureText: true,
                    controller: memberPasswordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)))),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text("Member Password Again"),
                  TextField(
                    obscureText: true,
                    controller: memberPasswordAgainController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => signUpTapped(context),
                      child: Text("Sign Up")),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () => memberLoginTapped(context),
                    child: Text("Member Login"),
                    style: ButtonStyle(alignment: Alignment.centerRight),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
