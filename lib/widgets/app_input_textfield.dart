import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInputTextField extends StatelessWidget {
  final String hinttext;
  final int maxline;
  const AppInputTextField({super.key,required this.hinttext,required this.maxline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxline,
        decoration: InputDecoration(
            hintText:hinttext,

            border: OutlineInputBorder(

            )
        ),
      ),
    );
  }
}
