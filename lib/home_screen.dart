
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
  File? _image;
 final imagePicker =ImagePicker();
 Future getImage()
 async{
   final image = await imagePicker.pickImage(source: ImageSource.camera);
   setState(() {
     _image = File(image!.path);
     GallerySaver.saveImage(_image!.path);
   });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(
        "Camera"
      ),
    ),
      body: Center(
        child: _image == null ? Text("No Image Selected") : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Increment",
        child: Icon(Icons.camera),
      ),
    );
  }
}

