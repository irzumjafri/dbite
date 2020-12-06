import 'package:flutter/material.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/search_screen.dart';
import 'package:dbite/screens/chats.dart';
import 'package:dbite/screens/posting.dart';
import 'package:dbite/screens/news_feed.dart';

class HomeScreen extends StatefulWidget {

  String username="";

  HomeScreen({this.username});


  @override
  _HomeScreenState createState() => _HomeScreenState(username);
}

class _HomeScreenState extends State<HomeScreen> {

  String username="";

  _HomeScreenState(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username),
            // Text(password),
            Container(
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
                        "EDIT PROFILE",
                        style: TextStyle(fontSize: 20.0),
                      ),

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(username: username)));
                      },
                    ),
                  ),
                )
            ),
            Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: FlatButton(

                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      child: Text(
                        "SEARCH",
                        style: TextStyle(fontSize: 20.0),
                      ),

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(username: username)));
                      },
                    ),
                    ),
                  ),
                ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: FlatButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text(
                      "MESSAGES",
                      style: TextStyle(fontSize: 20.0),
                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: FlatButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text(
                      "NEWS FEED",
                      style: TextStyle(fontSize: 20.0),
                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsFeed()));
                    },
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Center(
                  child: FlatButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text(
                      "POST A PICTURE",
                      style: TextStyle(fontSize: 20.0),
                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Posting(username: username,)));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
