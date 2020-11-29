import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';


class Posting extends StatefulWidget {
  @override
  _PostingState createState() => _PostingState();
}

class _PostingState extends State<Posting> {

  File _image = null;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              backgroundColor: Colors.lightGreen,
            onPressed:() {
              getImage(ImageSource.camera);
            },
            label: Text('TAKE A NEW PICTURE')),
            SizedBox(height: 20,),
            FloatingActionButton.extended(
                backgroundColor: Colors.lightGreen,
                onPressed:() {
                  getImage(ImageSource.gallery);
                },
                label: Text('UPLOAD FROM GALLERY')),
            SizedBox(height: 20,),
            Container(
              height: 300,
              width: 300,
              child: _image == null ? Text("No Image") : Image.file(_image),
            ),
            SizedBox(height: 10,),
            Text(DateTime.now().millisecondsSinceEpoch.toString()),


          ],
        ),
      ),
    );
  }
}
