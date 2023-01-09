import 'package:flutter/material.dart';
import 'member_login.dart';
import 'admin_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MemberSignup extends StatelessWidget {
  MemberSignup({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController memberUsernameController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();
  TextEditingController memberPasswordAgainController = TextEditingController();


  void signUpTapped() async {
      String email = memberUsernameController.text;
      String password = memberPasswordController.text;
      String passwordAgain = memberPasswordAgainController.text;

      try {
        UserCredential newMemberIdentify = await auth.createUserWithEmailAndPassword(email: email, password: password);
        var member = newMemberIdentify.user;
        //await member!.sendEmailVerification();

        //print("New Member is ${member.toString()}");
      } catch(e){
        print("hata : $e");
      }

    
  }

  void memberLoginTapped(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MemberLogin(),
        ));
  }

  void adminLoginTapped(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AdminLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Member Signup Screen")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text("Member Username"),
                TextField(
                    controller: memberUsernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32))))),
                SizedBox(
                  height: 60,
                ),
                Text("Member Password"),
                TextField(
                  obscureText: true,
                  controller: memberPasswordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
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
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                          onPressed: signUpTapped, child: Text("Sign Up")),
                      SizedBox(
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () => memberLoginTapped(context),
                        child: Text("Member Login"),
                        style: ButtonStyle(alignment: Alignment.centerRight),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () => adminLoginTapped(context),
                  child: Text("Admin Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}