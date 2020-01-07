import 'package:flutter/material.dart';
import 'package:wassa/pages/home.dart';
import 'package:wassa/pages/diary.dart';






void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Home(),
    '/diary' : (context) => diary(),
  },

));

