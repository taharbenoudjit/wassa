import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:wassa/pages/event.dart';
import 'package:wassa/pages/DatePickersWidgets/day_picker_page.dart';
import 'package:wassa/pages/DatePickersWidgets/range_picker_page.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  DateTime startOfPeriod;
  DateTime endOfPeriod;
  DateTime firstDate;
  DateTime lastDate;

  int _selectedTab;

  final List<Widget> datePickers = <Widget> [
    DayPickerPage(events : events,),
    RangePickerPage(events:events,),
  ];
  @override
  void initState(){
    super.initState();

    _selectedTab = 0;

    DateTime now = DateTime.now();

    firstDate = now.subtract(Duration(days: 10));
    lastDate = now.add(Duration(minutes : 10));

    startOfPeriod = firstDate;
    endOfPeriod = lastDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: datePickers[_selectedTab],
        bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.white.withOpacity(0.5))
          ),
        ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range), title: Text("Day")
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range), title:Text("Range")
              ),
            ],
            fixedColor: Colors.yellow,
            currentIndex: _selectedTab,
            onTap: (newIndex){
              setState(() {
                _selectedTab = newIndex;
              });
            }
          ),
        ) ,
      ),
    );
  }
}


final List<Event> events = [
  Event(DateTime.now(), "Today event"),
  Event(DateTime.now().subtract(Duration(days: 3)), "Ev1"),
  Event(DateTime.now().subtract(Duration(days: 13)), "Ev2"),
  Event(DateTime.now().subtract(Duration(days: 30)), "Ev3"),
  Event(DateTime.now().add(Duration(days: 3)), "Ev4"),
  Event(DateTime.now().add(Duration(days: 13)), "Ev5"),
  Event(DateTime.now().add(Duration(days: 30)), "Ev6"),
];


