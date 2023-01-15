import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class AdminEditScreen extends StatefulWidget {
  const AdminEditScreen({super.key});

  @override
  State<AdminEditScreen> createState() => _AdminEditScreenState();
}

class _AdminEditScreenState extends State<AdminEditScreen> {
  //Kaydete basinca update yapacak firebaseden

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
              "Yer Adi",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Yer Aciklamasi",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
            SizedBox(
              height: 30,
            ),
            Text("Haritadaki yeri"),

          ]),
        ),
      ),
    );
  }
}
