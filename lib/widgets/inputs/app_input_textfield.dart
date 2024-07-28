import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';

class AppInputTextField extends StatelessWidget {
  final String hinttext;
  final int maxline;
  final TextEditingController inputController;
  const AppInputTextField({super.key,required this.hinttext,required this.maxline,required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxline,
        controller: inputController,
        decoration: InputDecoration(
            hintText:hinttext,
            hintStyle: const TextStyle(color: Appcolors.black2,fontWeight: FontWeight.w500),

            border: const OutlineInputBorder(
            )
        ),
      ),
    );
  }
}
