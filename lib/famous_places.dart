import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FamousPlacesScreen extends StatefulWidget {
  const FamousPlacesScreen({super.key});

  @override
  State<FamousPlacesScreen> createState() => _FamousPlacesScreenState();
}

class _FamousPlacesScreenState extends State<FamousPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konya Famous Places")),
      body: Text("Famous"),
    );
  }
}
