import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main(){
  runApp(uploadPicture());
}
class uploadPicture extends StatefulWidget {
  const uploadPicture({super.key});

  @override
  State<uploadPicture> createState() => _uploadPictureState();
}


class _uploadPictureState extends State<uploadPicture> {
  File? selectedimg;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: (){},
              child: Text("Gallery"),
            ),
            selectedimg != null  ? Image.file(selectedimg!) : Text("abc")
          ],
        ),
      ),
    );
  }
  Gallery()async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedimg = File(img!.path);
    });
  }
}

