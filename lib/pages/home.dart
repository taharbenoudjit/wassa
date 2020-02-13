import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  int nbC = 0;
  int rtt = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.purple[300],
          body: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.menu, color: Colors.white),
                      onPressed: (){},
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, top: 20.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://wassa.io/images/homepage/logo-wassa.png'),
                        radius: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 170,
                      height: 140,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 7.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Column(
                            children: <Widget>[
                              Text('$nbC',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Center(
                                child: Text('Congés payés',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Center(
                                child: Text('restants',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 140.0,
                      width: 170.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 7.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Column(
                            children: <Widget>[
                              Text('$rtt',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Center(
                                child: Text('RTT',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Center(
                                child: Text('restants',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Container(
                  height: 400.0,
                  width: 340.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 7.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('2019',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                                Text('September',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text('21/09',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: (){},
                                  child: Icon(Icons.file_download, color: Colors.purpleAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.17,
            child: Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Compte Rendu d'Activité",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[300],
                            fontSize: 20.0,

                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.purple[300],
                          size: 40,
                        ),
                        Column(
                          children: <Widget>[
                            Text("Vous avez jusqu'au 31/01 pour ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            ),
                            Text("remplir et valider votre CRA",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: (){ Navigator.pushNamed(context, '/test');},
                          child: Text("Actualiser",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                          color: Colors.purple[300],
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ),
        ),
        ),
      ],
    );
  }
}
