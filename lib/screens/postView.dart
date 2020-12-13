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

class PostView extends StatefulWidget {

  String loggedUser;
  PostModel thisPost;

  PostView({this.loggedUser, this.thisPost});

  @override
  _PostViewState createState() => _PostViewState(loggedUser,thisPost);
}

class _PostViewState extends State<PostView> {

  String loggedUser;
  PostModel thisPost;


  bool likeStatus=null;
  String noOfLikes=null;

  Future like_post() async {
    var url = "http://" + URL + "/dbite/likePost.php";
    var sendData = {
      "post_id" : thisPost.postId,
      "loggedUser" : loggedUser,
    };
    var response = await http.post(url, body: sendData);
    print("liking");
    check_like_status();

  }

  Future unlike_post() async {
    var url = "http://" + URL + "/dbite/removeLike.php";
    var sendData = {
      "post_id" : thisPost.postId,
      "loggedUser" : loggedUser,
    };
    var response = await http.post(url, body: sendData);
    print("unliking");
    check_like_status();

  }

  Future check_like_status() async {
    var url = "http://" + URL + "/dbite/check_like_status.php";
    var sendData = {
      "post_id" : thisPost.postId,
      "loggedUser" : loggedUser,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    print(data);

    if(data=="true") {
      setState(() {
        likeStatus = true;
      });
    }
    if(data=="false") {
      setState(() {
        likeStatus = false;
      });
    }

  }

  Future get_likes() async {
    var url = "http://" + URL + "/dbite/getLikes.php";
    var sendData = {
      "post_id" : thisPost.postId,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body).toString();
    setState(() {
      noOfLikes = data;
    });

  }


  @override
  void initState() {
    setState(() {
      get_likes();
      check_like_status();
    });
    refresh();
    super.initState();
  }

  refresh(){
    setState(() {
      get_likes();
      check_like_status();
    });
  }





  _PostViewState(this.loggedUser, this.thisPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "POST", style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('${thisPost.userId}' ,style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                        )
                    ),
                    child: Image.network(
                      "http://" + URL + "/dbite/" + thisPost.postContent,
                      fit: BoxFit.fitHeight,
                    )),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$noOfLikes LIKES', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),),
                  FlatButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    // padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: likeStatus==false?Text(
                      "LIKE",
                      style: TextStyle(fontSize: 20.0),
                    ):Text(
                      "UNLIKE",
                      style: TextStyle(fontSize: 20.0),
                    ),

                    onPressed: (){
                      refresh();
                      setState(() {
                        likeStatus==false?like_post():unlike_post();
                      });
                      check_like_status();
                      refresh();

                    },
                  ),
                  FlatButton(

                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    // padding: EdgeInsets.all(8.0),
                    splashColor: Colors.blueAccent,
                    child: Text(
                      "COMMENT",
                      style: TextStyle(fontSize: 20.0),
                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentsScreen(loggedUser: loggedUser, thisPost: thisPost)));

                    },
                  ),


                ],
              ),
              // Container(
              //     child:allComments==null?refresh():ListView.builder(
              //       // shrinkWrap: true,
              //       itemCount:20,
              //       itemBuilder: (BuildContext context , int index){
              //         return Container(
              //             child: Text(index.toString()),
              //         );
              //       },)
              // )
            ],
          ),
        ),
      )
    );
  }
}
