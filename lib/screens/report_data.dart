import 'package:flutter/material.dart';
import 'package:dbite/model_classes/model_report.dart';
import 'package:dbite/model_classes/url.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ReportData extends StatefulWidget {
  @override
  _ReportDataState createState() => _ReportDataState();
}

class _ReportDataState extends State<ReportData> {


  List<ReportModel>  allReports = null;

  _sampleChat(String user_id, String post_id , String reason , DateTime now){
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: Column(
        children: <Widget> [
          Text("REPORTER ID" , style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              user_id,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Text("POST ID" , style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              post_id,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Text("REPORT REASON" , style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
              reason,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Text("DATE TIME" , style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Text(
                "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString()}:${now.minute.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          )

          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height * 0.1,
          //   child: Text(
          //     "user_id",
          //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          //   ),
          // ),
        ],
      ),
    );
  }

  refresh(){
    setState(() {
      getReportData();
    });
  }

  Future getReportData() async{
    var url = "http://"+URL+"/dbite/getReportData.php";
    var sendData = {
    };
    var response = await http.post(url, body: sendData);
    var data = json.decode(response.body);
    // print(data[0]);
    // thisChat = MessageData.fromJson(data[0]);
    setState(() {
      allReports =  List<ReportModel>.from(data.map((x) => ReportModel.fromJson(x)));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report List",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,

      ),
      body: allReports == null ? refresh() : ListView.builder(
          itemCount: allReports.length,
          itemBuilder: (BuildContext context, int index) {
            return _sampleChat(allReports[index].userId, allReports[index].reportedPostId, allReports[index].reportReason ,allReports[index].reportTime);
          }
      ),
    );
  }
}
