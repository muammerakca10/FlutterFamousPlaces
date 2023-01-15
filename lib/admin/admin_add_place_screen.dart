import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AdminAddScreen extends StatefulWidget {
  
  const AdminAddScreen({super.key});

  @override
  State<AdminAddScreen> createState() => _AdminAddScreenState();
}

class _AdminAddScreenState extends State<AdminAddScreen> {
  
  List<Marker> isaret = <Marker>[];
  Completer<GoogleMapController> haritaKontrol = Completer();
  var ilkkonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 8);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Screen"), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}