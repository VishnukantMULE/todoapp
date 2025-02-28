import 'package:flutter/material.dart';
import 'package:todoapp/theme/appcolors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback buttonClick;
  const AppButton({super.key,required this.text,required this.buttonClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(onPressed: buttonClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            fixedSize: Size(MediaQuery.of(context).size.width*0.40, 55)

          ),
          child: Text(text,style: TextStyle(color: Colors.white,fontSize: 18),)),
    );
  }
}
