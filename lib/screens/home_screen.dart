import 'package:flutter/material.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/search_screen.dart';
import 'package:dbite/screens/chats.dart';
import 'package:dbite/screens/posting.dart';
import 'package:dbite/screens/news_feed.dart';
import '';

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
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children:<Widget> [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.143,
              color: Colors.green,
              child: Center (
                child: Text(
                  username,
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "times", color: Colors.white),
                ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(username: username)));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(username: username)));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsFeed(user_id: username,)));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(loggedUser: username,)));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Posting(username: username,)));
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(username),
    //         // Text(password),
    //         Container(
    //             child: Padding(
    //               padding: EdgeInsets.only(top: 10, bottom: 10),
    //               child: Center(
    //                 child:FlatButton(
    //
    //                   color: Colors.blue,
    //                   textColor: Colors.white,
    //                   disabledColor: Colors.grey,
    //                   disabledTextColor: Colors.black,
    //                   padding: EdgeInsets.all(8.0),
    //                   splashColor: Colors.blueAccent,
    //                   child: Text(
    //                     "EDIT PROFILE",
    //                     style: TextStyle(fontSize: 20.0),
    //                   ),
    //
    //                   onPressed: (){
    //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(username: username)));
    //                   },
    //                 ),
    //               ),
    //             )
    //         ),
    //         Container(
    //             child: Padding(
    //               padding: EdgeInsets.only(top: 10, bottom: 10),
    //               child: Center(
    //                 child: FlatButton(
    //
    //                   color: Colors.blue,
    //                   textColor: Colors.white,
    //                   disabledColor: Colors.grey,
    //                   disabledTextColor: Colors.black,
    //                   padding: EdgeInsets.all(8.0),
    //                   splashColor: Colors.blueAccent,
    //                   child: Text(
    //                     "SEARCH",
    //                     style: TextStyle(fontSize: 20.0),
    //                   ),
    //
    //                   onPressed: (){
    //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(username: username)));
    //                   },
    //                 ),
    //                 ),
    //               ),
    //             ),
    //         Container(
    //           child: Padding(
    //             padding: EdgeInsets.only(top: 10, bottom: 10),
    //             child: Center(
    //               child: FlatButton(
    //
    //                 color: Colors.blue,
    //                 textColor: Colors.white,
    //                 disabledColor: Colors.grey,
    //                 disabledTextColor: Colors.black,
    //                 padding: EdgeInsets.all(8.0),
    //                 splashColor: Colors.blueAccent,
    //                 child: Text(
    //                   "MESSAGES",
    //                   style: TextStyle(fontSize: 20.0),
    //                 ),
    //
    //                 onPressed: (){
    //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(loggedUser: username,)));
    //                 },
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           child: Padding(
    //             padding: EdgeInsets.only(top: 10, bottom: 10),
    //             child: Center(
    //               child: FlatButton(
    //
    //                 color: Colors.blue,
    //                 textColor: Colors.white,
    //                 disabledColor: Colors.grey,
    //                 disabledTextColor: Colors.black,
    //                 padding: EdgeInsets.all(8.0),
    //                 splashColor: Colors.blueAccent,
    //                 child: Text(
    //                   "NEWS FEED",
    //                   style: TextStyle(fontSize: 20.0),
    //                 ),
    //
    //                 onPressed: (){
    //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsFeed(user_id: username,)));
    //                 },
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           child: Padding(
    //             padding: EdgeInsets.only(top: 10, bottom: 10),
    //             child: Center(
    //               child: FlatButton(
    //
    //                 color: Colors.blue,
    //                 textColor: Colors.white,
    //                 disabledColor: Colors.grey,
    //                 disabledTextColor: Colors.black,
    //                 padding: EdgeInsets.all(8.0),
    //                 splashColor: Colors.blueAccent,
    //                 child: Text(
    //                   "POST A PICTURE",
    //                   style: TextStyle(fontSize: 20.0),
    //                 ),
    //
    //                 onPressed: (){
    //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Posting(username: username,)));
    //                 },
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
