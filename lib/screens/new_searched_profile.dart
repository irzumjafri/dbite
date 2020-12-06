import 'package:flutter/material.dart';
import 'package:dbite/model_classes/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/model_classes/message.dart';


class NewSearchedProfile extends StatefulWidget {



  User searched_user;
  String loggedUser;

  NewSearchedProfile({this.searched_user,this.loggedUser});

  @override
  _NewSearchedProfileState createState() => _NewSearchedProfileState(searched_user,loggedUser);
}

class _NewSearchedProfileState extends State<NewSearchedProfile> {
  MessageData thisChat;
  bool followStatus = false;
  User searched_user;
  String loggedUser;
  _NewSearchedProfileState(this.searched_user,this.loggedUser);

  Future get_Chat() async{
    var url = "http://"+URL+"/dbite/getChat.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    // print(data[0]);
    thisChat = MessageData.fromJson(data[0]);

  }

  Future check_follow_status() async{
    var url = "http://"+URL+"/dbite/check_follow_status.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    print("--------------------------------");
    print(data);
    if(data=='true'){
      setState(() {
        followStatus=true;
      });
    }else{
      if(data=='false'){
        setState(() {
          followStatus=false;
        });
      }
    }

  }

  Future follow_a_user() async{
    var url = "http://"+URL+"/dbite/follow_a_user.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    refresh();

  }

  Future unfollow_a_user() async{
    var url = "http://"+URL+"/dbite/unfollow_a_user.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    refresh();

  }

  Future check_chat() async{
    var url = "http://"+URL+"/dbite/checkChat.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);

  }

  Future find_followers()async{
    var url = "http://"+URL+"/dbite/findfollowers.php";
    var sendData = {
      "user_id" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);


    var data = json.decode(response.body);
    followers=data.toString();
    print(data);

  }

  Future find_followings()async{
    var url = "http://"+URL+"/dbite/findfollowings.php";
    var sendData = {
      "user_id" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);


    var data = json.decode(response.body);
    followings=data.toString();
    print(data);

  }

  @override
  void initState() {
    super.initState();
    find_followers();
    find_followings();
    check_follow_status();
    check_chat();
  }

  refresh(){
    setState(() {
      find_followers();
      find_followings();
      get_Chat();
      check_chat();
      check_follow_status();
    });
  }

  String followers="123";
  String followings = "456";
  // String posts =searched_user.numberOfPosts;
  // String profile_description= searched_user.description;

  List <Container> post_container = [
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.red,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.black,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.pink,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.purple,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blueGrey,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.red,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.black,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.pink,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.purple,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blueGrey,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.red,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.green,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.yellow,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.black,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.pink,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.orange,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.purple,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.grey,
    ),
    Container(
      margin: EdgeInsets.all(10),
      color: Colors.blueGrey,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 0==1? Center(child: Text("LOADING..." , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),): SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(searched_user.userId , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),),
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width*0.3,
                  width: MediaQuery.of(context).size.width*0.3,
                  color: Colors.pink,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(searched_user.numberOfPosts, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Posts", style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(followings, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Followings", style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(followers, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("Followers", style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 100,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child:Text(searched_user.fullname , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(searched_user.description),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(

                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: followStatus==false?Text(
                    "FOLLOW",
                    style: TextStyle(fontSize: 20.0),
                  ):
                  Text("UNFOLLOW",
                    style: TextStyle(fontSize: 20.0),),

                  onPressed: (){
                    // Navigator.push(context,  MaterialPageRoute(builder: (context)=>Settings()));
                    followStatus==false?follow_a_user():unfollow_a_user();
                  },
                ),
                FlatButton(

                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: Text(
                    "MESSAGE",
                    style: TextStyle(fontSize: 20.0),
                  ),

                  onPressed: (){
                    // Navigator.push(context,  MaterialPageRoute(builder: (context)=>Settings()));
                    check_follow_status();
                    setState(() {
                      // followStatus = !followStatus;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 300,
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  children: post_container
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/5,
                        color: Colors.blue,
                        child: Icon(Icons.looks_one),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/5,
                        color: Colors.blue,
                        child: Icon(Icons.looks_two),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width/5,
                        color: Colors.blue,
                        child: Icon(Icons.looks_3),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
