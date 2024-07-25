import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/splash/splashscreen.dart';
import 'package:todoapp/services/db_service/db_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    DbService().openMyDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

//https://www.figma.com/design/uWOjFsCHliaxUcdkWST0bP/Task-Wan---Task-Management-(Community)?node-id=105-2&t=Vg9KSp2z5Rn9Y0en-0
