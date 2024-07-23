import 'package:flutter/material.dart';
import 'package:todoapp/screens/splash/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

//https://www.figma.com/design/uWOjFsCHliaxUcdkWST0bP/Task-Wan---Task-Management-(Community)?node-id=105-2&t=Vg9KSp2z5Rn9Y0en-0