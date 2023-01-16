import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';




class AdminAddScreen extends StatefulWidget {
  
  const AdminAddScreen({super.key});

  

  @override
  State<AdminAddScreen> createState() => _AdminAddScreenState();
}

class _AdminAddScreenState extends State<AdminAddScreen> {

  //late File yuklenecekdosya;

  
  
  List<Marker> isaret = <Marker>[];
  Completer<GoogleMapController> haritaKontrol = Completer();
  var ilkkonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 8);
  
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Admin Screen"), centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text("Place name"),
              TextField(controller: nameController,),
              SizedBox(height: 30,),
              Text("Place Description"),
              TextField(controller: descriptionController,),
              SizedBox(height: 30,),
              Image(image: AssetImage('images/addicon.png')),
              ElevatedButton(onPressed: (){}, child: Text("Select Image")),
              SizedBox(height: 30,),
              
              Text("Haritadaki yerini seciniz"),
              SizedBox(
                width: 400,
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: ilkkonum,
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    haritaKontrol.complete(controller);
                  },
                  markers: Set<Marker>.of(isaret),
                ),
              ),
              SizedBox(height : 10),
              ElevatedButton(onPressed: (){}, child: Text("Kaydet")),
            ],
          ),
        ),
      ),
    );
  }
}