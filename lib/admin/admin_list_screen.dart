import 'package:famousplaces3/famous_place_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminListScreen extends StatefulWidget {
  const AdminListScreen({super.key});

  @override
  State<AdminListScreen> createState() => _AdminListScreenState();
}

class _AdminListScreenState extends State<AdminListScreen> {

  List<FamousPlaceModel> list = [FamousPlaceModel("Mevlana", "Mevlana Museum", {1:2}, "image1"),
                                  FamousPlaceModel("Asd", "Asd Museum", {1:2}, "image2"), ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Screen"), centerTitle: true, actions: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.add)),
        IconButton(onPressed: (){

        }, icon: Icon(Icons.logout))
      ],),
      body: Center(
        child: Flexible(
          child: ListView.builder(itemBuilder: ((context, index) {
            return Text(list[index].name!);
          }), itemCount: list.length,),
        ),
      ),

    );
  }
}