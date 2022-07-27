import 'dart:io';

// _getFromGallery() async {
// PickedFile pickedFile = await ImagePicker().getImage(
//   source: ImageSource.gallery,
//   maxWidth: 1800,
//   maxHeight: 1800,
// );
// if (pickedFile != null) {
// File imageFile = File(pickedFile.path);
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class ImagePic extends StatefulWidget {
  const ImagePic({Key? key}) : super(key: key);

  @override
  State<ImagePic> createState() => _ImagePicState();
}

class _ImagePicState extends State<ImagePic> {
  PickedFile? _image;

  Future getIamgeFromCam() async {
    // for camera
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image!;
    });
  }

  Future getImageFromGallery() async {
    //for Gallery
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        // body: Center(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        color: Color(0xffF0EAD2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: getIamgeFromCam,
              tooltip: 'Pick Image',
              backgroundColor: Color(0xffADC178),
              child: Icon(Icons.add_a_photo),
            ),
            FloatingActionButton(
              onPressed: getImageFromGallery,
              tooltip: 'Pick Image',
              backgroundColor: Color(0xffADC178),
              child: Icon(
                Icons.wallpaper,
              ),
            ),
          ],
          // ),
        ));
  }
}
