import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconInputPasswordTextfield extends StatelessWidget {

  final IconData iconSymbol;
  final String hintText;
  final TextEditingController inputController;
  const IconInputPasswordTextfield({super.key,required this.iconSymbol,required this.inputController,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(

            hintText: hintText,
            prefixIcon: Icon(iconSymbol),
            border: OutlineInputBorder()

        ),
        controller: inputController,
      ),
    );
  }
}
