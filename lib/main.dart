import 'package:flutter/material.dart';
import 'package:todoapp/screens/auth/login/login_view.dart';
import 'package:todoapp/screens/auth/register/register_view.dart';

void main() {
  runApp(const TodoAPP());
}

class TodoAPP extends StatefulWidget {
  const TodoAPP({super.key});

  @override
  State<TodoAPP> createState() => _TodoAPPState();
}

class _TodoAPPState extends State<TodoAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
      // routes: {
      //   '/':(context)=>RegisterView()
      // },
    );
  }
}
