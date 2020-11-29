import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  final userSearch = TextEditingController();

  String user_search = "";

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
                    child: FloatingActionButton.extended(
                      onPressed: (){
                        setState(() {
                          user_search = userSearch.text;
                        });
                      },
                      label: Text('SEARCH'),
                    ),
                  ),
                )
            ),
          ),
          // Text(user_search),
        ],
      ),
    );
  }
}
