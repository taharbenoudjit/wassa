import 'package:flutter/material.dart';
import 'package:wassa/pages/home.dart';
import 'package:wassa/pages/test.dart';
import 'package:wassa/pages/login_page.dart';
import 'package:wassa/utils/auth.dart';
import 'package:wassa/screens/login_screen.dart';







void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/home' : (context) => Home(),
    '/test' : (context) => MyHomePage(),
    '/' : (context) => LoginPage(),
    '/login' : (context) => LoginScreen(),

  },
));

