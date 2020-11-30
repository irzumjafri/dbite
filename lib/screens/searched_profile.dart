import 'package:flutter/material.dart';
import 'package:dbite/model_classes/user.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

class SearchedProfile extends StatefulWidget {

  User searched_user;

  SearchedProfile({this.searched_user});

  @override
  _SearchedProfileState createState() => _SearchedProfileState(searched_user);
}

class _SearchedProfileState extends State<SearchedProfile> {

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

  String followers="";
  String followings = "";

  User searched_user;
  _SearchedProfileState(this.searched_user);

  Future find_followers()async{
    var url = "http://192.168.0.103/dbite/findfollowers.php";
    var sendData = {
      "user_id" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);


    var data = json.decode(response.body);
    followers=data.toString();
    print(data);

  }

  Future find_followings()async{
    var url = "http://192.168.0.103/dbite/findfollowings.php";
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
    // print ("-1-1-1-1-1-1-1-1");


  }


  // String profile_description= searched_user.description;


  // List <Container> post_container = [
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blue,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.red,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.green,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.yellow,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.black,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.pink,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.orange,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.purple,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.grey,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blueGrey,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blue,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.red,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.green,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.yellow,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.black,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.pink,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.orange,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.purple,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.grey,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blueGrey,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blue,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.red,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.green,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.yellow,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.black,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.pink,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.orange,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.purple,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.grey,
  //   ),
  //   Container(
  //     margin: EdgeInsets.all(10),
  //     color: Colors.blueGrey,
  //   ),
  // ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(searched_user.fullname),
          Text(searched_user.description),
          Text(searched_user.email),
          Text(searched_user.numberOfPosts),
          Text(searched_user.phoneNumber),
          Text("followings"),
          Text(followings),
          Text("followers"),
          Text(followers),
        //   FlatButton(
        //
        //   color: Colors.blue,
        //   textColor: Colors.white,
        //   disabledColor: Colors.grey,
        //   disabledTextColor: Colors.black,
        //   padding: EdgeInsets.all(8.0),
        //   splashColor: Colors.blueAccent,
        //   child: Text(
        //     "Flat Button",
        //     style: TextStyle(fontSize: 20.0),
        //   ),
        //
        //   onPressed: (){
        //     // find_followers();
        //   },
        // ),

        ],
      ),
    );
    //   Scaffold(
    //   body: Column(
    //     children: [
    //       Center(
    //         child: Padding(
    //           padding: EdgeInsets.all(10),
    //           child: Text("Username" , style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 30
    //           ),),
    //         ),
    //       ),
    //       Container(
    //         height: 1,
    //         width: MediaQuery.of(context).size.width,
    //         color: Colors.black,
    //       ),
    //       SizedBox(height: 10,),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Container(
    //             height: MediaQuery.of(context).size.width*0.3,
    //             width: MediaQuery.of(context).size.width*0.3,
    //             color: Colors.pink,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text(posts, style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20
    //                     ),),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text("Posts", style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                     ),),
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text(followings, style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20
    //                     ),),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text("Followings", style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                     ),),
    //                   ),
    //                 ],
    //               ),
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text(followers, style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 20
    //                     ),),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text("Followers", style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                     ),),
    //                   ),
    //                 ],
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //       SizedBox(height: 10,),
    //       Container(
    //         height: 100,
    //         child:Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Container(
    //               child:Text("FULL NAME" , style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20
    //               ),),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.all(10),
    //               child: Text(profile_description),
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         height: 1,
    //         width: MediaQuery.of(context).size.width,
    //         color: Colors.black,
    //       ),
    //       SizedBox(height: 10,),
    //       // FloatingActionButton.extended(
    //       //   onPressed: (){
    //       //     // Navigator.push(context,  MaterialPageRoute(builder: (context)=>Settings()));
    //       //   },
    //       //   label: Padding(
    //       //     padding: EdgeInsets.only(left: 50, right: 50),
    //       //     child: Text("EDIT PROFILE"),
    //       //   ),
    //       //   backgroundColor: Colors.black,
    //       // ),
    //       // SizedBox(height: 10,),
    //       Container(
    //         height: 300,
    //         child: GridView(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //             children: post_container
    //         ),
    //       ),
    //       Padding(
    //           padding: EdgeInsets.all(10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               Padding(
    //                 padding: EdgeInsets.all(5),
    //                 child: Container(
    //                   height: 40,
    //                   width: MediaQuery.of(context).size.width/5,
    //                   color: Colors.blue,
    //                   child: Icon(Icons.looks_one),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.all(5),
    //                 child: Container(
    //                   height: 40,
    //                   width: MediaQuery.of(context).size.width/5,
    //                   color: Colors.blue,
    //                   child: Icon(Icons.looks_two),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.all(5),
    //                 child: Container(
    //                   height: 40,
    //                   width: MediaQuery.of(context).size.width/5,
    //                   color: Colors.blue,
    //                   child: Icon(Icons.looks_3),
    //                 ),
    //               )
    //             ],
    //           )
    //       )
    //     ],
    //   ),
    // );
  }
}
