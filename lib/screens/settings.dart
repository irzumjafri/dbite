import 'package:flutter/material.dart';
import 'package:dbite/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Settings extends StatefulWidget {

  String username="";

  Settings({this.username});

  @override
  _SettingsState createState() => _SettingsState(username);
}

class _SettingsState extends State<Settings> {

  String username__="";

  _SettingsState(this.username__);

  // final user_name = TextEditingController();
  final full_name = TextEditingController();
  final password = TextEditingController();
  final description = TextEditingController();
  final date_of_birth = TextEditingController();

  createAlertDialouge(BuildContext context, String texts){
    return showDialog(context: context , builder: (context){
      return AlertDialog(
        title: Text(texts),
        actions: [
          MaterialButton(
            elevation: 5.0,
            child: Text("OK"),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  // String username = "";
  String fullname = "";
  String password_="";
  String desc="";
  String birthday = "";

  Future update_data_name()async{

    var url = "http://192.168.0.103/dbite/editprofilename.php";
    var sendData = {
      "fullname" : fullname,
      "user_id" : username__,
      // "password" : password_,
      // "description": desc,
      // "birth_date": birthday,
      // "validity" : '1',
    };
    print(username__);
    print(fullname);
    var response = await http.post(url, body: sendData);
    //
    // var response1 = await http.post(url1, body: sendData);
    // var data1 = json.decode(response1.body);
    print(response.body);
    // print("-----------------");
    var data = json.decode(response.body);
    print(data);
    // if(data=="account already exist"){
    //   print("Account already exists");
    //   createAlertDialouge(context, "Account already exists");
    // }else{
    //   if(data=="true"){
    //     print("ACCOUNT CREATED");
    //     createAlertDialouge(context, "Account successfully created");
    //   }else{
    //     createAlertDialouge(context, "PLease try with a new email");
    //   }
    // }
  }

  Future update_data_description()async{

    var url = "http://192.168.0.103/dbite/editprofiledescription.php";
    var sendData = {
      "user_id" : username__,
      "description" : desc,
      // "password" : password_,
      // "description": desc,
      // "birth_date": birthday,
      // "validity" : '1',
    };
    print(username__);
    print(desc);
    var response = await http.post(url, body: sendData);
    //
    // var response1 = await http.post(url1, body: sendData);
    // var data1 = json.decode(response1.body);
    print(response.body);
    // print("-----------------");
    var data = json.decode(response.body);
    print(data);
    // if(data=="account already exist"){
    //   print("Account already exists");
    //   createAlertDialouge(context, "Account already exists");
    // }else{
    //   if(data=="true"){
    //     print("ACCOUNT CREATED");
    //     createAlertDialouge(context, "Account successfully created");
    //   }else{
    //     createAlertDialouge(context, "PLease try with a new email");
    //   }
    // }
  }

  Future update_data_password()async{

    var url = "http://192.168.0.103/dbite/editprofilepassword.php";
    var sendData = {
      "user_id" : username__,
      "password" : password_,
      // "password" : password_,
      // "description": desc,
      // "birth_date": birthday,
      // "validity" : '1',
    };
    print(username__);
    print(password_);
    var response = await http.post(url, body: sendData);
    //
    // var response1 = await http.post(url1, body: sendData);
    // var data1 = json.decode(response1.body);
    print(response.body);
    // print("-----------------");
    var data = json.decode(response.body);
    print(data);
    // if(data=="account already exist"){
    //   print("Account already exists");
    //   createAlertDialouge(context, "Account already exists");
    // }else{
    //   if(data=="true"){
    //     print("ACCOUNT CREATED");
    //     createAlertDialouge(context, "Account successfully created");
    //   }else{
    //     createAlertDialouge(context, "PLease try with a new email");
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:  Column(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Text("EDIT PROFILE" , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                  ),
                  ),
                ),
                SizedBox(height: 10 ,),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue[600],
                        // child: _image == null ? Text("No Image") : Image.file(_image),
                      ),
                    )
                ),
                SizedBox(height: 20 ,),
                Padding(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  child: FloatingActionButton.extended(
                      backgroundColor: Colors.pink,
                      onPressed:() {
                        // getImage(ImageSource.gallery);
                      },
                      label: Text('UPLOAD A NEW PICTURE')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text("Enter new full name: ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 30, right: 30),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: full_name,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: FloatingActionButton.extended(
                      onPressed: (){
                        setState(() {
                          // username = user_name.text;
                          password_ = password.text;
                          fullname = full_name.text;
                          desc = description.text;
                        });
                        update_data_name();
                        // Navigator.pop(context);
                        // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                      },
                      label: Text('   CHANGE   '),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text("Enter new Password: ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: password,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: FloatingActionButton.extended(
                      onPressed: (){
                        setState(() {
                          // username = user_name.text;
                          password_ = password.text;
                          fullname = full_name.text;
                          desc = description.text;
                        });
                        update_data_password();
                        // Navigator.pop(context);
                        // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                      },
                      label: Text('   CHANGE   '),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text("Enter description: ", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: description,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: FloatingActionButton.extended(
                          onPressed: (){
                            setState(() {
                              // username = user_name.text;
                              password_ = password.text;
                              fullname = full_name.text;
                              desc = description.text;
                            });
                            update_data_description();
                            // Navigator.pop(context);
                            // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                          },
                          label: Text('   CHANGE   '),
                        ),
                      ),

                    // Padding(
                    //   padding: EdgeInsets.only(top: 10),
                    //   child: Center(
                    //     child: FloatingActionButton.extended(
                    //       onPressed: (){
                    //         Navigator.pop(context);
                    //         // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                    //       },
                    //       label: Text('CANCEL'),
                    //     ),
                    //   ),
                    // )

                ),
                SizedBox(height: 20,),
              ],
            ),

          ),
        ),
    );
  }
}
