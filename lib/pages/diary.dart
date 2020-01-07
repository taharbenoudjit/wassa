import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class diary extends StatefulWidget {
  @override
  _diaryState createState() => _diaryState();
}

class _diaryState extends State<diary> {

  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TableCalendar(calendarController: _controller,),
            ],
          ),
        ),
      ),
    );

  }
}
