import 'package:flutter/material.dart';
import 'package:dbite/model_classes/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/model_classes/message.dart';
import 'package:dbite/screens/message_screen.dart';
import 'package:dbite/screens/new_searched_profile.dart';
import 'package:dbite/model_classes/model_all_chats.dart';
import 'dart:async';

class ChatScreen extends StatefulWidget {

  String loggedUser;

  ChatScreen({this.loggedUser});

  @override
  _ChatScreenState createState() => _ChatScreenState(loggedUser);
}

class _ChatScreenState extends State<ChatScreen> {

  String loggedUser;

  _ChatScreenState(this.loggedUser);

  List<AllChats> allChats = null;

  _InboxBlock(String name){
    return Container(
        color: Colors.cyan,
        child: InkWell(
          child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white24,
                // borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.height/10 ,
                    color: Colors.yellow,
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(name , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                      )
                  )
                ],
              )
          ),
          onTap: (){

          },
        )
    );
  }

  Future get_all_chats() async{
    var url = "http://"+URL+"/dbite/getAllChats.php";
    var sendData = {
      'user_id' : loggedUser,
    };
    var response = await http.post(url, body: sendData);
    print("111111111111111111111111");
    var data = json.decode(response.body);
    print(data);

    setState(() {
      allChats=List<AllChats>.from(data.map((x) => AllChats.fromJson(x)));
    });

  }



  @override
  void initState() {
    setState(() {
      get_all_chats();
    });
    refresh();
    super.initState();
  }


  refresh(){
    setState(() {
      get_all_chats();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          child: allChats==null?refresh():ListView.builder(itemCount: allChats.length,
            itemBuilder: (BuildContext context, int index){
              if(allChats[index].userId==loggedUser){
                return _InboxBlock(allChats[index].coUserId);
              }
              return _InboxBlock(allChats[index].userId);
            },
          ),
        )
      ),
    );
  }
}
