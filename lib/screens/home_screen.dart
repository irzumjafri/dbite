import 'package:flutter/material.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/search_screen.dart';
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
                    child: FloatingActionButton.extended(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(username: username)));
                      },
                      label: Text('EDIT PROFILE'),
                    ),
                  ),
                )
            ),
            // Container(
            //     child: Padding(
            //       padding: EdgeInsets.only(top: 10, bottom: 10),
            //       child: Center(
            //         child: FloatingActionButton.extended(
            //           onPressed: (){
            //             Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
            //           },
            //           label: Text('SEARCH'),
            //         ),
            //       ),
            //     )
            // ),

          ],
        ),
      ),
    );
  }
}
