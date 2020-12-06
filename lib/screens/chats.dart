import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _InboxBlock(String name){
    return Container(

        child: InkWell(
          child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white24,
                // borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.height/10 ,
                    color: Colors.yellow,
                  ),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(name , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                      )
                  )
                ],
              )
          ),
          onTap: (){

          },
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.builder(itemCount: 10,
        itemBuilder: (BuildContext context, int index){
          return _InboxBlock("Name of Sender");
        },
        ),
      ),
    );
  }
}
