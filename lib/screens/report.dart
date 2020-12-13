import 'package:flutter/material.dart';
import 'package:dbite/model_classes/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';


class Report extends StatefulWidget {

  String loggedUser;
  String post_id;

  Report({this.loggedUser,this.post_id});

  @override
  _ReportState createState() => _ReportState(loggedUser,post_id);
}

class _ReportState extends State<Report> {

  String loggedUser;
  String post_id;

  _ReportState(this.loggedUser,this.post_id);

  String report_id ;

  String timerr() {
    var temp =  DateTime.now().millisecondsSinceEpoch.toString();
    return temp;
  }



  TextEditingController report_reason = TextEditingController();


  Future report() async {
    var url = "http://" + URL + "/dbite/report.php";
    var sendData = {
      "loggedUser" : loggedUser,
      "post_id" : post_id,
      "report_reason" : report_reason.text,
      "report_id" : report_id,

    };
    var response = await http.post(url, body: sendData);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding:EdgeInsets.all(10),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter reason',
                    ),
                    controller: report_reason,
                  ),
                ),
              ),
            ),
            FlatButton(

              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              child: Text(
                "REPORT",
                style: TextStyle(fontSize: 20.0),
              ),

              onPressed: (){
                setState(() {
                  report_id = loggedUser + '_' + timerr();
                });
                report();
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}
