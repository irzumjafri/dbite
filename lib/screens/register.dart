import 'package:flutter/material.dart';
import 'package:dbite/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dbite/model_classes/url.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final full_name = TextEditingController();
  final user_name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone_number = TextEditingController();

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



  String fullname = "";
  String username = "";
  String _email="";
  String _password="";
  String phonenumber="";

  int group =0;
  String gender = "";

  Future register()async{

    var url = "http://"+URL+"/dbite/register.php";
    var sendData = {
      "fullname" : fullname,
      "user_id" : username,
      "email" : _email,
      "password" : _password,
      "phonenumber" : phonenumber,
      "validity" : '1',
    };

    var response = await http.post(url, body: sendData);

    var data = json.decode(response.body);
    // print(data);
    if(data=="account already exists"){
      print("Account already exists");
      createAlertDialouge(context, "Account already exists");
    }else{
      if(data=="true"){
        print("ACCOUNT CREATED");
        register1();
        createAlertDialouge(context, "Account successfully created");
      }else{
        createAlertDialouge(context, "PLease try with a new email");
      }
    }
  }

  Future register1()async{

    var url = "http://"+URL+"/dbite/register1.php";
    var sendData = {
      "user_id" : username,
    };

    var response = await http.post(url, body: sendData);

    var data = json.decode(response.body);
    // print(data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 50, right: 50 , top: 10, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Full Name',
                    ),
                    controller: full_name,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Username',
                    ),
                    controller: user_name,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Email',
                    ),
                    controller: email,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Password',
                    ),
                    controller: password,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(5),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Phone Number',
                    ),
                    controller: phone_number,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text("Gender:" , style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: group,
                    onChanged: (T){
                      setState(() {
                        group=T;
                        gender = "male";
                      });
                    },
                  ),
                  Text("Male"),
                  Radio(
                    value: 2,
                    groupValue: group,
                    onChanged: (T){
                      setState(() {
                        group=T;
                        gender = "female";
                      });
                    },
                  ),
                  Text("Female"),
                  Radio(
                    value: 3,
                    groupValue: group,
                    onChanged: (T){
                      setState(() {
                        group=T;
                        gender = "others";
                      });
                    },
                  ),
                  Text("Others"),

                ],
              ),
              Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5,),
                    child: Center(
                      child:FlatButton(

                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        child: Text(
                          "REGISTER",
                          style: TextStyle(fontSize: 20.0),
                        ),

                        onPressed: (){

                          setState(() {
                            fullname = full_name.text;
                            username = user_name.text;
                            _email = email.text;
                            _password = password.text;
                            phonenumber = phone_number.text;
                          });
                          register();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
