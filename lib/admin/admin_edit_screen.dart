import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';


class AdminEditScreen extends StatefulWidget {
  late String placeName;
  late String placeDescription;
  late Map<String,double> coordinates;
  late var image;

  

  AdminEditScreen(this.placeName, this.placeDescription, this.coordinates, this.image);

  @override
  State<AdminEditScreen> createState() => _AdminEditScreenState();
}

class _AdminEditScreenState extends State<AdminEditScreen> {
  //Kaydete basinca update yapacak firebaseden

  TextEditingController latitudeTextController = TextEditingController();
  TextEditingController longitudeTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              widget.placeName,
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.placeDescription,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Image(
                image: AssetImage("images/addicon.png")),
            SizedBox(
              height: 30,
            ),
            Text(
              "Change Coordinates",
            ),
            TextField(
              controller: latitudeTextController,
              decoration: new InputDecoration.collapsed(
                hintText: widget.coordinates["latitude"].toString(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: longitudeTextController,
              decoration: new InputDecoration.collapsed(
                hintText: widget.coordinates["longitude"].toString(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {

              //Degisiklikleri firebase'e uygula
            }, child: Text("Save Changes")),
            SizedBox(
              height: 10,
            ),
            Text(
              "Created by Muammer Akca",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Cancel"))
          ]),
        ),
      ),
    );
  }
}
