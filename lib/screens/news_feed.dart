import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:dbite/model_classes/url.dart';
import 'package:dbite/model_classes/model_post.dart';
import 'dart:convert';
import 'package:dbite/screens/report.dart';
// import 'post.dart';

class NewsFeed extends StatefulWidget {

  String user_id;

  NewsFeed({this.user_id});

  @override
  _NewsFeedState createState() => _NewsFeedState(user_id);
}

class _NewsFeedState extends State<NewsFeed> {



  String user_id ;
  _NewsFeedState(this.user_id);

  String post_description = '.';

  List<PostModel> allPosts=null;

  @override
  void initState() {
    setState(() {
      get_picture();
    });
  }





  Future get_picture() async {
    var url = "http://" + URL + "/dbite/getPost.php";
    var sendData = {
      // "user_id" :'ali',
    };
    var response = await http.post(url, body: sendData);
    print("-------------");
    var data = json.decode(response.body);
    print(data);
    setState(() {
      allPosts = List<PostModel>.from(data.map((x) => PostModel.fromJson(x)));
    });
  }

  sample(String username, String desc, String imageUrl, String post_id) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 5.0),
      child: Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height*0.7,
        child: Container(
          color: Colors.grey,
          width: double.infinity,
          // color: Colors.grey,
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 5,),
                    CircleAvatar(
                      child: Container(
                          child: Image.network(
                            "http://" + URL + "/dbite/sample.jpg",
                            fit: BoxFit.fill,)
                      ),
                    ),
                    SizedBox(width: 5,),
                    FlatButton(
                        onPressed: null,
                        child: Text(username, style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                          textAlign: TextAlign.start,)
                    ),
                    SizedBox(width: 130,),
                    IconButton(
                        icon: Icon(Icons.report_problem, color: Colors.black,),
                        color: Colors.black,
                        onPressed: (){
                          Navigator.push(context,  MaterialPageRoute(builder: (context)=>Report(loggedUser: user_id, post_id: post_id,)));
                        }
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.4,
                  child: Container(
                      child: Image.network(
                        "http://" + URL + "/dbite/" + imageUrl,
                        fit: BoxFit.fitHeight,
                      ))
              ),
              Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 5,),
                      ButtonTheme(
                        minWidth: 25,
                        child: FlatButton(
                          onPressed: () {
                            print('like');
                          },
                          color: Colors.pink,
                          textColor: Colors.blueAccent,
                          disabledColor: Colors.white,
                          child: Text('LIKE', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 5,),
                      ButtonTheme(
                        minWidth: 10,

                        child: FlatButton(
                          onPressed: () {
                            print('cmnt');
                          },
                          color: Colors.pink,
                          textColor: Colors.blueAccent,
                          disabledTextColor: Colors.white,
                          child: Text('COMMENT', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                      SizedBox(width: 5,),
                      ButtonTheme(
                        minWidth: 25,
                        child: FlatButton(
                          onPressed: () {
                            print('share');
                          },
                          color: Colors.pink,
                          textColor: Colors.blueAccent,
                          disabledTextColor: Colors.white,
                          child: Text('SHARE', style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                            textAlign: TextAlign.center,),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                  width: double.infinity,
                  color: Colors.white,
                  // padding: EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.5),
                        child: Row(
                            children: [
                              Text(username, style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 15), textAlign: TextAlign.left,),
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 2, right: 2, top: 1, bottom: 3),
                        child: Text(
                            desc,
                            style: TextStyle(fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 13,
                                fontFamily: 'Times'),
                            textAlign: TextAlign.left
                        ),
                      ),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        // backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.all(5),
          child: allPosts==null? get_picture() :  ListView.builder(
              itemCount: allPosts.length,
              itemBuilder: (BuildContext context, int index) {
                return sample(
                    allPosts[index].userId, allPosts[index].postDescription,
                    allPosts[index].postContent, allPosts[index].postId);
              }
          ),
        ),
      );
    }

}