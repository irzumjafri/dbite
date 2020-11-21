import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final full_name = TextEditingController();
  final pass_word = TextEditingController();

  String fullname_ = "";
  String password_ = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("EDIT PROFILE" , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                ),),
              ),
              SizedBox(height: 50 ,),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Center(
                  child: Text("Upload a new picture: ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),),
                ),
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text("Enter new Full Name: ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 30, right: 30),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      ),
                    controller: full_name,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text("Enter new Password: ", style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5,left: 30, right: 30),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: pass_word,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          setState(() {
                            fullname_ = full_name.text;
                            password_ = pass_word.text;
                          });
                          Navigator.pop(context);
                          // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                        },
                        label: Text('   SAVE   '),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: FloatingActionButton.extended(
                        onPressed: (){
                          Navigator.pop(context);
                          // WRITE CODE TO SAVE THE CHANGES MADE IN THE PROFILE
                        },
                        label: Text('CANCEL'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),


        ),
      ),
    );
  }
}
