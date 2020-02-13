import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wassa/pages/delayed_animation.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {


  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;

  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener((){
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Center(
        child: Column(
          children: <Widget>[
            AvatarGlow(
              endRadius: 90,
              duration: Duration(seconds: 2),
              glowColor: Colors.white24,
              repeat: true,
              repeatPauseDuration: Duration(seconds: 2),
              startDelay: Duration(seconds: 1),
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: Image.network('https://wassa.io/images/homepage/logo-wassa.png'),
                  radius: 50.0,
                ),
              ),
            ),

            DelayedAnimation(
              child: Text(
                "Bienvenue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                  color: color
                ),
              ),
              delay: delayedAmount + 1000,
            ),
            DelayedAnimation(
              child: Text(
                "Je suis (nom app)",
                style: TextStyle(
                  fontSize: 25.0,
                  color: color
                ),
              ),
              delay: delayedAmount + 2000,
            ),
            SizedBox(
              height: 40.0,
            ),

            DelayedAnimation(
              child: Text(
                "Votre nouvelle application de",
                style: TextStyle(
                  fontSize: 20.0,
                  color: color
                ),
              ),
              delay: delayedAmount + 3000,
            ),

            DelayedAnimation(
              child: Text("Gestion des CRA",
              style: TextStyle(
                fontSize: 20.0,
                color: color
              ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),

            DelayedAnimation(
              child: GestureDetector(
                onTapDown: _onTapDown,
                onTapUp: _onTapUp,
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Transform.scale(
                    scale: _scale,
                child: _animatedButtonUI,),
              ),
              delay: delayedAmount + 4000,
            ),
            SizedBox(height: 50.0),
            DelayedAnimation(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: Text(
                  "Je suis un collaborateur externe",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: color
                  ),
                ),
              ),
              delay: delayedAmount + 5000,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        "Je connecte",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.purple[300],
        ),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details){
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details){
    _controller.reverse();
  }

}

