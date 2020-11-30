import 'package:dbite/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:dbite/screens/home_screen.dart';
import 'package:dbite/screens/register.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/profile.dart';
import 'package:dbite/screens/search_screen.dart';
import 'package:dbite/screens/posting.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchScreen(),
  ));
}

