import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:dbite/model_classes/url.dart';


class Posting extends StatefulWidget {

  String username="";

  Posting({this.username});
  @override
  _PostingState createState() => _PostingState(username);
}

class _PostingState extends State<Posting> {

  String username="";

  _PostingState(this.username);

  File _image = null;
  Future<File> file;
  String status = '';
  String base64Image;
  File tempFile;
  String error = 'Error';

  String post_id;
  String post_description ;
  TextEditingController post_description_controller = TextEditingController();


  chooseImage(){
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);

    });
    setStatus('');
  }

  uploadImg(){
    // print("enter1");
    if(null==tempFile){
      setStatus(error);
      return;
    }
    String fileName = tempFile.path.split('/').last;
    upload(fileName);
    // print("exit1");
  }

  upload(String fileName){
    // print("enter2");
    http.post('http://'+URL+'/dbite/uploadPost.php' , body: {
      "image" : base64Image,
      "name" : fileName,
      "post_id" : post_id,
      "post_description" : post_description,
      "username" : username,
    }).then((result) {
      setStatus(result.statusCode==200?result.body:error);
      
    }).catchError((error){
      setStatus(error);
    });
    // print("exit2");
  }

  setStatus(String message){
    setState(() {
      status = message;
    });
  }

  String timerr() {
    var temp =  DateTime.now().millisecondsSinceEpoch.toString();
    return temp;
  }

  void setPostid(){
    setState(() {
      post_id = username+ '|' + timerr();
    });
  }

  void setPostDescription(){
    setState(() {
      post_description = post_description_controller.text;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text("POST STATUS:" , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              )
            ),
            Container(
              child: Padding(
                padding:EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter any description',
                    ),
                    controller: post_description_controller,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: FutureBuilder<File>(
                future: file,
                builder: (BuildContext context, AsyncSnapshot<File> snapshot){
                  if(snapshot.connectionState==ConnectionState.done && null!= snapshot.data){
                    tempFile = snapshot.data;
                    base64Image = base64Encode(snapshot.data.readAsBytesSync());
                    return Image.file(snapshot.data);

                  }else{
                    if(null!=snapshot.error){
                      return Text('Error');
                    }else{
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("UPLOAD THE IMAGE HERE"),
                          ),
                          InkWell(
                            onTap: (){
                              chooseImage();
                            },
                            child: Icon(Icons.file_upload),
                          )

                        ],
                      );
                    }
                  }
                },),
            ),
            SizedBox(height: 10,),
            FlatButton(
              color: Colors.black,
              child: Text("UPLOAD IMAGE"),
              textColor: Colors.white,
              onPressed: (){
                setPostid();
                setPostDescription();
                uploadImg();
                Navigator.pop(context);
                // print("pressed funjgj");

                // print(username);
              },
            )
          ],
        ),
      )
    );
  }
}
