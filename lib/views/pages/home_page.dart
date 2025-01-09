// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker picker = ImagePicker();
  late Future<PickedFile?> pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Photo Editor App",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Stack(children: [
          Image.asset(
            "assets/images/bg.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final XFile? image = await picker
                    .pickImage(source: ImageSource.gallery)
                    .whenComplete(() => setState(() {}));
                if (image != null) {
                  final bytes = await image.readAsBytes();
                  Get.to(
                    ImageEditor(image: bytes // <-- Uint8List of image

                        ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
