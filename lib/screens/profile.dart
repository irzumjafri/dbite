import 'package:flutter/material.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/register.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String followers="123";
  String followings = "456";
  String posts = "121";
  String profile_description= "A resume profile is a brief summary of an applicant's skills, experiences, and goals as they relate to a specific job opening. On the other hand, ";

  
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Username" , style: TextStyle(
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
                          child: Text(posts, style: TextStyle(
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
                    child:Text("FULL NAME" , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(profile_description),
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
            FlatButton(

              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              child: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 20.0),
              ),

              onPressed: (){
                Navigator.push(context,  MaterialPageRoute(builder: (context)=>Settings()));
              },
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
      )
    );
  }
}
