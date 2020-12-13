import 'package:flutter/material.dart';
import 'package:dbite/model_classes/user.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:dbite/screens/message_screen.dart';
import 'package:dbite/model_classes/message.dart';
import 'package:dbite/model_classes/url.dart';

class Chat extends StatefulWidget {

  String loggedUser="";
  String searchedUser = "";
  String threadId = "";

  List<String> chatUser;
  List<String> senderinfo;

  Chat({this.loggedUser,this.searchedUser, this.chatUser,this.senderinfo, this.threadId});

  @override
  _ChatState createState() => _ChatState(loggedUser,searchedUser,chatUser,senderinfo,threadId);
}

class _ChatState extends State<Chat> {


  String inputHint = "";


  MessageData thisChat;
  String tempChat;
  String loggedUser="";
  String searchedUser = "";
  List<String> chatUser = null;
  List<String> senderinfo;
  String threadId = "";
  _ChatState(this.loggedUser,this.searchedUser,this.chatUser,this.senderinfo, this.threadId);

  TextEditingController messaging = TextEditingController();


  _chatBubble(String message, bool me){
    if(me){
      return Container(
        alignment: Alignment.topRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.8,
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Text(message , style: TextStyle(fontSize: 15),),
        ),


      );
    }else{
      return Container(
        alignment: Alignment.topLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width*0.8,
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.limeAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Text(message , style: TextStyle(fontSize: 15),),
        ),


      );
    }
  }

  // List<bool> myList = [false,true,false, false,true,false,false,true,false,true,true,false, false,true,false];
  List<String> chat_parse(String combined){
    List <String> ans = combined.split("_+_+_+_+_+");
    return ans;
  }

  String chatjoin(List<String> temp){
    String ans = temp.join("_+_+_+_+_+");
    return ans;
  }
  Future get_Chat() async{
    var url = "http://"+URL+"/dbite/getChat.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "searchedUser" : searchedUser,
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    // print(data[0]);
    thisChat = MessageData.fromJson(data[0]);
    chatUser = chat_parse(thisChat.messageContent);


  }
  Future send_Chat() async{
    var url = "http://"+URL+"/dbite/sendChat.php";
    var sendData = {
      "thread_id" :threadId,
      "thisChat" : chatjoin(chatUser),
      "senderinfo" : chatjoin(senderinfo)
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    // print(data[0]);
    // thisChat = MessageData.fromJson(data[0]);

  }

  @override
  void initState() {
    setState(() {
      get_Chat();
      send_Chat();
    });
    refresh();
    super.initState();
  }

  refresh(){
    setState(() {
      get_Chat();
      send_Chat();
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(searchedUser, style: TextStyle(
            color: Colors.black,
          ),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child:  Column(
          children: [
            Expanded(
              child: chatUser==null? refresh(): ListView.builder(
                itemCount: chatUser.length,
                itemBuilder: (BuildContext context , int index){
                  if(chatUser.isEmpty){
                    refresh();
                    print("-----------------------------");
                    return Container(
                      child: Center(
                        child: Text("NO CHATS TO DISPLAY"),
                      ),
                    );
                  }else{
                    return _chatBubble(chatUser[index], senderinfo[index]==loggedUser?true:false);
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
                      controller: messaging,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.cyan,
                    onPressed: (){
                        setState(() {
                          chatUser.add(messaging.text.toString());
                          senderinfo.add(loggedUser);
                          send_Chat();
                          get_Chat();
                          messaging.clear();
                          refresh();

                        });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )

    );
  }
}
