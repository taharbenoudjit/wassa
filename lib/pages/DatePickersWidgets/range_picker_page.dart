import 'package:flutter/material.dart';
import 'package:wassa/pages/event.dart';
import 'package:wassa/pages/picker_dialog.dart';
import 'package:wassa/pages/selector_btn.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';


class RangePickerPage extends StatefulWidget {

  final List<Event> events;
  const RangePickerPage({Key key, this.events}) : super(key:key);

  @override
  _RangePickerPageState createState() => _RangePickerPageState();
}

class _RangePickerPageState extends State<RangePickerPage> {


    DateTime _firstDate;
    DateTime _lastDate;
    DatePeriod _selectedPeriod;

    Color selectedPeriodStartColor;
    Color selectedPeriodLastColor;
    Color selectedPeriodMiddleColor;

    @override
    void initState(){
      super.initState();

      _firstDate = DateTime.now().subtract(Duration(days : 45));
      _lastDate = DateTime.now().add(Duration(days: 45));

      DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 4));
      DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 8));
      _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
    }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();

      //defaults for styles
      selectedPeriodLastColor = Theme.of(context).accentColor;
      selectedPeriodMiddleColor = Theme.of(context).accentColor;
      selectedPeriodStartColor = Theme.of(context).accentColor;
    }

    @override
    Widget build(BuildContext context) {

      // add selected colors to default settings
      DatePickerRangeStyles styles = DatePickerRangeStyles(
        selectedPeriodLastDecoration: BoxDecoration(
            color: selectedPeriodLastColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
        selectedPeriodStartDecoration: BoxDecoration(
          color: selectedPeriodStartColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
        ),
        selectedPeriodMiddleDecoration: BoxDecoration(
            color: selectedPeriodMiddleColor, shape: BoxShape.rectangle),
      );


      return Flex(
        direction: MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
          :Axis.horizontal,

        children: <Widget>[
          Expanded(
            child: RangePicker(
              selectedPeriod: _selectedPeriod,
              onChanged: _onSelectedDateChanged,
              firstDate: _firstDate,
              lastDate: _lastDate,
              datePickerStyles: styles,
              eventDecorationBuilder: _eventDecorationBuilder,
            ),
          ),

          Container(
            child: Padding(
              padding : const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Selected date styles",
                  style: Theme.of(context).textTheme.subhead,
                  ),
                  _stylesBlock(),
                  _selectedBlock(),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // block witch show information about selected date and boundaries of the selected period
    Widget _selectedBlock(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _selectedPeriod != null
          ?Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Text("Selected period boundaries: "),
            ),
            Text(_selectedPeriod.start.toString()),
            Text(_selectedPeriod.end.toString()),
          ])
              :Container()
        ],
      );
    }

  //block with color vuttons inside
  Widget _stylesBlock(){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ColorSelectorBtn(
              title: "start",
              color: selectedPeriodStartColor,
              showDialogFunction: _showSelectedStartColorDialog,
            ),
            SizedBox(width: 12.0),
            ColorSelectorBtn(
              title: "Middel",
              color: selectedPeriodMiddleColor,
              showDialogFunction: _showSelectedMiddleColorDialog,
            ),
            ColorSelectorBtn(
              title:"End",
              color: selectedPeriodLastColor,
              showDialogFunction: _showSelectedEndColorDialog,
            )
          ],
        ),
      );
    }

    // select background color for the first date of the selcted period
  void _showSelectedStartColorDialog() async{
      Color newSelectedColor = await showDialog(
        context: context,
      builder: (_) => ColorPickerDialog(
        selectedColor: selectedPeriodStartColor,
      ));

      if (newSelectedColor != null)
        setState(() {
          selectedPeriodStartColor = newSelectedColor;
        });

  }

  // select bacjground color for the last date of the slected period
  void _showSelectedEndColorDialog() async {
      Color newSelectedColor = await showDialog(
          context: context,
      builder: (_) => ColorPickerDialog(
        selectedColor: selectedPeriodLastColor,
      ));

      if (newSelectedColor != null)
        setState(() {
          selectedPeriodLastColor = newSelectedColor;
        });
  }

  // select bacjgrounf color for the middle dates of the selcted period
  void _showSelectedMiddleColorDialog() async {
      Color newSelectedColor = await showDialog(
        context: context,
      builder: (_) => ColorPickerDialog(
        selectedColor: selectedPeriodMiddleColor,
      ));

      if(newSelectedColor != null)
        setState(() {
          selectedPeriodMiddleColor = newSelectedColor;
        });
  }

  void _onSelectedDateChanged(DatePeriod newPeriod){
      setState(() {
        _selectedPeriod = newPeriod;
      });
  }

  EventDecoration _eventDecorationBuilder(DateTime date){
      List<DateTime> eventsDates = widget.events?.map<DateTime>((Event e) => e.date)?.toList();
      bool isEventDate = eventsDates?.any((DateTime d) => date.year == d.year && date.month == d.month && d.day == date.day) ?? false;

      BoxDecoration roundedBorder = BoxDecoration(
        border: Border.all(
          color:Colors.green,
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0))
      );

      return isEventDate
          ?EventDecoration(boxDecoration: roundedBorder)
          :null;
  }
}


