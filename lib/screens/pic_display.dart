import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:dbite/model_classes/url.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as ImageProcess;


class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {

  // Uint8List _byteImage = null;
  //
  // var finalimage = Io.File("aa.png");
  // bool show = false;

  String imageUrl=null;




  Future get_picture()async{
    var url = "http://"+URL+"/dbite/getPost.php";
    var sendData = {
      "user_id" :'ali',

    };
    var response = await http.post(url, body: sendData);
    print("-------------");
    var data = json.decode(response.body);
    print(data);
    setState(() {
      imageUrl = data;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: imageUrl==null?Text("No Image") : Container(
                child: Column(
                  children: [
                    Text("Image found"),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.network("http://"+URL+"/dbite/"+imageUrl,
                          fit: BoxFit.fitHeight,),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          FlatButton(

            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            child: Text(
              "Display Image",
              style: TextStyle(fontSize: 20.0),
            ),

            onPressed: (){
              setState(() {
                get_picture();

              });

            },
          ),
        ],
      )
    );
  }
}
