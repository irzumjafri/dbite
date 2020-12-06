import 'package:dbite/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:dbite/screens/home_screen.dart';
import 'package:dbite/screens/register.dart';
import 'package:dbite/screens/settings.dart';
import 'package:dbite/screens/profile.dart';
import 'package:dbite/screens/search_screen.dart';
import 'package:dbite/screens/posting.dart';
import 'model_classes/message.dart';
import 'screens/message_screen.dart';
import 'screens/chats.dart';
import 'screens/pic_display.dart';
import 'screens/news_feed.dart';
import 'screens/new_searched_profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

