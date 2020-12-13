import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/model_classes/model_post.dart';
import 'dart:convert';
import 'package:dbite/screens/report.dart';
import 'dart:async';
import 'package:dbite/model_classes/model_comments.dart';
import 'package:dbite/screens/comments_screen.dart';
import 'package:flutter/material.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/search_screen.dart';
import 'package:dbite/screens/chats.dart';
import 'package:dbite/screens/posting.dart';
import 'package:dbite/screens/news_feed.dart';

class stylishHomeScreen extends StatefulWidget {
  @override
  _stylishHomeScreenState createState() => _stylishHomeScreenState();
}

class _stylishHomeScreenState extends State<stylishHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
            children:<Widget> [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.143,
                color: Colors.green,
                child: Text(
                  "username",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "times", color: Colors.white),
                ),
              ),
              Row(
                children:<Widget> [
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                    width: MediaQuery.of(context).size.width*0.5,
                    color: Colors.yellow,
                    child: Center(
                      child: FlatButton(
                        color: Colors.yellow,
                        child: Text(
                          "EDIT PROFILE",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(username: "alvi")));
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                    width: MediaQuery.of(context).size.width*0.5,
                    color: Colors.orange,
                    child: Center(
                      child: FlatButton(
                        color: Colors.orange,
                        child: Text(
                          "SEARCH",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(username: "alvi")));
                      },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children:<Widget> [
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.teal,
                    child: Center(
                      child: FlatButton(
                        color: Colors.teal,
                        child: Text(
                          "NEWS FEED",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsFeed(user_id: "alvi",)));
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children:<Widget> [
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                    width: MediaQuery.of(context).size.width*0.5,
                    color: Colors.purpleAccent,
                    child: Center(
                      child: FlatButton(
                        color: Colors.purpleAccent,
                        child: Text(
                          "MESSAGES",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(loggedUser: "alvi",)));
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                    width: MediaQuery.of(context).size.width*0.5,
                    color: Colors.red,
                    child: Center(
                      child: FlatButton(
                        color: Colors.red,
                        child: Text(
                          "POST A PHOTO",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Posting(username: "alvi",)));
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
      )
    );
  }
}
