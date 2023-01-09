import 'package:famousplaces3/firebase_options.dart';
import 'package:flutter/material.dart';
import 'admin_login.dart';
import 'famous_places.dart';
import 'member_login.dart';
import 'admin_login.dart';
import 'member_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MemberSignup(),
    );
  }
}

