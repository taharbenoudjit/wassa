import 'package:flutter/material.dart';

import 'package:flutter_date_pickers/flutter_date_pickers.dart';



class diary extends StatefulWidget {
  @override
  _diaryState createState() => _diaryState();


}

class _diaryState extends State<diary> {

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Calendrier"),
      ),
    );
  }
}
