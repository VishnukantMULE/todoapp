import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/app.dart';
import 'package:todoapp/screens/auth/login/login_view.dart';
import 'package:todoapp/screens/home/home_view.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>App()));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginView()));
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeview()));
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center
        (
        child: Image.asset('assets/gifs/splash.gif'),
      ),
    );
  }
}
