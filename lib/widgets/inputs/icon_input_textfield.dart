import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconInputTextfield extends StatelessWidget {
  final IconData iconSymbol;
  final String hintText;
  final TextEditingController inputController;
  const IconInputTextfield({super.key,required this.iconSymbol,required this.hintText,required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

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
