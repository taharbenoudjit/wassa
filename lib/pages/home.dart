import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton.icon(onPressed: (){},
                    icon: Icon(Icons.menu), 
                ),
                Image(
                  image: NetworkImage('https://wassa.io/images/homepage/logo-wassa.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
