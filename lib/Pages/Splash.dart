import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kezel/Pages/home.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>Home()
              //  Auth()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("GeeksForGeeks")),
      body: Center(
          child:Text("Home page",textScaleFactor: 2,)
      ),
    );
  }
}