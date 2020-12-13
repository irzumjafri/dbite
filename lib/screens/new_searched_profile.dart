import 'package:flutter/material.dart';
import 'package:dbite/model_classes/user.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/model_classes/message.dart';
import 'package:dbite/screens/message_screen.dart';
import 'package:dbite/model_classes/model_post.dart';
import 'dart:async';
import 'package:dbite/screens/postView.dart';


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

  bool block_status;

  List<String> chat_parse(String combined){
    List <String> ans = combined.split("_+_+_+_+_+");
    return ans;
  }

  List<PostModel> allPosts = null;
  List <Container> post_container=null;

  Future block_a_user() async{
    // print("blocking a user");
    var url = "http://"+URL+"/dbite/blockAUser.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "block_user" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    refresh();
    // print(block_status);

  }
  Future unblock_a_user() async{
    var url = "http://"+URL+"/dbite/unblockAUser.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "block_user" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);
    refresh();

  }

  Future check_block()async{
    var url = "http://"+URL+"/dbite/checkBlock.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "block_user" : searched_user.userId,
    };
    // print("1111111111111111111");
    var response = await http.post(Uri.encodeFull(url), body: sendData);
    // print(response.statusCode);
    var data = json.decode(response.body);
    if(data=="false"){
      setState(() {
        block_status = false;
      });
    }else{
      setState(() {
        block_status = true;
      });

    }
  }

  Container samplepost(PostModel tempPost){
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PostView(loggedUser: loggedUser,thisPost: tempPost)));
        },
        child: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                "http://" + URL + "/dbite/" + tempPost.postContent,
                fit: BoxFit.fitHeight,
              ),
            )
        ),
      ),
    );
  }

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
    //print("--------------------------------");
    //print(data);
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
    // print(data);

  }

  Future find_followings()async{
    var url = "http://"+URL+"/dbite/findfollowings.php";
    var sendData = {
      "user_id" : searched_user.userId,
    };
    var response = await http.post(url, body: sendData);


    var data = json.decode(response.body);
    followings=data.toString();
    // print(data);

  }

  update_list(){
    setState(() {
      post_container = [];
      for(int i=0 ; i< allPosts.length ; i++){
        post_container.add(samplepost(allPosts[i]));
        // post_container.add(Container(child: Text("aa"),));
      }
    });
    print("------ ${post_container.length}");
  }

  Future get_picture() async {
    // print("1---");
    var url = "http://" + URL + "/dbite/getUserPosts.php";
    var sendData = {
      "user_id" :searched_user.userId,
    };
    // print("2---");
    print('${searched_user.userId}');
    var response = await http.post(url, body: sendData);
    // print(response.statusCode);
    // print("3---");
    var data = json.decode(response.body);
    // print("4---");
    // print(data);
    setState(() {
      allPosts = List<PostModel>.from(data.map((x) => PostModel.fromJson(x)));
      update_list();
    });
    // print("11111111122222222222222222233333333333333 ${allPosts.length.toString()}");
  }


  @override
  void initState() {
    super.initState();
    find_followers();
    find_followings();
    check_follow_status();
    check_chat();
    get_Chat();
    get_picture();
    check_block();
  }

  refresh(){
    setState(() {
      find_followers();
      find_followings();
      get_Chat();
      check_chat();
      check_follow_status();
      get_picture();
      check_block();
    });
  }

  String followers="123";
  String followings = "456";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: 0==1? refresh(): SingleChildScrollView(

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
                  color: Colors.lightGreenAccent,
                  child:CircleAvatar(
                    backgroundColor: Colors.pink,
                      child: Icon(
                        Icons.person,
                        color: Colors.black87,
                        size: 60,
                      ),
                    ),
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

                  color: Colors.pink,
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
                    check_follow_status();
                    followStatus==false?follow_a_user():unfollow_a_user();
                    check_follow_status();
                  },
                ),
                FlatButton(

                  color: Colors.pink,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat(loggedUser: loggedUser,searchedUser: searched_user.userId,chatUser: chat_parse(thisChat.messageContent),senderinfo: chat_parse(thisChat.messageSenderInfo), threadId: thisChat.messageThreadId,)));
                    check_follow_status();
                    setState(() {
                      // followStatus = !followStatus;
                    });
                  },
                ),
                FlatButton(

                  color: Colors.pink,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  child: block_status==false?Text(
                    "BLOCK",
                    style: TextStyle(fontSize: 20.0),
                  ):Text(
                    "UNBLOCK",
                    style: TextStyle(fontSize: 20.0),
                  ),

                  onPressed: (){
                    setState(() {
                      block_status==true?unblock_a_user():block_a_user();
                      refresh();
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
            // Padding(
            //     padding: EdgeInsets.all(10),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(5),
            //           child: Container(
            //             height: 40,
            //             width: MediaQuery.of(context).size.width/5,
            //             color: Colors.blue,
            //             child: Icon(Icons.looks_one),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(5),
            //           child: Container(
            //             height: 40,
            //             width: MediaQuery.of(context).size.width/5,
            //             color: Colors.blue,
            //             child: Icon(Icons.looks_two),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(5),
            //           child: Container(
            //             height: 40,
            //             width: MediaQuery.of(context).size.width/5,
            //             color: Colors.blue,
            //             child: Icon(Icons.looks_3),
            //           ),
            //         )
            //       ],
            //     )
            // )
          ],
        ),
      ),
    );
  }
}
