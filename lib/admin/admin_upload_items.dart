import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminUploadItems extends StatefulWidget {
  const AdminUploadItems({super.key});

  @override
  State<AdminUploadItems> createState() => _AdminUploadItemsState();
}

class _AdminUploadItemsState extends State<AdminUploadItems> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImageFile;

  captureImageWithPhoneCamera() async {
    pickedImageFile = await _picker.pickImage(source: ImageSource.camera);

    Get.back();

    setState(() {
      pickedImageFile;
    });
  }

  pickImageFromPhoneGallery() async {
    pickedImageFile = await _picker.pickImage(source: ImageSource.gallery);

    Get.back();

    setState(() {
      pickedImageFile;
    });
  }

  showDialogBoxForImagePickimgAndCapturing() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          title: Text(
            "Item Image",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                captureImageWithPhoneCamera();
              },
              child: Text(
                "Capture with Phone Camera",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                pickImageFromPhoneGallery();
              },
              child: Text(
                "Pick Image from phone gallery",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget uploadItemFormScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(
                  File(
                    pickedImageFile!.path,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget defaultScreen() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black54,
                Colors.deepPurple,
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome Admin",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.deepPurple,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate,
                color: Colors.white54,
                size: 200,
              ),
              Material(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(30),
                child: InkWell(
                  onTap: () {
                    showDialogBoxForImagePickimgAndCapturing();
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 28,
                    ),
                    child: Text(
                      "Add New Item",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return pickedImageFile == null ? defaultScreen() : uploadItemFormScreen();
  }
}
