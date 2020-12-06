import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dbite/model_classes/user.dart';
import 'package:dbite/screens/searched_profile.dart';
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/screens/new_searched_profile.dart';

class SearchScreen extends StatefulWidget {

String username="";


SearchScreen({this.username});

  @override
  _SearchScreenState createState() => _SearchScreenState(username);
}

class _SearchScreenState extends State<SearchScreen> {

  bool finding_user=false;

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

  String username="";

  _SearchScreenState(this.username);

  final userSearch = TextEditingController();

  // User null_user;

  String user_search = "";

  User user_found;

  Future search_user()async{
    var url = "http://"+URL+"/dbite/search.php";
    var sendData = {
      "user_id" : user_search,
    };
    // print("1111111111111111111");
    var response = await http.post(Uri.encodeFull(url), body: sendData);
    print(response.statusCode);


    var data = json.decode(response.body);
    if(data=="false"){
      // print("Account not found");
      createAlertDialouge(context, "Account not found");
      finding_user = false;
    }else{
      user_found = User.fromJson(data[0]);
      print(user_found.fullname);
      finding_user = true;
      // print(data[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text("Search" , style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
          ),
          SizedBox(height: 40,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
              child: TextField(
                controller: userSearch,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter username",
                  ),),
            ),
          ),
          Center(
            child:Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child:FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      child: Text(
                        "Flat Button",
                        style: TextStyle(fontSize: 20.0),
                      ),

                      onPressed: (){
                        setState(() {
                              user_search = userSearch.text;
                              search_user();
                          });
                        if(finding_user==true){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewSearchedProfile(searched_user: user_found, loggedUser: username,)));
                        }
                      },
                    ),

                    // FloatingActionButton.extended(
                    //   onPressed: (){
                    //     print("-----------");
                    //     setState(() {
                    //       user_search = userSearch.text;
                    //       search_user();
                    //
                    //     });

                      // },
                      // label: Text('SEARCH'),

                    ),
                  ),
                )
            ),
          Center(
            child: finding_user==false ? new Container(child: Text("NO USER"),): new Container(
              child: Column(
                children: [
                  Text(user_found.fullname),
                  Text(user_found.description),
                  Text(user_found.email),
                  Text(user_found.numberOfPosts),
                  Text(user_found.phoneNumber),
                ],
              ),
            ),
          )

          // Text(user_search),
        ],
      ),
    );
  }
}
