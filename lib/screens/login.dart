import 'package:flutter/material.dart';
import 'package:dbite/screens/register.dart';
import 'package:dbite/screens/home_screen.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/model_classes/user_authentication.dart';
import 'package:dbite/api/user_authentication_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool loggedin = false;
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

  final user_name = TextEditingController();
  final pass_word = TextEditingController();

  String username = "";
  String password = "";

  Future check_login()async{
    var url = "http://192.168.0.103/dbite/login.php";
    var sendData = {
      "user_id" : username,
      "password" : password,
    };
    var response = await http.post(url, body: sendData);


    var data = json.decode(response.body);
    if(data=="true"){
      print("Logged in");
      // createAlertDialouge(context, "Successfully logged in");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(username: username)));
    }else{
      if(data=="false"){
        print("Account not found");
        createAlertDialouge(context, "Account not found");

      }else{
        print("Please try again");
        createAlertDialouge(context, "Error! PLease try again");
      }
    }
  }


  // Future<List<UserAuthentication>> fetchUsers() async{
  //   String url = "http://192.168.0.106/dbite/login.php";
  //   final response = await http.get(url);
  //   print(response.body);
  //   // print(userAuthenticationFromJson(response.body));
  //   return userAuthenticationFromJson(response.body);
  //
  // }

  // List<UserAuthentication> users;
  //
  // @override
  // void initState(){
  //   super.initState();
  //   UserAuthenticationApi.getUsers().then((list){
  //     setState(() {
  //      users = list;
  //     });
  //   });
  // }


  bool check_user(String _username, String _password){
    // print("HELLO BOYS");


  }

  @override
  void dispose(){
    user_name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 50, right: 50 , top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding:EdgeInsets.all(10),
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
                ),
                Container(
                    child: Padding(
                      padding:EdgeInsets.all(10),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Password',
                          ),
                          controller: pass_word,
                        ),
                      ),
                    ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          setState(() {
                            username= user_name.text;
                            password = pass_word.text;
                          });
                          // check_user(username, password);
                          check_login();
                        },
                        label: Text('LOGIN'),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,  MaterialPageRoute(builder: (context)=>Register()));
                      },
                      child: Text("Register" , style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),),
                    ),
                  ],
                )
              ],
            )

          ),
        )
    );
  }
}
