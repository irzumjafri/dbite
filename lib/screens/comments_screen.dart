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

class CommentsScreen extends StatefulWidget {

  String loggedUser;
  PostModel thisPost;

  CommentsScreen({this.loggedUser,  this.thisPost});

  @override
  _CommentsScreenState createState() => _CommentsScreenState(loggedUser,thisPost);
}

class _CommentsScreenState extends State<CommentsScreen> {


  String loggedUser;
  PostModel thisPost;

  _CommentsScreenState(this.loggedUser, this.thisPost);

  TextEditingController commenting = TextEditingController();

  List<CommentData> allComments = null;

  Future getComments() async {
    var url = "http://" + URL + "/dbite/getComments.php";
    var sendData = {
      "post_id" : thisPost.postId,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    setState(() {
      allComments=List<CommentData>.from(data.map((x) => CommentData.fromJson(x)));
    });
  }

  Future comment_a_post() async {
    var url = "http://" + URL + "/dbite/commentAPost.php";
    var sendData = {
      "post_id" : thisPost.postId,
      "posted_by" : loggedUser,
      "comment" : commenting.text,
    };
    var response = await http.post(url, body: sendData);
  }

  @override
  void initState() {
    setState(() {
      getComments();
    });
    refresh();
    super.initState();
  }


  refresh(){
    setState(() {
      getComments();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMMENTS"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child:  Column(
          children: [
            Expanded(
              child: allComments==null? refresh(): ListView.builder(
                itemCount: allComments.length,
                itemBuilder: (BuildContext context , int index){
                  if(allComments.isEmpty){
                    // refresh();
                    print("-----------------------------");
                    return Container(
                      child: Center(
                        child: Text("NO CHATS TO DISPLAY"),
                      ),
                    );
                  }else{
                    return Padding(padding: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                      child: Container(
                          child: Row(
                            children: [
                              Text('${allComments[index].commentById}', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),),
                              Text(" -> ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                              Expanded(child: Container(
                                child: Text("${allComments[index].commentData}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    // backgroundColor: Colors.green,
                                  ),
                                ),
                              ))
                            ],
                          )
                      ),
                    );
                  }
                } ,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Write message',
                      ),
                      controller: commenting,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.lightGreenAccent,
                    onPressed: (){
                      refresh();
                      setState(() {
                        if(commenting.text!=''){
                          comment_a_post();
                          commenting.clear();
                          print("0000000000000");
                        }
                        refresh();
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
